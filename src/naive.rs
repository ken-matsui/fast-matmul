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

pub fn matmul_with_trans(A: &Matrix, B: &Matrix, C: &mut Matrix) {
    let Bt = B.transpose(); // FIXME: assuming B is square

    let m = A.height /* = C.height */;
    let n = B.height /* = A.width */;
    let k = C.width /* = B.width */;

    for i in 0..m {
        for j in 0..k {
            for p in 0..n {
                *C.get_mut(i, j) += A.get(i, p) * Bt.get(j, p);
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use crate::test_util::expected_8x8;
    use crate::{matrix, naive, Matrix};

    #[test]
    fn test_matmul_1() {
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

        let A = matrix![[21, 53], [7, 3]];
        let B = matrix![[543, 56], [25, 87]];

        let mut C = Matrix::zero_new(size, size);
        naive::matmul(&A, &B, &mut C);

        let expected = matrix![[12728, 5787], [3876, 653]];
        assert_eq!(C, expected);
    }

    #[test]
    fn test_matmul_4() {
        let size = 2;

        let A = matrix![[1, 2], [3, 4]];
        let B = matrix![[5, 6], [7, 8]];

        let mut C = Matrix::zero_new(size, size);
        naive::matmul(&A, &B, &mut C);

        let expected = matrix![[19, 22], [43, 50]];
        assert_eq!(C, expected);
    }

    #[test]
    fn test_matmul_5() {
        let m = 2;
        let n = 3;

        let A = matrix![[432, 53], [32, 52], [32, 12]];
        let B = matrix![[4, 2, 5], [3, 145, 2]];

        let mut C = Matrix::zero_new(m, n);
        naive::matmul(&A, &B, &mut C);

        let expected = matrix![[1887, 8549], [284, 7604], [164, 1804]];
        assert_eq!(C, expected);
    }

    #[test]
    fn test_matmul_6() {
        let m = 3;
        let n = 2;

        let A = matrix![[4, 2, 5], [3, 145, 2]];
        let B = matrix![[432, 53], [32, 52], [32, 12]];

        let mut C = Matrix::zero_new(m, n);
        naive::matmul(&A, &B, &mut C);

        let expected = matrix![[1952, 376, 192], [6000, 7723, 4736]];
        assert_eq!(C, expected);
    }

    #[test]
    fn test_matmul_7() {
        let m = 5;
        let n = 1;

        let A = matrix![[4, 2, 5, 3, 145]];
        let B = matrix![[63], [4321], [43], [3], [45]];

        let mut C = Matrix::zero_new(m, n);
        naive::matmul(&A, &B, &mut C);

        let expected = matrix![[15643, 17520, 403, 102, 2268415]];
        assert_eq!(C, expected);
    }

    #[test]
    fn test_matmul_8() {
        let m = 1;
        let n = 5;

        let A = matrix![[63], [4321], [43], [3], [45]];
        let B = matrix![[4, 2, 5, 3, 145]];

        let mut C = Matrix::zero_new(m, n);
        naive::matmul(&A, &B, &mut C);

        let expected = matrix![[252], [17284], [172], [12], [180]];
        assert_eq!(C, expected);
    }

    #[test]
    fn test_matmul_with_transpose() {
        let m: usize = 8;
        let n: usize = 8;
        let k: usize = 8;

        // A(m * n) * B(n * k) => C(m * k)
        let A = Matrix::seq_new(m, n);
        let B = Matrix::seq_new(n, k);
        let mut C = Matrix::zero_new(m, k);

        naive::matmul_with_trans(&A, &B, &mut C);
        assert_eq!(C, expected_8x8());
    }
}
