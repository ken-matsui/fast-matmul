use crate::Matrix;

impl Matrix {
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

#[cfg(test)]
mod tests {
    use super::*;

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
}
