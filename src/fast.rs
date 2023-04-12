use std::cmp::min;

// use debug_print::{debug_print as dprint, debug_println as dprintln};

use crate::Matrix;

// ref: https://github.com/flame/how-to-optimize-gemm/blob/master/src/MMult_4x4_15.c
const nc: usize = 1000;
const mc: usize = 256;
const kc: usize = 128;

pub fn matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix) {
    for jc in (0..n).step_by(nc) {
        for pc in (0..k).step_by(kc) {
            let ik = min(pc + kc, k);
            let Bc = B.pack_into(pc, ik, jc, min(jc + nc, n));
            for ic in (0..m).step_by(mc) {
                // dprintln!("ic: {ic}, mc: {mc}, pc: {pc}, kc: {kc}");
                let Ac = A.pack_into(ic, min(ic + mc, m), pc, ik);
                //
                // Macrokernel
                //
                for jr in (0..nc).step_by(Bc.col) {
                    for ir in (0..mc).step_by(Ac.row) {
                        //
                        // Microkernel
                        //
                        for pr in 0..min(kc, Ac.col /* or Bc.row */) {
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

#[cfg(test)]
mod tests {
    use super::*;
    use crate::naive;

    fn matmul_helper(size: usize) {
        let m: usize = size;
        let k: usize = size;
        let n: usize = size;

        let A = Matrix::serial_new(m, k);
        let B = Matrix::serial_new(k, n);
        let mut C = Matrix::new(m, n);

        matmul(m, k, n, &A, &B, &mut C);

        let mut C2 = Matrix::new(m, n);
        naive::matmul(m, k, n, &A, &B, &mut C2);

        assert_eq!(C, C2);
    }

    #[test]
    fn test_simple_matmul() {
        // simple cases: until the smallest step
        // no step_by occurs, meaning this is the same with iterating by 1
        for size in 1..kc {
            matmul_helper(size);
        }
    }

    #[test]
    fn test_matmul() {
        let mut i: usize = 2;
        loop {
            matmul_helper(i);
            i = i.pow(2);

            if i > 512 {
                break;
            }
        }
    }
}
