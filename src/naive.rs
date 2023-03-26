use crate::matrix::MatrixPtr;

pub(crate) fn matmul(m: usize, k: usize, n: usize, A: MatrixPtr, B: MatrixPtr, C: MatrixPtr) {
    for j in 0..n {
        for i in 0..m {
            for p in 0..k {
                unsafe {
                    *C.get(i, j) += *A.get(i, p) * *B.get(p, j);
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::matrix::Matrix;

    #[test]
    fn test_matmul() {
        let m: usize = 8;
        let k: usize = 8;
        let n: usize = 8;

        let mut A = Matrix::serial_new(m, k);
        let mut B = Matrix::serial_new(k, n);
        let mut C = Matrix::new(m, n);

        matmul(m, k, n, A.as_mut_ptr(), B.as_mut_ptr(), C.as_mut_ptr());

        let mut Expected = Matrix::new(m, n);
        Expected.insert(0, 0, 1120.);
        Expected.insert(1, 0, 1148.);
        Expected.insert(2, 0, 1176.);
        Expected.insert(3, 0, 1204.);
        Expected.insert(4, 0, 1232.);
        Expected.insert(5, 0, 1260.);
        Expected.insert(6, 0, 1288.);
        Expected.insert(7, 0, 1316.);

        Expected.insert(0, 1, 2912.);
        Expected.insert(1, 1, 3004.);
        Expected.insert(2, 1, 3096.);
        Expected.insert(3, 1, 3188.);
        Expected.insert(4, 1, 3280.);
        Expected.insert(5, 1, 3372.);
        Expected.insert(6, 1, 3464.);
        Expected.insert(7, 1, 3556.);

        Expected.insert(0, 2, 4704.);
        Expected.insert(1, 2, 4860.);
        Expected.insert(2, 2, 5016.);
        Expected.insert(3, 2, 5172.);
        Expected.insert(4, 2, 5328.);
        Expected.insert(5, 2, 5484.);
        Expected.insert(6, 2, 5640.);
        Expected.insert(7, 2, 5796.);

        Expected.insert(0, 3, 6496.);
        Expected.insert(1, 3, 6716.);
        Expected.insert(2, 3, 6936.);
        Expected.insert(3, 3, 7156.);
        Expected.insert(4, 3, 7376.);
        Expected.insert(5, 3, 7596.);
        Expected.insert(6, 3, 7816.);
        Expected.insert(7, 3, 8036.);

        Expected.insert(0, 4, 8288.);
        Expected.insert(1, 4, 8572.);
        Expected.insert(2, 4, 8856.);
        Expected.insert(3, 4, 9140.);
        Expected.insert(4, 4, 9424.);
        Expected.insert(5, 4, 9708.);
        Expected.insert(6, 4, 9992.);
        Expected.insert(7, 4, 10276.);

        Expected.insert(0, 5, 10080.);
        Expected.insert(1, 5, 10428.);
        Expected.insert(2, 5, 10776.);
        Expected.insert(3, 5, 11124.);
        Expected.insert(4, 5, 11472.);
        Expected.insert(5, 5, 11820.);
        Expected.insert(6, 5, 12168.);
        Expected.insert(7, 5, 12516.);

        Expected.insert(0, 6, 11872.);
        Expected.insert(1, 6, 12284.);
        Expected.insert(2, 6, 12696.);
        Expected.insert(3, 6, 13108.);
        Expected.insert(4, 6, 13520.);
        Expected.insert(5, 6, 13932.);
        Expected.insert(6, 6, 14344.);
        Expected.insert(7, 6, 14756.);

        Expected.insert(0, 7, 13664.);
        Expected.insert(1, 7, 14140.);
        Expected.insert(2, 7, 14616.);
        Expected.insert(3, 7, 15092.);
        Expected.insert(4, 7, 15568.);
        Expected.insert(5, 7, 16044.);
        Expected.insert(6, 7, 16520.);
        Expected.insert(7, 7, 16996.);

        assert_eq!(C, Expected);
    }
}
