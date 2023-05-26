/// Matrix Transpose
use crate::Matrix;

pub(crate) fn naive(m: usize, n: usize, In: &Matrix, Out: &mut Matrix) {
    for i in 0..m {
        for j in 0..n {
            *Out.get_ref_mut(j, i) = *In.get(i, j);
        }
    }
}

impl Matrix {
    pub(crate) fn transpose(&self) -> Matrix {
        let mut tmp = Matrix::zero_new(self.row, self.col);
        naive(self.row, self.col, self, &mut tmp);
        tmp
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
    fn test_trans_impl() {
        let mut size: usize = 2;
        loop {
            let A = Matrix::rand_new(size, size);
            let mut At = A.transpose();

            assert!(is_transpose(size, size, &A, &At));
            size = size.pow(2);

            if size > 2048 {
                break;
            }
        }
    }

    #[test]
    fn test_naive() {
        let mut size: usize = 2;
        loop {
            let A = Matrix::rand_new(size, size);
            let mut At = Matrix::rand_new(size, size);

            naive(size, size, &A, &mut At);
            assert!(is_transpose(size, size, &A, &At));
            size = size.pow(2);

            if size > 2048 {
                break;
            }
        }
    }
}
