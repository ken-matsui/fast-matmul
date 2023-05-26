/// Matrix Transpose
use crate::Matrix;

fn naive(m: usize, n: usize, A: &Matrix, B: &mut Matrix) {
    for i in 0..m {
        for j in 0..n {
            *B.get_ref_mut(j, i) = *A.get(i, j);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn is_transpose(m: usize, n: usize, A: &Matrix, B: &Matrix) -> bool {
        for i in 0..m {
            for j in 0..n {
                if A.get(i, j) != B.get(j, i) {
                    return false;
                }
            }
        }
        true
    }

    #[test]
    fn test_naive() {
        let mut i: usize = 2;
        loop {
            let A = Matrix::rand_new(i, i);
            let mut B = Matrix::rand_new(i, i);

            naive(i, i, &A, &mut B);
            assert!(is_transpose(i, i, &A, &B));
            i = i.pow(2);

            if i > 2048 {
                break;
            }
        }
    }
}
