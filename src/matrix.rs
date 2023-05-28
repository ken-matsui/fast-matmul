mod format;

pub use format::*;

use std::ops::Index;

use mimalloc::MiMalloc;

#[global_allocator]
static GLOBAL: MiMalloc = MiMalloc;
// `Vec` will allocate memory through `GLOBAL` above

/// Value type for Matrix
type Value = u32;

/// width: number of cols
/// height: number of rows
///
/// ```text
///         # of cols
///         ↓ ↓ ↓ ↓ ↓
/// \#   -> □ □ □ □ □
/// of   -> □ □ □ □ □
/// rows -> □ □ □ □ □
/// ```
#[derive(PartialEq)]
pub struct Matrix {
    pub width: usize,
    pub height: usize,

    inner: Vec<Value>,
}

/// To avoid immutable borrow
macro_rules! idx {
    ($self: ident, $row: expr, $col: expr) => {
        $self.width * $row + $col
    };
}

impl Matrix {
    /// Initialize with 0
    #[inline(always)]
    pub fn zero_new(width: usize, height: usize) -> Self {
        Matrix {
            width,
            height,

            // fill with 0
            inner: vec![Value::default(); width * height],
        }
    }
    /// Initialize with 1
    #[inline(always)]
    pub fn one_new(width: usize, height: usize) -> Self {
        Matrix {
            width,
            height,

            inner: vec![1; width * height],
        }
    }
    /// Initialize with sequential numbers
    pub fn seq_new(width: usize, height: usize) -> Self {
        let mut matrix = Self::zero_new(width, height);

        let mut num: Value = 0;
        for row in 0..height {
            for col in 0..width {
                matrix.set(row, col, num);
                num += 1;
            }
        }

        matrix
    }
    /// Initialize with random numbers
    #[inline(always)]
    pub fn rand_new(width: usize, height: usize) -> Self {
        Matrix {
            width,
            height,

            inner: fake::vec![Value; width * height],
        }
    }
    /// Initialize with small random numbers that do not occur overflows
    #[inline(always)]
    pub fn small_rand_new(width: usize, height: usize) -> Self {
        use rand::distributions;
        let sampler = distributions::Uniform::new_inclusive(1, 10);

        Matrix {
            width,
            height,

            inner: fake::vec![Value as sampler; width * height],
        }
    }

    /// row: position at rows
    /// col: position at cols
    ///
    /// e.g. row = 1, col = 2
    ///
    /// ```text
    ///            col
    ///             ↓    
    ///         □ □ □ □ □
    ///  row -> □ □ ■ □ □
    ///         □ □ □ □ □
    /// ```
    #[inline(always)]
    pub fn get(&self, row: usize, col: usize) -> &Value {
        unsafe { self.inner.get_unchecked(idx!(self, row, col)) }
    }
    #[inline(always)]
    pub fn get_mut(&mut self, row: usize, col: usize) -> &mut Value {
        unsafe { &mut *self.inner.get_unchecked_mut(idx!(self, row, col)) }
    }

    #[inline(always)]
    pub fn as_ptr(&self) -> *const Value {
        self.inner.as_ptr()
    }
    #[inline(always)]
    pub fn as_mut_ptr(&mut self) -> *mut Value {
        self.inner.as_mut_ptr()
    }

    #[inline(always)]
    pub fn get_ptr(&self, row: usize, col: usize) -> *const Value {
        unsafe { self.as_ptr().add(idx!(self, row, col)) }
    }
    #[inline(always)]
    pub fn get_mut_ptr(&mut self, row: usize, col: usize) -> *mut Value {
        unsafe { self.as_mut_ptr().add(idx!(self, row, col)) }
    }

    #[inline(always)]
    pub fn set(&mut self, row: usize, col: usize, val: Value) {
        *self.get_mut(row, col) = val;
    }

    /// Returns a copied matrix must be smaller than the original
    /// The range ends must be exclusive
    ///
    /// For better performance, this method does not check if arguments are out of bounds.
    pub fn pack_into(&self, row_fr: usize, row_to: usize, col_fr: usize, col_to: usize) -> Matrix {
        self.pack_into_row_major(row_fr, row_to, col_fr, col_to)
    }

    /// Pack into row major order
    pub fn pack_into_row_major(
        &self,
        row_fr: usize,
        row_to: usize,
        col_fr: usize,
        col_to: usize,
    ) -> Matrix {
        let mut copy = Matrix::zero_new(col_to - col_fr, row_to - row_fr);
        for row in row_fr..row_to {
            for col in col_fr..col_to {
                copy.set(row - row_fr, col - col_fr, *self.get(row, col));
            }
        }
        copy
    }
    /// Pack into column major order
    pub fn pack_into_col_major(
        &self,
        row_fr: usize,
        row_to: usize,
        col_fr: usize,
        col_to: usize,
    ) -> Matrix {
        let mut copy = Matrix::zero_new(row_to - row_fr, col_to - col_fr);
        for col in col_fr..col_to {
            for row in row_fr..row_to {
                copy.set(row - row_fr, col - col_fr, *self.get(col, row));
            }
        }
        copy
    }
}

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
    fn test_zero_new() {
        let matrix = Matrix::zero_new(2, 4);
        assert_eq!(matrix.width, 2);
        assert_eq!(matrix.height, 4);
        assert_eq!(matrix.inner.len(), 8);
        assert_eq!(matrix.inner, vec![0; 8]);
    }

    #[test]
    fn test_one_new() {
        let matrix = Matrix::one_new(4, 2);
        assert_eq!(matrix.width, 4);
        assert_eq!(matrix.height, 2);
        assert_eq!(matrix.inner.len(), 8);
        assert_eq!(matrix.inner, vec![1; 8]);
    }

    #[test]
    fn test_seq_new() {
        let matrix = Matrix::seq_new(4, 4);
        assert_eq!(matrix.width, 4);
        assert_eq!(matrix.height, 4);
        assert_eq!(matrix.inner.len(), 16);
        assert_eq!(
            matrix.inner,
            vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        );
    }

    #[test]
    fn test_rand_new() {
        let matrix = Matrix::rand_new(3, 9);
        assert_eq!(matrix.width, 3);
        assert_eq!(matrix.height, 9);
        assert_eq!(matrix.inner.len(), 27);
    }

    #[test]
    fn test_small_rand_new() {
        let matrix = Matrix::small_rand_new(9, 3);
        assert_eq!(matrix.width, 9);
        assert_eq!(matrix.height, 3);
        assert_eq!(matrix.inner.len(), 27);
        for elem in matrix.inner {
            assert!(elem >= 1 && elem <= 10);
        }
    }

    #[test]
    fn test_get() {
        let matrix = Matrix::seq_new(4, 4);
        assert_eq!(matrix.get(0, 0), &0);
        assert_eq!(matrix.get(0, 1), &1);
        assert_eq!(matrix.get(0, 2), &2);
        assert_eq!(matrix.get(0, 3), &3);
        assert_eq!(matrix.get(1, 0), &4);
        assert_eq!(matrix.get(1, 1), &5);
        assert_eq!(matrix.get(1, 2), &6);
        assert_eq!(matrix.get(1, 3), &7);
        assert_eq!(matrix.get(2, 0), &8);
        assert_eq!(matrix.get(2, 1), &9);
        assert_eq!(matrix.get(2, 2), &10);
        assert_eq!(matrix.get(2, 3), &11);
        assert_eq!(matrix.get(3, 0), &12);
        assert_eq!(matrix.get(3, 1), &13);
        assert_eq!(matrix.get(3, 2), &14);
        assert_eq!(matrix.get(3, 3), &15);
    }

    #[test]
    fn test_get_mut() {
        let mut matrix = Matrix::seq_new(4, 4);
        assert_eq!(matrix.get(0, 0), &0);
        *matrix.get_mut(0, 0) = 1;
        assert_eq!(matrix.get(0, 0), &1);
    }

    #[test]
    fn test_set() {
        let mut matrix = Matrix::seq_new(4, 4);
        assert_eq!(matrix.get(0, 0), &0);
        matrix.set(0, 0, 1);
        assert_eq!(matrix.get(0, 0), &1);
    }

    #[test]
    fn test_pack_into_row_major_just_copy() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_into_row_major(0, 4, 0, 4);
        assert_eq!(copy, matrix);
    }
    #[test]
    fn test_pack_into_row_major_empty() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_into_row_major(0, 0, 0, 0);
        assert_eq!(copy, Matrix::zero_new(0, 0));
    }
    #[test]
    fn test_pack_into_row_major_1() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_into_row_major(0, 1, 0, 4);
        assert_eq!(copy.width, 4);
        assert_eq!(copy.height, 1);
        assert_eq!(copy.inner, Matrix::seq_new(2, 2).inner);
    }
    #[test]
    fn test_pack_into_row_major_2() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_into_row_major(0, 2, 0, 4);
        assert_eq!(copy.width, 4);
        assert_eq!(copy.height, 2);
        assert_eq!(copy.inner, Matrix::seq_new(4, 2).inner);
    }
    #[test]
    fn test_pack_into_row_major_3() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_into_row_major(2, 4, 0, 4);

        assert_eq!(copy.width, 4);
        assert_eq!(copy.height, 2);

        let start = 4 * 2 + 0; // width (# of cols) * row + col
        for row in 0..2 {
            for col in 0..4 {
                assert_eq!(*copy.get(row, col), (start + col + row * 4) as u32);
            }
        }
    }

    #[test]
    fn test_pack_into_col_major_just_copy() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_into_col_major(0, 4, 0, 4);
        assert_eq!(copy, matrix.transpose(), "copy should be transposed");
    }
    #[test]
    fn test_pack_into_col_major_empty() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_into_col_major(0, 0, 0, 0);
        assert_eq!(copy, Matrix::zero_new(0, 0));
    }

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
