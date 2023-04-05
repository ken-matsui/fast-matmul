use crate::matrix::Matrix;

const nc: usize = 2;
const kc: usize = 2;
const mc: usize = 2;
const nr: usize = 2;
const mr: usize = 2;

pub fn matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix) {
    for jc in (0..n).step_by(nc) {
        for pc in (0..k).step_by(kc) {
            let Bc = B.pack_into(pc, pc + kc, jc, jc + nc);
            for ic in (0..m).step_by(mc) {
                let Ac = A.pack_into(ic, ic + mc, pc, pc + kc);
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
    use crate::matrix::Matrix;
    use crate::test_util::expected_8x8;

    #[test]
    fn test_matmul() {
        let m: usize = 8;
        let k: usize = 8;
        let n: usize = 8;

        let A = Matrix::serial_new(m, k);
        let B = Matrix::serial_new(k, n);
        let mut C = Matrix::new(m, n);

        matmul(m, k, n, &A, &B, &mut C);
        assert_eq!(C, expected_8x8());
    }
}
