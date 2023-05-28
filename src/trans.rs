/// Matrix Transpose
use crate::Matrix;

pub fn naive(In: &Matrix, Out: &mut Matrix) {
    for row in 0..In.height {
        for col in 0..In.width {
            *Out.get_mut(col, row) = *In.get(row, col);
        }
    }
}

impl Matrix {
    #[inline(always)]
    pub fn transpose(&self) -> Matrix {
        // width and height should be swapped
        let mut tmp = Matrix::zero_new(self.height, self.width);
        naive(self, &mut tmp);
        tmp
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::matrix;

    fn is_transpose(A: &Matrix, B: &Matrix) -> bool {
        for row in 0..A.height {
            for col in 0..A.width {
                if A.get(row, col) != B.get(col, row) {
                    return false;
                }
            }
        }
        true
    }

    #[test]
    fn test_trans_impl_1() {
        let A = matrix![[21, 53], [7, 3]];
        let expected = matrix![[21, 7], [53, 3]];

        let At = A.transpose();
        assert_eq!(At, expected);
    }

    #[test]
    fn test_trans_impl_2() {
        let mut size: usize = 2;
        loop {
            let A = Matrix::rand_new(size, size);
            let At = A.transpose();

            assert!(is_transpose(&A, &At));
            size = size.pow(2);

            if size > 2048 {
                break;
            }
        }
    }

    #[test]
    fn test_trans_impl_imbalanced() {
        let width = 2;
        let height = 4;

        let A = Matrix::rand_new(width, height);
        let At = A.transpose();
        assert!(is_transpose(&A, &At));
    }

    #[test]
    fn test_naive() {
        let mut size: usize = 2;
        loop {
            let A = Matrix::rand_new(size, size);
            let mut At = Matrix::rand_new(size, size);

            naive(&A, &mut At);
            assert!(is_transpose(&A, &At));
            size = size.pow(2);

            if size > 2048 {
                break;
            }
        }
    }

    #[test]
    fn test_naive_imbalanced() {
        let width = 2;
        let height = 4;

        let A = Matrix::rand_new(width, height);
        let mut At = Matrix::rand_new(height, width);

        naive(&A, &mut At);
        assert!(is_transpose(&A, &At));
    }
}
