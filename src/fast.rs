use std::cmp::min;
use std::fmt::{self, Display, Formatter};

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
}
