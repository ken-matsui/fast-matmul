use crate::matrix::MatrixPtr;

pub(crate) fn matmul(m: usize, k: usize, n: usize, A: MatrixPtr, B: MatrixPtr, C: MatrixPtr) {
    for j in 0..n {
        for i in 0..m {
            for p in 0..k {
                unsafe {
                    *C.get(i, j) += *A.get(i, p) * *B.get(p, j);
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

        let mut A = Matrix::serial_new(m, k);
        let mut B = Matrix::serial_new(k, n);
        let mut C = Matrix::new(m, n);

        matmul(m, k, n, A.as_mut_ptr(), B.as_mut_ptr(), C.as_mut_ptr());
        assert_eq!(C, expected_8x8());
    }
}
