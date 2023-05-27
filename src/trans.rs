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
        let size: usize = 2;

        let mut A = Matrix::zero_new(size, size);
        A.insert(0, 0, 21);
        A.insert(0, 1, 53);
        A.insert(1, 0, 7);
        A.insert(1, 1, 3);

        let mut expected = Matrix::zero_new(size, size);
        expected.insert(0, 0, 21);
        expected.insert(0, 1, 7);
        expected.insert(1, 0, 53);
        expected.insert(1, 1, 3);

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
