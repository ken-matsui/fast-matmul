# fast-matmul

```shell
cargo test
```

## Benchmark

```shell
cargo install cargo-criterion
```

```shell
cargo criterion
```

```shell
cargo criterion --bench naive-vs-fast
```

```shell
cargo criterion --bench best-params
```

## Reports

```shell
open ./target/criterion/reports/index.html
```

```shell
mv ./target/criterion/reports ./reports/7-something
```

```shell
scp -r $NETID@attu.cs.washington.edu:/homes/iws/$NETID/fast-matmul/target/criterion/reports ./reports/7-something
```

## ASM

```shell
cargo install cargo-show-asm
cargo asm --lib fast_matmul::fast::matmul --rust
```

```shell
cargo asm --lib fast_matmul::naive::matmul --no-color > naive.m1.asm
```

## References

* Drewniak, Krzysztof. (2018). GEMM3: Constant-Workspace High-Performance Multiplication of Three Matrices for Matrix Chaining. https://www.researchgate.net/publication/326920343_GEMM3_Constant-Workspace_High-Performance_Multiplication_of_Three_Matrices_for_Matrix_Chaining
* Tze Meng Low, Francisco D. Igual, Tyler M. Smith, and Enrique S. Quintana-Orti. 2016. Analytical Modeling Is Enough for High-Performance BLIS. ACM Trans. Math. Softw. 43, 2, Article 12 (June 2017), 18 pages. https://doi.org/10.1145/2925987
