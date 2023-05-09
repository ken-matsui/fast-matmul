use std::cmp::min;
use std::fmt::{self, Display, Formatter};

// use debug_print::{debug_print as dprint, debug_println as dprintln};

use crate::Matrix;

#[derive(Copy, Clone)]
pub struct Param {
    pub nc: usize,
    pub mc: usize,
    pub kc: usize,
}

impl Default for Param {
    fn default() -> Self {
        Self {
            nc: 1000,
            mc: 64,
            kc: 32,
        }
    }
}

impl Param {
    pub fn new(nc: usize, mc: usize, kc: usize) -> Self {
        Self { nc, mc, kc }
    }
}

impl Display for Param {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "(nc: {}, mc: {}, kc: {})", self.nc, self.mc, self.kc)
    }
}

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
                                // This assert lets the compiler optimize out the bounds checks.
                                assert!(j * Bc.row + pr < Bc.inner.len());

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

        matmul(m, k, n, &A, &B, &mut C, Param::default());

        let mut C2 = Matrix::new(m, n);
        naive::matmul(m, k, n, &A, &B, &mut C2);

        assert_eq!(C, C2);
    }

    #[test]
    fn test_simple_matmul() {
        // simple cases: until the smallest step
        // no step_by occurs, meaning this is the same with iterating by 1
        for size in 1..Param::default().kc {
            matmul_helper(size);
        }
    }

    #[test]
    fn test_matmul() {
        let mut i: usize = 2;
        loop {
            matmul_helper(i);
            i = i.pow(2);

            if i > 128 {
                break;
            }
        }
    }
}
