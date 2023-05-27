use crate::Matrix;

pub fn matmul(A: &Matrix, B: &Matrix, C: &mut Matrix) {
    let m = A.height /* = C.height */;
    let n = B.height /* = A.width */;
    let k = C.width /* = B.width */;

    for i in 0..m {
        for j in 0..k {
            for p in 0..n {
                *C.get_mut(i, j) += A.get(i, p) * B.get(p, j);
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use crate::test_util::expected_8x8;
    use crate::{matrix, naive, Matrix};

    #[test]
    fn test_matmul() {
        let m: usize = 8;
        let n: usize = 8;
        let k: usize = 8;

        // A(m * n) * B(n * k) => C(m * k)
        let A = Matrix::seq_new(m, n);
        let B = Matrix::seq_new(n, k);
        let mut C = Matrix::zero_new(m, k);

        naive::matmul(&A, &B, &mut C);
        assert_eq!(C, expected_8x8());
    }

    #[test]
    fn test_matmul_2() {
        let m = 2;
        // let n = 3;
        let k = 2;

        let A = matrix![[1, 2, 3], [4, 5, 6]];
        let B = matrix![[7, 8], [9, 10], [11, 12]];
        let mut C = Matrix::zero_new(m, k);
        naive::matmul(&A, &B, &mut C);

        let expected = matrix![[58, 64], [139, 154]];
        assert_eq!(C, expected);
    }

    #[test]
    fn test_matmul_3() {
        let size = 2;

        let mut A = Matrix::zero_new(size, size);
        A.insert(0, 0, 21);
        A.insert(0, 1, 53);
        A.insert(1, 0, 7);
        A.insert(1, 1, 3);

        let mut B = Matrix::zero_new(size, size);
        B.insert(0, 0, 543);
        B.insert(0, 1, 56);
        B.insert(1, 0, 25);
        B.insert(1, 1, 87);

        let mut C = Matrix::zero_new(size, size);
        naive::matmul(&A, &B, &mut C);

        let mut expected = Matrix::zero_new(size, size);
        expected.insert(0, 0, 12728);
        expected.insert(0, 1, 5787);
        expected.insert(1, 0, 3876);
        expected.insert(1, 1, 653);

        assert_eq!(C, expected);
    }
}
