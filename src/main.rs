#![allow(non_snake_case)]

use fast_matmul::*;

const SIZE: usize = 2048;

fn main() {
    let A = Matrix::rand_new(SIZE, SIZE);
    let B = Matrix::rand_new(SIZE, SIZE);
    let mut C = Matrix::zero_new(SIZE, SIZE);

    fast::best_matmul(&A, &B, &mut C);
}
