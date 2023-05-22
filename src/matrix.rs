use std::fmt::{self, Display, Formatter};

use mimalloc::MiMalloc;

#[global_allocator]
static GLOBAL: MiMalloc = MiMalloc;
// `Vec` will allocate memory through `GLOBAL` above

/// Value type for matrix
type Value = u32;

#[derive(Debug, PartialEq)]
pub struct Matrix {
    pub(crate) row: usize,
    pub(crate) col: usize,

    pub(crate) inner: Vec<Value>,
}

impl Matrix {
    /// Initialize with 0
    pub fn zero_new(row: usize, col: usize) -> Self {
        Matrix {
            row,
            col,
            // fill with 0
            inner: vec![Value::default(); row * col],
        }
    }
    /// Initialize with 1
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
    pub fn get_ptr(&self, i: usize, j: usize) -> *const Value {
        unsafe { self.as_ptr().add(j * self.row + i) }
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
        let mut copy = Matrix::zero_new(i_to - i_from, j_to - j_from);
        for j in j_from..j_to {
            for i in i_from..i_to {
                copy.insert(i - i_from, j - j_from, *self.get(i, j));
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
