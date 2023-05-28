use crate::matrix::Value;
use crate::Matrix;

use std::ops::Index;

#[macro_export]
macro_rules! matrix {
    ($([$($x:expr),* $(,)*]),+ $(,)*) => {{
        $crate::Matrix::from(vec![$([$($x,)*],)*])
    }};
}

trait FixedArray: Index<usize, Output = Value> {
    fn len() -> usize;
}
macro_rules! impl_arr_init {
    (__impl $n: expr) => (
        impl FixedArray for [Value; $n] {
            fn len() -> usize { $n }
        }
    );
    () => ();
    ($n: expr, $($m:expr,)*) => (
        impl_arr_init!(__impl $n);
        impl_arr_init!($($m,)*);
    )
}
impl_arr_init!(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,);

impl<V: FixedArray> From<Vec<V>> for Matrix {
    fn from(value: Vec<V>) -> Self {
        let width = V::len();
        let height = value.len();

        let mut matrix = Matrix::zero_new(width, height);

        #[allow(clippy::needless_range_loop)]
        for row in 0..height {
            for col in 0..width {
                matrix.set(row, col, value[row][col]);
            }
        }
        matrix
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_from_1() {
        let matrix = Matrix::from(vec![[1, 2, 3], [4, 5, 6]]);
        assert_eq!(matrix.width, 3);
        assert_eq!(matrix.height, 2);
        assert_eq!(matrix.inner.len(), 6);
        assert_eq!(matrix.inner, vec![1, 2, 3, 4, 5, 6]);
    }
    #[test]
    fn test_from_2() {
        let matrix = Matrix::from(vec![[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
        assert_eq!(matrix.width, 3);
        assert_eq!(matrix.height, 3);
        assert_eq!(matrix.inner.len(), 9);
        assert_eq!(matrix.inner, vec![1, 2, 3, 4, 5, 6, 7, 8, 9]);
    }
    #[test]
    fn test_from_3() {
        let matrix = Matrix::from(vec![[1, 2], [3, 4], [5, 6]]);
        assert_eq!(matrix.width, 2);
        assert_eq!(matrix.height, 3);
        assert_eq!(matrix.inner.len(), 6);
        assert_eq!(matrix.inner, vec![1, 2, 3, 4, 5, 6]);
    }

    #[test]
    fn test_matrix_macro_1() {
        let matrix = matrix![[1, 2, 3], [4, 5, 6]];
        assert_eq!(matrix.width, 3);
        assert_eq!(matrix.height, 2);
        assert_eq!(matrix.inner.len(), 6);
        assert_eq!(matrix.inner, vec![1, 2, 3, 4, 5, 6]);
    }
    #[test]
    fn test_matrix_macro_2() {
        let matrix = matrix![[1, 2, 3], [4, 5, 6], [7, 8, 9]];
        assert_eq!(matrix.width, 3);
        assert_eq!(matrix.height, 3);
        assert_eq!(matrix.inner.len(), 9);
        assert_eq!(matrix.inner, vec![1, 2, 3, 4, 5, 6, 7, 8, 9]);
    }
    #[test]
    fn test_matrix_macro_3() {
        let matrix = matrix![[1, 2], [3, 4], [5, 6]];
        assert_eq!(matrix.width, 2);
        assert_eq!(matrix.height, 3);
        assert_eq!(matrix.inner.len(), 6);
        assert_eq!(matrix.inner, vec![1, 2, 3, 4, 5, 6]);
    }
}
