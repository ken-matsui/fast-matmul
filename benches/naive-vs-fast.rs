#![allow(non_snake_case)]

use fast_matmul::*;

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

fn bench(c: &mut Criterion) {
    let mut group = c.benchmark_group("Matmul");
    group.sample_size(10); // 10 is minimum required; default is 100

    for size in [2048].iter() {
        group.throughput(Throughput::Elements(*size as u64));

        let A = Matrix::rand_new(*size, *size);
        let B = Matrix::rand_new(*size, *size);

        group.bench_with_input(BenchmarkId::new("fast", size), size, |b, size| {
            let mut C = Matrix::zero_new(*size, *size);
            b.iter(|| {
                black_box(fast::best_matmul(
                    *size,
                    *size,
                    *size,
                    black_box(&A),
                    black_box(&B),
                    black_box(&mut C),
                ))
            })
        });
        group.bench_with_input(BenchmarkId::new("naive", size), size, |b, size| {
            let mut C = Matrix::zero_new(*size, *size);
            b.iter(|| {
                black_box(naive::matmul(
                    *size,
                    *size,
                    *size,
                    black_box(&A),
                    black_box(&B),
                    black_box(&mut C),
                ))
            })
        });
    }
    group.finish();
}

criterion_group!(benches, bench);
criterion_main!(benches);
