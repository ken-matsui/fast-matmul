use std::cmp::min;

#[cfg(target_arch = "aarch64")]
use core::arch::aarch64::*;
#[cfg(target_arch = "x86_64")]
use std::arch::x86_64::*;

// use debug_print::{debug_print as dprint, debug_println as dprintln};

use crate::param::BEST_PARAM;
use crate::{Matrix, Param};

pub fn matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix, param: Param) {
    for jc in (0..n).step_by(param.nc) {
        for pc in (0..k).step_by(param.kc) {
            let ik = min(pc + param.kc, k);
            let Bc = B.pack_into(pc, ik, jc, min(jc + param.nc, n));

            for ic in (0..m).step_by(param.mc) {
                // dprintln!("ic: {ic}, mc: {mc}, pc: {pc}, kc: {kc}");
                let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
                //
                // Macrokernel
                //
                for jr in (0..param.nc).step_by(Bc.col /* nr */) {
                    for ir in (0..param.mc).step_by(Ac.row /* mr */) {
                        //
                        // Microkernel
                        //
                        for pr in 0..min(param.kc, Ac.col /* or Bc.row */) {
                            for j in jr..Bc.col {
                                for i in ir..Ac.row {
                                    *C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

pub fn best_matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix) {
    matmul(m, k, n, A, B, C, BEST_PARAM);
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::naive;
    use itertools::iproduct;

    fn matmul_helper(size: usize, param: Param) {
        let m: usize = size;
        let k: usize = size;
        let n: usize = size;

        let A = Matrix::seq_new(m, k);
        let B = Matrix::seq_new(k, n);

        let mut C = Matrix::zero_new(m, n);
        matmul(m, k, n, &A, &B, &mut C, param);

        let mut C2 = Matrix::zero_new(m, n);
        naive::matmul(m, k, n, &A, &B, &mut C2);

        assert_eq!(C, C2);
    }

    #[test]
    fn test_simple_matmul() {
        // simple cases: until the smallest step
        // no step_by occurs, meaning this is the same with iterating by 1
        for size in 1..Param::default().kc {
            matmul_helper(size, Param::default());
        }
    }

    #[test]
    fn test_matmul() {
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

    #[cfg(target_arch = "aarch64")]
    #[test]
    fn test_simd_matmul_4x4() {
        use core::arch::aarch64::*;

        let size = 4;
        let A = Matrix::seq_new(size, size);
        let B = Matrix::seq_new(size, size);
        let mut C = Matrix::zero_new(size, size);

        let i = 0;
        let j = 0;
        unsafe {
            let A0: uint32x4_t = vld1q_u32(A.get_ptr(i, j));
            let A1: uint32x4_t = vld1q_u32(A.get_ptr(i, j + 1));
            let A2: uint32x4_t = vld1q_u32(A.get_ptr(i, j + 2));
            let A3: uint32x4_t = vld1q_u32(A.get_ptr(i, j + 3));

            let B0: uint32x4_t = vld1q_u32(B.get_ptr(i, j));
            let B1: uint32x4_t = vld1q_u32(B.get_ptr(i, j + 1));
            let B2: uint32x4_t = vld1q_u32(B.get_ptr(i, j + 2));
            let B3: uint32x4_t = vld1q_u32(B.get_ptr(i, j + 3));

            let mut C0: uint32x4_t = vld1q_u32(C.get_ptr(i, j));
            let mut C1: uint32x4_t = vld1q_u32(C.get_ptr(i, j + 1));
            let mut C2: uint32x4_t = vld1q_u32(C.get_ptr(i, j + 2));
            let mut C3: uint32x4_t = vld1q_u32(C.get_ptr(i, j + 3));

            C0 = vmlaq_laneq_u32(C0, A0, B0, 0);
            C0 = vmlaq_laneq_u32(C0, A1, B0, 1);
            C0 = vmlaq_laneq_u32(C0, A2, B0, 2);
            C0 = vmlaq_laneq_u32(C0, A3, B0, 3);
            vst1q_u32(C.get_mut_ptr(i, j), C0);

            C1 = vmlaq_laneq_u32(C1, A0, B1, 0);
            C1 = vmlaq_laneq_u32(C1, A1, B1, 1);
            C1 = vmlaq_laneq_u32(C1, A2, B1, 2);
            C1 = vmlaq_laneq_u32(C1, A3, B1, 3);
            vst1q_u32(C.get_mut_ptr(i, j + 1), C1);

            C2 = vmlaq_laneq_u32(C2, A0, B2, 0);
            C2 = vmlaq_laneq_u32(C2, A1, B2, 1);
            C2 = vmlaq_laneq_u32(C2, A2, B2, 2);
            C2 = vmlaq_laneq_u32(C2, A3, B2, 3);
            vst1q_u32(C.get_mut_ptr(i, j + 2), C2);

            C3 = vmlaq_laneq_u32(C3, A0, B3, 0);
            C3 = vmlaq_laneq_u32(C3, A1, B3, 1);
            C3 = vmlaq_laneq_u32(C3, A2, B3, 2);
            C3 = vmlaq_laneq_u32(C3, A3, B3, 3);
            vst1q_u32(C.get_mut_ptr(i, j + 3), C3);
        }

        let mut C2 = Matrix::zero_new(size, size);
        naive::matmul(size, size, size, &A, &B, &mut C2);
        assert_eq!(C, C2);
    }

    #[cfg(target_arch = "x86_64")]
    fn test_simd_matmul_4x4() {
        use std::arch::x86_64::*;

        let size = 4;
        let A = Matrix::seq_new(size, size);
        let B = Matrix::seq_new(size, size);
        let mut C = Matrix::zero_new(size, size);

        let i = 0;
        let j = 0;
        unsafe {
            let A0: __m128i = _mm_loadu_si128(A.get_ptr(i, j) as *const _);
            let A1: __m128i = _mm_loadu_si128(A.get_ptr(i, j + 1) as *const _);
            let A2: __m128i = _mm_loadu_si128(A.get_ptr(i, j + 2) as *const _);
            let A3: __m128i = _mm_loadu_si128(A.get_ptr(i, j + 3) as *const _);

            let B0: __m128i = _mm_loadu_si128(B.get_ptr(i, j) as *const _);
            let B1: __m128i = _mm_loadu_si128(B.get_ptr(i, j + 1) as *const _);
            let B2: __m128i = _mm_loadu_si128(B.get_ptr(i, j + 2) as *const _);
            let B3: __m128i = _mm_loadu_si128(B.get_ptr(i, j + 3) as *const _);

            let mut C0: __m128i = _mm_loadu_si128(C.get_ptr(i, j) as *const _);
            let mut C1: __m128i = _mm_loadu_si128(C.get_ptr(i, j + 1) as *const _);
            let mut C2: __m128i = _mm_loadu_si128(C.get_ptr(i, j + 2) as *const _);
            let mut C3: __m128i = _mm_loadu_si128(C.get_ptr(i, j + 3) as *const _);

            C0 = _mm_add_epi32(C0, _mm_mullo_epi32(A0, B0));
            C0 = _mm_add_epi32(C0, _mm_mullo_epi32(A1, B0));
            C0 = _mm_add_epi32(C0, _mm_mullo_epi32(A2, B0));
            C0 = _mm_add_epi32(C0, _mm_mullo_epi32(A3, B0));
            _mm_storeu_si128(C.get_mut_ptr(i, j) as *mut _, C0);

            C1 = _mm_add_epi32(C1, _mm_mullo_epi32(A0, B1));
            C1 = _mm_add_epi32(C1, _mm_mullo_epi32(A1, B1));
            C1 = _mm_add_epi32(C1, _mm_mullo_epi32(A2, B1));
            C1 = _mm_add_epi32(C1, _mm_mullo_epi32(A3, B1));
            _mm_storeu_si128(C.get_mut_ptr(i, j + 1) as *mut _, C1);

            C2 = _mm_add_epi32(C2, _mm_mullo_epi32(A0, B2));
            C2 = _mm_add_epi32(C2, _mm_mullo_epi32(A1, B2));
            C2 = _mm_add_epi32(C2, _mm_mullo_epi32(A2, B2));
            C2 = _mm_add_epi32(C2, _mm_mullo_epi32(A3, B2));
            _mm_storeu_si128(C.get_mut_ptr(i, j + 2) as *mut _, C2);

            C3 = _mm_add_epi32(C3, _mm_mullo_epi32(A0, B3));
            C3 = _mm_add_epi32(C3, _mm_mullo_epi32(A1, B3));
            C3 = _mm_add_epi32(C3, _mm_mullo_epi32(A2, B3));
            C3 = _mm_add_epi32(C3, _mm_mullo_epi32(A3, B3));
            _mm_storeu_si128(C.get_mut_ptr(i, j + 3) as *mut _, C3);
        }

        let mut C2 = Matrix::zero_new(size, size);
        naive::matmul(size, size, size, &A, &B, &mut C2);
        assert_eq!(C, C2);
    }
}
