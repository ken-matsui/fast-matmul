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
}
