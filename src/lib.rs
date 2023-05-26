#![allow(non_snake_case)]
#![allow(non_upper_case_globals)]
#![allow(arithmetic_overflow)]

pub mod fast;
mod matrix;
pub mod naive;
pub mod param;
mod test_util;
pub(crate) mod trans;

pub use matrix::Matrix;
pub use param::Param;
