#![allow(non_snake_case)]

use std::hint::black_box;

use fast_matmul::{fast::Param, *};

use criterion::{criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

fn bench(c: &mut Criterion) {
    let mut group = c.benchmark_group("Matmul");
    group.sample_size(10); // 10 is minimum required; default is 100

    for size in [2048].iter() {
        group.throughput(Throughput::Elements(*size as u64));

        let param = Param::new(128, 1024, 1);
        let A = Matrix::random_new(*size, *size);
        let B = Matrix::random_new(*size, *size);

        group.bench_with_input(BenchmarkId::new("fast", size), size, |b, size| {
            let mut C = Matrix::new(*size, *size);
            b.iter(|| black_box(fast::matmul(*size, *size, *size, black_box(&A), black_box(&B), black_box(&mut C), param)))
        });
        group.bench_with_input(BenchmarkId::new("naive", size), size, |b, size| {
            let mut C = Matrix::new(*size, *size);
            b.iter(|| black_box(naive::matmul(*size, *size, *size, black_box(&A), black_box(&B), black_box(&mut C))))
        });
    }
    group.finish();
}

criterion_group!(benches, bench);
criterion_main!(benches);
