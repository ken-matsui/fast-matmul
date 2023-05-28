use crate::Matrix;

use std::cmp::min;
use std::fmt;
use std::fmt::{Debug, Display, Formatter};
use std::sync::Mutex;

pub static SHOW_ALL: Mutex<bool> = Mutex::new(false);

impl Debug for Matrix {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        if *SHOW_ALL.lock().unwrap() {
            writeln!(f, "({}x{})[", self.width, self.height)?;
            for row in 0..self.height {
                write!(f, "  [")?;
                for col in 0..self.width {
                    write!(f, "{}", self.get(row, col))?;
                    if col != self.width - 1 {
                        write!(f, ", ")?;
                    }
                }
                writeln!(f, "],")?;
            }
            write!(f, "]")
        } else {
            write!(f, "{}", self)
        }
    }
}

impl Display for Matrix {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        writeln!(f, "({}x{})[", self.width, self.height)?;
        for row in 0..min(self.height, 5) {
            write!(f, "  [")?;
            for col in 0..min(self.width, 10) {
                write!(f, "{}", self.get(row, col))?;
                if col != self.width - 1 {
                    write!(f, ", ")?;
                }
                if col == 9 && self.width > 10 {
                    write!(f, "...")?;
                }
            }
            writeln!(f, "],")?;
            if row == 4 && self.height > 5 {
                writeln!(f, "  ...,")?;
            }
        }
        write!(f, "]")
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::matrix;

    #[test]
    fn test_display_1() {
        let matrix = matrix![[1, 2, 3], [4, 5, 6]];
        assert_eq!(
            format!("{matrix}"),
            r#"(3x2)[
  [1, 2, 3],
  [4, 5, 6],
]"#
        );
    }
    #[test]
    fn test_display_2() {
        let matrix = matrix![[1, 2, 3], [4, 5, 6], [7, 8, 9]];
        assert_eq!(
            format!("{matrix}"),
            r#"(3x3)[
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
]"#
        );
    }
    #[test]
    fn test_display_3() {
        let matrix = matrix![[1, 2], [3, 4], [5, 6]];
        assert_eq!(
            format!("{matrix}"),
            r#"(2x3)[
  [1, 2],
  [3, 4],
  [5, 6],
]"#
        );
    }
    #[test]
    fn test_display_large() {
        let matrix = Matrix::seq_new(11, 6);
        assert_eq!(
            format!("{matrix}"),
            r#"(11x6)[
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ...],
  [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...],
  [22, 23, 24, 25, 26, 27, 28, 29, 30, 31, ...],
  [33, 34, 35, 36, 37, 38, 39, 40, 41, 42, ...],
  [44, 45, 46, 47, 48, 49, 50, 51, 52, 53, ...],
  ...,
]"#
        );
    }

    #[test]
    fn test_debug_default_1() {
        *SHOW_ALL.lock().unwrap() = false;

        let matrix = matrix![[1, 2, 3], [4, 5, 6]];
        assert_eq!(
            format!("{matrix:?}"),
            r#"(3x2)[
  [1, 2, 3],
  [4, 5, 6],
]"#
        );
    }
    #[test]
    fn test_debug_default_2() {
        *SHOW_ALL.lock().unwrap() = false;

        let matrix = matrix![[1, 2, 3], [4, 5, 6], [7, 8, 9]];
        assert_eq!(
            format!("{matrix:?}"),
            r#"(3x3)[
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
]"#
        );
    }
    #[test]
    fn test_debug_default_3() {
        *SHOW_ALL.lock().unwrap() = false;

        let matrix = matrix![[1, 2], [3, 4], [5, 6]];
        assert_eq!(
            format!("{matrix:?}"),
            r#"(2x3)[
  [1, 2],
  [3, 4],
  [5, 6],
]"#
        );
    }
    #[test]
    fn test_debug_default_large() {
        *SHOW_ALL.lock().unwrap() = false;

        let matrix = Matrix::seq_new(11, 6);
        assert_eq!(
            format!("{matrix:?}"),
            r#"(11x6)[
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ...],
  [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...],
  [22, 23, 24, 25, 26, 27, 28, 29, 30, 31, ...],
  [33, 34, 35, 36, 37, 38, 39, 40, 41, 42, ...],
  [44, 45, 46, 47, 48, 49, 50, 51, 52, 53, ...],
  ...,
]"#
        );
    }

    #[test]
    fn test_debug_show_all_1() {
        *SHOW_ALL.lock().unwrap() = true;

        let matrix = matrix![[1, 2, 3], [4, 5, 6]];
        assert_eq!(
            format!("{matrix:?}"),
            r#"(3x2)[
  [1, 2, 3],
  [4, 5, 6],
]"#
        );
    }
    #[test]
    fn test_debug_show_all_2() {
        *SHOW_ALL.lock().unwrap() = true;

        let matrix = matrix![[1, 2, 3], [4, 5, 6], [7, 8, 9]];
        assert_eq!(
            format!("{matrix:?}"),
            r#"(3x3)[
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
]"#
        );
    }
    #[test]
    fn test_debug_show_all_3() {
        *SHOW_ALL.lock().unwrap() = true;

        let matrix = matrix![[1, 2], [3, 4], [5, 6]];
        assert_eq!(
            format!("{matrix:?}"),
            r#"(2x3)[
  [1, 2],
  [3, 4],
  [5, 6],
]"#
        );
    }
    #[test]
    fn test_debug_show_all_large() {
        *SHOW_ALL.lock().unwrap() = true;

        let matrix = Matrix::seq_new(11, 6);
        assert_eq!(
            format!("{matrix:?}"),
            r#"(11x6)[
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
  [22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32],
  [33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43],
  [44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54],
  [55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65],
]"#
        );
    }
}
