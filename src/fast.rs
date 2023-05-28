use std::cmp::min;

use crate::param::BEST_PARAM;
use crate::{Matrix, Param};

pub fn matmul(A: &Matrix, B: &Matrix, C: &mut Matrix, param: Param) {
    let m = A.height /* = C.height */;
    let k = B.height /* = A.width */;
    let n = C.width /* = B.width */;

    for jc in (0..n).step_by(param.nc) {
        for pc in (0..k).step_by(param.kc) {
            let ik = min(pc + param.kc, k);
            let Bc = B.pack_into(pc, ik, jc, min(jc + param.nc, n));

            for ic in (0..m).step_by(param.mc) {
                let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
                //
                // Macrokernel
                //
                for ir in (0..param.mc).step_by(Ac.height /* mr */) {
                    for jr in (0..param.nc).step_by(Bc.width /* nr */) {
                        //
                        // Microkernel
                        //
                        for pr in 0..min(param.kc, Ac.width /* = Bc.height */) {
                            for i in ir..Ac.height {
                                for j in jr..Bc.width {
                                    *C.get_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

pub fn matmul_with_trans(A: &Matrix, B: &Matrix, C: &mut Matrix, param: Param) {
    let m = A.height /* = C.height */;
    let k = B.height /* = A.width */;
    let n = C.width /* = B.width */;

    for jc in (0..n).step_by(param.nc) {
        for pc in (0..k).step_by(param.kc) {
            let ik = min(pc + param.kc, k);
            // FIXME: assuming B is square
            let Bc = B.pack_into_col_major(pc, ik, jc, min(jc + param.nc, n));

            for ic in (0..m).step_by(param.mc) {
                let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
                //
                // Macrokernel
                //
                for ir in (0..param.mc).step_by(Ac.height /* mr */) {
                    for jr in (0..param.nc).step_by(Bc.height /* nr */) {
                        //
                        // Microkernel
                        //
                        for pr in 0..min(param.kc, Ac.width /* = Bc.width */) {
                            for i in ir..Ac.height {
                                for j in jr..Bc.height {
                                    *C.get_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(j, pr);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

// NOTE: optimized for BEST_PARAM
pub fn simd_matmul(A: &Matrix, B: &Matrix, C: &mut Matrix, param: Param) {
    let m = A.height /* = C.height */;
    let k = B.height /* = A.width */;
    let n = C.width /* = B.width */;

    let Bt = B.transpose(); // FIXME: assuming B is square

    for jc in (0..n).step_by(param.nc) {
        for pc in (0..k).step_by(param.kc) {
            let ik = min(pc + param.kc, k);
            let Bc = Bt.pack_into(pc, ik, jc, min(jc + param.nc, n));

            for ic in (0..m).step_by(param.mc) {
                let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
                //
                // Macrokernel
                //
                for ir in (0..param.mc).step_by(Ac.height /* mr */) {
                    for jr in (0..param.nc).step_by(Bc.width /* nr */) {
                        //
                        // Microkernel
                        //
                        // Comment out because this is just a 1 loop
                        // for pr in /* 1 */ 0..min(param.kc, Ac.width /* = Bc.height */) {
                        for i in /* 1024 */ ir..Ac.height {
                            for j in /* 128 */ jr..Bc.width {
                                #[cfg(target_arch = "x86_64")]
                                unsafe {
                                    use std::arch::x86_64::*;

                                    let mut buffer = vec![0; 4];
                                    let mut vc = _mm_loadu_si128(buffer.as_ptr() as *const _);

                                    for pr in
                                        (0..min(param.kc, Ac.width /* = Bc.height */)).step_by(4)
                                    {
                                        // load
                                        let va = _mm_loadu_si128(Ac.get_ptr(i, pr) as *const _);
                                        let vb = _mm_loadu_si128(Bc.get_ptr(j, pr) as *const _);

                                        // multiply and add
                                        vc = _mm_add_epi32(vc, _mm_mullo_epi32(va, vb));
                                    }

                                    // store
                                    _mm_storeu_si128(buffer.as_mut_ptr() as *mut _, vc);
                                    C.set(
                                        i + ic,
                                        j + jc,
                                        buffer[0] + buffer[1] + buffer[2] + buffer[3],
                                    );
                                }
                                #[cfg(target_arch = "aarch64")]
                                {
                                    let pr = 0;
                                    *C.get_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(j, pr);
                                }
                            }
                        }
                        // }
                    }
                }
            }
        }
    }
}

pub fn best_matmul(A: &Matrix, B: &Matrix, C: &mut Matrix) {
    simd_matmul(A, B, C, BEST_PARAM);
}

#[cfg(test)]
mod tests {
    use crate::param::BEST_PARAM;
    use crate::test_util::expected_8x8;
    use crate::*;
    use itertools::iproduct;

    fn matmul_helper(size: usize, param: Param) {
        let m: usize = size;
        let k: usize = size;
        let n: usize = size;

        let A = Matrix::rand_new(m, k);
        let B = Matrix::rand_new(k, n);

        let mut C = Matrix::zero_new(m, n);
        fast::matmul(&A, &B, &mut C, param);

        let mut C2 = Matrix::zero_new(m, n);
        naive::matmul(&A, &B, &mut C2);

        assert_eq!(C, C2);
    }

    #[test]
    fn test_matmul_1() {
        let m: usize = 8;
        let k: usize = 8;
        let n: usize = 8;

        let A = Matrix::seq_new(m, k);
        let B = Matrix::seq_new(k, n);
        let mut C = Matrix::zero_new(m, n);

        fast::matmul(&A, &B, &mut C, Param::new(1, 1, 1));
        assert_eq!(C, expected_8x8());
    }
    #[test]
    fn test_matmul_2() {
        let mut i: usize = 2;
        loop {
            matmul_helper(i, Param::default());
            i = i.pow(2);

            if i > 128 {
                break;
            }
        }
    }

    #[test]
    fn test_matmul_no_blocking_1() {
        // simple cases: until the smallest step
        // no step_by occurs, meaning this is the same with iterating by 1
        for size in 1..Param::default().kc {
            matmul_helper(size, Param::default());
        }
    }
    #[test]
    fn test_matmul_no_blocking_2() {
        let size = 4;

        let A = Matrix::rand_new(size, size);
        let B = Matrix::rand_new(size, size);
        let mut C = Matrix::zero_new(size, size);
        naive::matmul(&A, &B, &mut C);

        let mut C2 = Matrix::zero_new(size, size);
        fast::matmul(&A, &B, &mut C2, Param::new(1, 1, 1));
    }
    #[test]
    fn test_matmul_no_blocking_3() {
        let naive_param = Param::new(1, 1, 1);

        let mut i: usize = 2;
        loop {
            matmul_helper(i, naive_param);
            i = i.pow(2);

            if i > 128 {
                break;
            }
        }
    }

    #[test]
    fn test_small_pack_matmul() {
        let range = 0..=8; // 2^(0..=8) = 1..=256
        for (nc_exp, mc_exp, kc_exp) in iproduct!(range.clone(), range.clone(), range) {
            let param = Param::new(
                2_usize.pow(nc_exp),
                2_usize.pow(mc_exp),
                2_usize.pow(kc_exp),
            );
            matmul_helper(256, param);
        }
    }
    #[test]
    fn test_large_matmul() {
        matmul_helper(2048, BEST_PARAM);
    }

    #[cfg(target_arch = "x86_64")]
    #[test]
    fn test_simd_matmul_4x4() {
        use std::arch::x86_64::*;

        let size = 4;
        let A = Matrix::rand_new(size, size);
        let B = Matrix::rand_new(size, size);
        let Bt = B.transpose();
        let mut C = Matrix::zero_new(size, size);

        for i in 0..size {
            for j in 0..size {
                unsafe {
                    let mut buffer = vec![0; 4];
                    let mut vc = _mm_loadu_si128(buffer.as_ptr() as *const _);

                    for k in (0..size).step_by(4) {
                        // load
                        let va = _mm_loadu_si128(A.get_ptr(i, k) as *const _);
                        let vb = _mm_loadu_si128(Bt.get_ptr(j, k) as *const _);

                        // multiply and add
                        vc = _mm_add_epi32(vc, _mm_mullo_epi32(va, vb));
                    }

                    // store
                    _mm_storeu_si128(buffer.as_mut_ptr() as *mut _, vc);
                    C.set(i, j, buffer[0] + buffer[1] + buffer[2] + buffer[3]);
                }
            }
        }

        let mut C2 = Matrix::zero_new(size, size);
        naive::matmul(&A, &B, &mut C2);
        assert_eq!(C, C2);
    }

    fn matmul_with_trans_helper(size: usize, param: Param) {
        let m: usize = size;
        let k: usize = size;
        let n: usize = size;

        let A = Matrix::rand_new(m, k);
        let B = Matrix::rand_new(k, n);

        let mut C = Matrix::zero_new(m, n);
        fast::matmul_with_trans(&A, &B, &mut C, param);

        let mut C2 = Matrix::zero_new(m, n);
        naive::matmul(&A, &B, &mut C2);

        assert_eq!(C, C2);
    }

    #[test]
    fn test_matmul_with_trans_1() {
        let m: usize = 8;
        let k: usize = 8;
        let n: usize = 8;

        let A = Matrix::seq_new(m, k);
        let B = Matrix::seq_new(k, n);
        let mut C = Matrix::zero_new(m, n);

        fast::matmul_with_trans(&A, &B, &mut C, Param::new(1, 1, 1));
        assert_eq!(C, expected_8x8());
    }
    #[test]
    fn test_matmul_with_trans_2() {
        let mut i: usize = 2;
        loop {
            matmul_with_trans_helper(i, Param::default());
            i = i.pow(2);

            if i > 128 {
                break;
            }
        }
    }

    #[test]
    fn test_matmul_with_trans_no_blocking_1() {
        // simple cases: until the smallest step
        // no step_by occurs, meaning this is the same with iterating by 1
        for size in 1..Param::default().kc {
            matmul_with_trans_helper(size, Param::default());
        }
    }
    #[test]
    fn test_matmul_with_trans_no_blocking_2() {
        let size = 4;

        let A = Matrix::rand_new(size, size);
        let B = Matrix::rand_new(size, size);
        let mut C = Matrix::zero_new(size, size);
        naive::matmul_with_trans(&A, &B, &mut C);

        let mut C2 = Matrix::zero_new(size, size);
        fast::matmul(&A, &B, &mut C2, Param::new(1, 1, 1));
    }
    #[test]
    fn test_matmul_with_trans_no_blocking_3() {
        let naive_param = Param::new(1, 1, 1);

        let mut i: usize = 2;
        loop {
            matmul_with_trans_helper(i, naive_param);
            i = i.pow(2);

            if i > 128 {
                break;
            }
        }
    }

    #[test]
    fn test_small_pack_matmul_with_trans() {
        let range = 0..=8; // 2^(0..=8) = 1..=256
        for (nc_exp, mc_exp, kc_exp) in iproduct!(range.clone(), range.clone(), range) {
            let param = Param::new(
                2_usize.pow(nc_exp),
                2_usize.pow(mc_exp),
                2_usize.pow(kc_exp),
            );
            matmul_with_trans_helper(256, param);
        }
    }
    #[test]
    fn test_large_matmul_with_trans() {
        matmul_with_trans_helper(2048, BEST_PARAM);
    }

    // #[test]
    // fn test_simd_matmul() {
    //     let size = 2048;
    //
    //     let A = Matrix::seq_new(size, size);
    //     let B = Matrix::seq_new(size, size);
    //
    //     let mut C = Matrix::zero_new(size, size);
    //     fast::simd_matmul(&A, &B, &mut C, BEST_PARAM);
    //
    //     let mut C2 = Matrix::zero_new(size, size);
    //     fast::matmul(&A, &B, &mut C2, BEST_PARAM);
    //
    //     assert_eq!(C, C2);
    // }
}
