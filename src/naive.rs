use crate::Matrix;

pub fn matmul(A: &Matrix, B: &Matrix, C: &mut Matrix) {
    let m = A.row /* or C.row */;
    let k = A.col /* or B.row */;
    let n = B.col /* or C.col */;

    for i in 0..m {
        for j in 0..n {
            for p in 0..k {
                *C.get_ref_mut(j, i) += A.get(p, i) * B.get(j, p);
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::test_util::expected_8x8;

    #[test]
    fn test_matmul() {
        let m: usize = 8;
        let k: usize = 8;
        let n: usize = 8;

        let A = Matrix::seq_new(m, k);
        let B = Matrix::seq_new(k, n);
        let mut C = Matrix::zero_new(m, n);

        matmul(&A, &B, &mut C);
        assert_eq!(C, expected_8x8());
    }

    #[test]
    fn test_matmul_2() {
        let size = 2;

        let mut A = Matrix::zero_new(size, size);
        A.insert(0, 0, 21);
        A.insert(1, 0, 53);
        A.insert(0, 1, 7);
        A.insert(1, 1, 3);

        let mut B = Matrix::zero_new(size, size);
        B.insert(0, 0, 543);
        B.insert(1, 0, 56);
        B.insert(0, 1, 25);
        B.insert(1, 1, 87);

        let mut C = Matrix::zero_new(size, size);
        matmul(&A, &B, &mut C);

        let mut C2 = Matrix::zero_new(size, size);
        C2.insert(0, 0, 12728);
        C2.insert(1, 0, 5787);
        C2.insert(0, 1, 3876);
        C2.insert(1, 1, 653);

        assert_eq!(C, C2);
    }
}
