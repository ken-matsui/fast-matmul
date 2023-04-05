use std::fmt::{self, Display, Formatter};

// use debug_print::{debug_print as dprint, debug_println as dprintln};

use mimalloc::MiMalloc;

#[global_allocator]
static GLOBAL: MiMalloc = MiMalloc;
// `Vec` will allocate memory through `GLOBAL` above

/// Value type for matrix
type Value = i64;

#[derive(Debug, PartialEq)]
pub struct Matrix {
    row: usize,
    col: usize,

    inner: Vec<Value>,
}

impl Matrix {
    pub fn new(row: usize, col: usize) -> Self {
        Matrix {
            row,
            col,
            // fill with 0
            inner: vec![Value::default(); row * col],
        }
    }
    /// for debug
    pub fn serial_new(row: usize, col: usize) -> Self {
        let mut matrix = Self::new(row, col);

        let mut num: Value = 0;
        for j in 0..col {
            for i in 0..row {
                matrix.insert(i, j, num);
                num += 1;
            }
        }

        matrix
    }
    /// for benchmark
    pub fn random_new(row: usize, col: usize) -> Self {
        Matrix {
            row,
            col,
            inner: fake::vec![Value; row * col],
        }
    }

    #[inline]
    pub fn get(&self, i: usize, j: usize) -> Value {
        self.inner[j * self.row + i]
    }
    #[inline]
    pub fn get_ref_mut(&mut self, i: usize, j: usize) -> &mut Value {
        &mut self.inner[j * self.row + i]
    }
    #[inline]
    pub fn insert(&mut self, i: usize, j: usize, val: Value) {
        *self.get_ref_mut(i, j) = val;
    }

    /// Returns a copied matrix must be smaller than the original
    /// The range ends must be exclusive
    pub fn pack_into(&self, i_from: usize, i_to: usize, j_from: usize, j_to: usize) -> Matrix {
        // dprintln!("i_from..i_to: {i_from}..{i_to}, j_from: {j_from}..{j_to}");
        let mut copy = Matrix::new(i_to - i_from, j_to - j_from);
        for j in j_from..j_to {
            for i in i_from..i_to {
                // dprint!("[i: {i}, j: {j}], ");
                copy.insert(i - i_from, j - j_from, self.get(i, j));
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
