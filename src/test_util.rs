#![cfg(test)]

use crate::matrix::Matrix;

pub(crate) fn expected_8x8() -> Matrix {
    let mut Expected = Matrix::zero_new(8, 8);
    Expected.insert(0, 0, 1120);
    Expected.insert(0, 1, 1148);
    Expected.insert(0, 2, 1176);
    Expected.insert(0, 3, 1204);
    Expected.insert(0, 4, 1232);
    Expected.insert(0, 5, 1260);
    Expected.insert(0, 6, 1288);
    Expected.insert(0, 7, 1316);

    Expected.insert(1, 0, 2912);
    Expected.insert(1, 1, 3004);
    Expected.insert(1, 2, 3096);
    Expected.insert(1, 3, 3188);
    Expected.insert(1, 4, 3280);
    Expected.insert(1, 5, 3372);
    Expected.insert(1, 6, 3464);
    Expected.insert(1, 7, 3556);

    Expected.insert(2, 0, 4704);
    Expected.insert(2, 1, 4860);
    Expected.insert(2, 2, 5016);
    Expected.insert(2, 3, 5172);
    Expected.insert(2, 4, 5328);
    Expected.insert(2, 5, 5484);
    Expected.insert(2, 6, 5640);
    Expected.insert(2, 7, 5796);

    Expected.insert(3, 0, 6496);
    Expected.insert(3, 1, 6716);
    Expected.insert(3, 2, 6936);
    Expected.insert(3, 3, 7156);
    Expected.insert(3, 4, 7376);
    Expected.insert(3, 5, 7596);
    Expected.insert(3, 6, 7816);
    Expected.insert(3, 7, 8036);

    Expected.insert(4, 0, 8288);
    Expected.insert(4, 1, 8572);
    Expected.insert(4, 2, 8856);
    Expected.insert(4, 3, 9140);
    Expected.insert(4, 4, 9424);
    Expected.insert(4, 5, 9708);
    Expected.insert(4, 6, 9992);
    Expected.insert(4, 7, 10276);

    Expected.insert(5, 0, 10080);
    Expected.insert(5, 1, 10428);
    Expected.insert(5, 2, 10776);
    Expected.insert(5, 3, 11124);
    Expected.insert(5, 4, 11472);
    Expected.insert(5, 5, 11820);
    Expected.insert(5, 6, 12168);
    Expected.insert(5, 7, 12516);

    Expected.insert(6, 0, 11872);
    Expected.insert(6, 1, 12284);
    Expected.insert(6, 2, 12696);
    Expected.insert(6, 3, 13108);
    Expected.insert(6, 4, 13520);
    Expected.insert(6, 5, 13932);
    Expected.insert(6, 6, 14344);
    Expected.insert(6, 7, 14756);

    Expected.insert(7, 0, 13664);
    Expected.insert(7, 1, 14140);
    Expected.insert(7, 2, 14616);
    Expected.insert(7, 3, 15092);
    Expected.insert(7, 4, 15568);
    Expected.insert(7, 5, 16044);
    Expected.insert(7, 6, 16520);
    Expected.insert(7, 7, 16996);

    Expected
}
