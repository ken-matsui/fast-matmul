/// Matrix Transpose
use crate::Matrix;

pub(crate) fn naive(In: &Matrix, Out: &mut Matrix) {
    let m = In.row;
    let n = In.col;

    for i in 0..m {
        for j in 0..n {
            *Out.get_ref_mut(j, i) = *In.get(i, j);
        }
    }
}

impl Matrix {
    pub(crate) fn transpose(&self) -> Matrix {
        let mut tmp = Matrix::zero_new(self.col, self.row);
        naive(self, &mut tmp);
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
    fn test_trans_impl_1() {
        let size: usize = 2;

        let mut A = Matrix::zero_new(size, size);
        A.insert(0, 0, 21);
        A.insert(1, 0, 53);
        A.insert(0, 1, 7);
        A.insert(1, 1, 3);

        let mut expected = Matrix::zero_new(size, size);
        expected.insert(0, 0, 21);
        expected.insert(1, 0, 7);
        expected.insert(0, 1, 53);
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

            assert!(is_transpose(size, size, &A, &At));
            size = size.pow(2);

            if size > 2048 {
                break;
            }
        }
    }

    #[test]
    fn test_trans_impl_imbalanced() {
        let m = 2;
        let n = 4;

        let A = Matrix::rand_new(m, n);
        let At = A.transpose();
        assert!(is_transpose(m, n, &A, &At));
    }

    #[test]
    fn test_naive() {
        let mut size: usize = 2;
        loop {
            let A = Matrix::rand_new(size, size);
            let mut At = Matrix::rand_new(size, size);

            naive(&A, &mut At);
            assert!(is_transpose(size, size, &A, &At));
            size = size.pow(2);

            if size > 2048 {
                break;
            }
        }
    }

    #[test]
    fn test_naive_imbalanced() {
        let m = 2;
        let n = 4;

        let A = Matrix::rand_new(m, n);
        let mut At = Matrix::rand_new(n, m);
        println!("{}", A);
        println!("{}", At);

        naive(&A, &mut At);
        assert!(is_transpose(m, n, &A, &At));
    }
}
