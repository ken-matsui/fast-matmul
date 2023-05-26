use std::fmt::{self, Display, Formatter};

use mimalloc::MiMalloc;

#[global_allocator]
static GLOBAL: MiMalloc = MiMalloc;
// `Vec` will allocate memory through `GLOBAL` above

/// Value type for Matrix
type Value = u32;

#[derive(Debug, PartialEq)]
pub struct Matrix {
    pub(crate) row: usize,
    pub(crate) col: usize,

    pub(crate) inner: Vec<Value>,
}

impl Matrix {
    /// Initialize with 0
    #[inline(always)]
    pub fn zero_new(row: usize, col: usize) -> Self {
        Matrix {
            row,
            col,
            // fill with 0
            inner: vec![Value::default(); row * col],
        }
    }
    /// Initialize with 1
    #[inline(always)]
    pub fn one_new(row: usize, col: usize) -> Self {
        Matrix {
            row,
            col,
            inner: vec![1; row * col],
        }
    }
    /// Initialize with sequential numbers
    pub fn seq_new(row: usize, col: usize) -> Self {
        let mut matrix = Self::zero_new(row, col);

        let mut num: Value = 0;
        for j in 0..col {
            for i in 0..row {
                matrix.insert(i, j, num);
                num += 1;
            }
        }

        matrix
    }
    /// Initialize with random numbers
    #[inline(always)]
    pub fn rand_new(row: usize, col: usize) -> Self {
        Matrix {
            row,
            col,
            inner: fake::vec![Value; row * col],
        }
    }

    #[inline(always)]
    pub fn get(&self, i: usize, j: usize) -> &Value {
        unsafe { self.inner.get_unchecked(j * self.row + i) }
    }
    #[inline(always)]
    pub fn get_ref_mut(&mut self, i: usize, j: usize) -> &mut Value {
        unsafe { &mut *self.inner.get_unchecked_mut(j * self.row + i) }
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
    pub fn get_ptr(&self, i: usize, j: usize) -> *const Value {
        unsafe { self.as_ptr().add(j * self.row + i) }
    }
    #[inline(always)]
    pub fn get_mut_ptr(&mut self, i: usize, j: usize) -> *mut Value {
        unsafe { self.as_mut_ptr().add(j * self.row + i) }
    }

    #[inline(always)]
    pub fn insert(&mut self, i: usize, j: usize, val: Value) {
        *self.get_ref_mut(i, j) = val;
    }

    /// Returns a copied matrix must be smaller than the original
    /// The range ends must be exclusive
    ///
    /// For better performance, this method does not check if arguments are out of bounds.
    pub fn pack_into(&self, i_from: usize, i_to: usize, j_from: usize, j_to: usize) -> Matrix {
        self.pack_row_mjr(i_from, i_to, j_from, j_to)
    }

    pub fn pack_row_mjr(&self, i_from: usize, i_to: usize, j_from: usize, j_to: usize) -> Matrix {
        let mut copy = Matrix::zero_new(i_to - i_from, j_to - j_from);
        for j in j_from..j_to {
            for i in i_from..i_to {
                copy.insert(i - i_from, j - j_from, *self.get(i, j));
            }
        }
        copy
    }
    pub fn pack_col_mjr(&self, i_from: usize, i_to: usize, j_from: usize, j_to: usize) -> Matrix {
        let mut copy = Matrix::zero_new(i_to - i_from, j_to - j_from);
        for j in j_from..j_to {
            for i in i_from..i_to {
                copy.insert(i - i_from, j - j_from, *self.get(j, i));
            }
        }
        copy
    }
}

impl Display for Matrix {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        for j in 0..self.col {
            for i in 0..self.row {
                write!(f, "{} ", self.get(i, j))?;
            }
            writeln!(f)?;
        }
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pack_row_mjr_just_copy() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_row_mjr(0, 4, 0, 4);
        assert_eq!(copy, matrix);
    }

    #[test]
    fn test_pack_row_mjr_empty() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_row_mjr(0, 0, 0, 0);
        assert_eq!(copy, Matrix::zero_new(0, 0));
    }

    #[test]
    fn test_pack_row_mjr_1() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_row_mjr(0, 4, 0, 1);
        assert_eq!(copy.inner, Matrix::seq_new(2, 2).inner);
    }
    #[test]
    fn test_pack_row_mjr_2() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_row_mjr(0, 4, 0, 2);
        assert_eq!(copy.inner, Matrix::seq_new(4, 2).inner);
    }
    #[test]
    fn test_pack_row_mjr_3() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_row_mjr(0, 4, 2, 4);

        let start = 2 * 4 + 0; // j * row + i
        for i in 0..4 {
            for j in 0..2 {
                assert_eq!(*copy.get(i, j), (start + i + j * 4) as u32);
            }
        }
    }

    #[test]
    fn test_pack_col_mjr_just_copy() {
        let matrix = Matrix::seq_new(4, 4);
        let copy = matrix.pack_col_mjr(0, 4, 0, 4);
        assert_eq!(copy, matrix.transpose(), "copy should be transposed");
    }
}
