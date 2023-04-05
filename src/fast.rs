use std::cmp::min;

// use debug_print::{debug_print as dprint, debug_println as dprintln};

use crate::Matrix;

const nc: usize = 20; // 128
const kc: usize = 20; // 64
const mc: usize = 20; // 32
const nr: usize = 20; // 32
const mr: usize = 20; // 32

pub fn matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix) {
    for jc in (0..n).step_by(nc) {
        for pc in (0..k).step_by(kc) {
            let Bc = B.pack_into(pc, min(pc + kc, k), jc, min(jc + nc, n));
            for ic in (0..m).step_by(mc) {
                // dprintln!("ic: {ic}, mc: {mc}, pc: {pc}, kc: {kc}");
                let Ac = A.pack_into(ic, min(ic + mc, m), pc, min(pc + kc, k));
                //
                // Macrokernel
                //
                for jr in (0..nc).step_by(nr) {
                    for ir in (0..mc).step_by(mr) {
                        //
                        // Microkernel
                        //
                        for pr in 0..kc {
                            for j in jr..nr {
                                for i in ir..mr {
                                    // dprint!("[i: {i}, pr: {pr}], ");
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

    #[test]
    fn test_matmul() {
        let m: usize = 200;
        let k: usize = 200;
        let n: usize = 200;

        let A = Matrix::serial_new(m, k);
        let B = Matrix::serial_new(k, n);
        let mut C = Matrix::new(m, n);

        matmul(m, k, n, &A, &B, &mut C);

        let mut C2 = Matrix::new(m, n);
        naive::matmul(m, k, n, &A, &B, &mut C2);

        assert_eq!(C, C2);
    }
}
