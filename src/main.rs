#![allow(non_snake_case)]

mod fast;
mod matrix;
mod naive;
mod test_util;

use matrix::Matrix;

fn main() {
    let m: usize = 8;
    let k: usize = 8;
    let n: usize = 8;

    // C = A * B
    let mut A = Matrix::serial_new(m, k);
    let mut B = Matrix::serial_new(k, n);
    let mut C = Matrix::new(m, n);

    naive::matmul(m, k, n, A.as_mut_ptr(), B.as_mut_ptr(), C.as_mut_ptr());

    println!("C = A * B");
    println!("A: {A}");
    println!("B: {B}");
    println!("C: {C}");
}
