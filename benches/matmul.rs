#![allow(non_snake_case)]

use fast_matmul::*;

use criterion::{criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

fn naive_matmul(size: usize) {
    let A = Matrix::serial_new(size, size);
    let B = Matrix::serial_new(size, size);
    let mut C = Matrix::new(size, size);
    naive::matmul(size, size, size, &A, &B, &mut C);
}
fn fast_matmul(size: usize) {
    let A = Matrix::serial_new(size, size);
    let B = Matrix::serial_new(size, size);
    let mut C = Matrix::new(size, size);
    fast::matmul(size, size, size, &A, &B, &mut C);
}

fn bench(c: &mut Criterion) {
    let mut group = c.benchmark_group("Matmul");
    group.sample_size(10); // 10 is minimum required; default is 100
    for parameter in [512].iter() {
        group.throughput(Throughput::Elements(*parameter as u64));
        group.bench_with_input(BenchmarkId::new("naive", parameter), parameter, |b, par| {
            b.iter(|| naive_matmul(*par))
        });
        group.bench_with_input(BenchmarkId::new("fast", parameter), parameter, |b, par| {
            b.iter(|| fast_matmul(*par))
        });
    }
    group.finish();
}

criterion_group!(benches, bench);
criterion_main!(benches);
