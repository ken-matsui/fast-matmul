/*
Impl
Inputs: c: Tensor(2048×2048, GL), a: Tensor(2048×2048, GL)
Output: b: Tensor(2048×2048, GL)
                                                                              spec                                                                                     cost                        RF    VRF     L1    GL
----------------------------------------------------------------------------  ---------------------------------------------------------------------------------------  ------------------------  ----  -----  -----  ----
tile (aT: 2048×64, bT: 2048×64) <- (a, b)                                     Matmul((2048×2048, u32), (2048×2048, u32), (2048×2048, u32), serial)                     2441588244480 = 32 * _      64     32  16896     0
  Block(c, aT, bT)                                                            Matmul((2048×2048, u32), (2048×64, u32, c1), (2048×64, u32, c1), serial)                 76299632640 (sum of 2)      64     32  16896     0
    tile (bTt: 1×8) <- (bT)                                                   Zero((2048×64, u32, c1), serial)                                                         21626880 = 16384 * _         0     32     32     0
      move[L1] bTtS <- bTt                                                    Zero((1×8, u32, ua), serial)                                                              1320 = 1100 + _             0     32     32     0
        move[VRF] bTtSr <- bTtS                                               Zero((1×8, u32, L1, ua), serial)                                                           140 = 100 + _              0     32      0     0
          tile (bTtSrT: 1×4) <- (bTtSr)                                       Zero((1×8, u32, VRF, 1×4), serial)                                                          20 = 2 * _                0      0      0     0
            VectorZero(bTtSrT)                                                Zero((1×4, u32, VRF, ua, 1×4), serial)                                                      10                        0      0      0     0
          tile (bTtSt: 1×4, bTtSrT': 1×4) <- (bTtS, bTtSr)                    Store((1×8, u32, L1, ua), (1×8, u32, VRF, 1×4), serial)                                     20 = 2 * _                0      0      0     0
            VectorAssign(bTtSt, bTtSrT')                                      Store((1×4, u32, L1, ua), (1×4, u32, VRF, ua, 1×4), serial)                                 10                        0      0      0     0
        tile (bTtT: 1×1, bTtSt': 1×1) <- (bTt, bTtS)                          Store((1×8, u32, ua), (1×8, u32, L1, ua), serial)                                           80 = 8 * _                0      0      0     0
          ValueAssign(bTtT, bTtSt')                                           Store((1×1, u32, ua), (1×1, u32, L1, ua), serial)                                           10                        0      0      0     0
    tile (cT: 2048×64, aTt: 64×64) <- (c, aT)                                 MatmulAccum((2048×2048, u32), (2048×64, u32, c1), (2048×64, u32, c1), serial)            76278005760 = 32 * _        64     32  16896     0
      move[L1] aTtS <- aTt                                                    MatmulAccum((2048×64, u32, c1), (64×64, u32, c1, ua), (2048×64, u32, c1), serial)        2383687680 = 1126400 + _    64     32  16896     0
        tile (cTt: 1×64, bTt': 1×64) <- (cT, bT)                              MatmulAccum((2048×64, u32, c1), (64×64, u32, L1, c1, ua), (2048×64, u32, c1), serial)    2382561280 = 2048 * _       64     32    512     0
          move[L1] cTtS <- cTt                                                MatmulAccum((1×64, u32, ua), (64×64, u32, L1, c1, ua), (1×64, u32, ua), serial)          1163360 = 8800 + _          64     32    512     0
            move[L1] bTt's <- bTt'                                            MatmulAccum((1×64, u32, L1, ua), (64×64, u32, L1, c1, ua), (1×64, u32, ua), serial)      1154560 = 8800 + _          64     32    256     0
              tile (cTtSt: 1×16, aTtSt: 16×64) <- (cTtS, aTtS)                MatmulAccum((1×64, u32, L1, ua), (64×64, u32, L1, c1, ua), (1×64, u32, L1, ua), serial)  1145760 = 4 * _             64     32      0     0
                move[RF] cTtStR <- cTtSt                                      MatmulAccum((1×16, u32, L1, ua), (16×64, u32, L1, c1, ua), (1×64, u32, L1, ua), serial)  286440 = 200 + _            64     32      0     0
                  tile (cTtStT: 1×1, cTtStRt: 1×1) <- (cTtSt, cTtStR)         Load((1×16, u32, L1, ua), (1×16, u32, RF), serial)                                         160 = 16 * _               0      0      0     0
                    ValueAssign(cTtStT, cTtStRt)                              Load((1×1, u32, L1, ua), (1×1, u32, RF, ua), serial)                                        10                        0      0      0     0
                  tile (aTtStT: 16×4, bTt'sT: 1×4) <- (aTtSt, bTt's)          MatmulAccum((1×16, u32, RF), (16×64, u32, L1, c1, ua), (1×64, u32, L1, ua), serial)      286080 = 16 * _              0     32      0     0
                    move[VRF] bTt'sTr <- bTt'sT                               MatmulAccum((1×16, u32, RF), (16×4, u32, L1, c1, ua), (1×4, u32, L1, ua), serial)        17880 = 100 + _              0     32      0     0
                      VectorAssign(bTt'sT, bTt'sTr)                           Load((1×4, u32, L1, ua), (1×4, u32, VRF, 1×4), serial)                                      10                        0      0      0     0
                      tile (cTtStRt': 1×1, aTtStTt: 1×4) <- (cTtStR, aTtStT)  MatmulAccum((1×16, u32, RF), (16×4, u32, L1, c1, ua), (1×4, u32, VRF, 1×4), serial)      17760 = 16 * _               0     16      0     0
                        move[VRF] aTtStTtR <- aTtStTt                         MatmulAccum((1×1, u32, RF, ua), (1×4, u32, L1, ua), (1×4, u32, VRF, 1×4), serial)         1110 = 100 + _              0     16      0     0
                          VectorAssign(aTtStTt, aTtStTtR)                     Load((1×4, u32, L1, ua), (1×4, u32, VRF, 1×4), serial)                                      10                        0      0      0     0
                          BroadcastVecMult(cTtStRt', aTtStTtR, bTt'sTr)       MatmulAccum((1×1, u32, RF, ua), (1×4, u32, VRF, 1×4), (1×4, u32, VRF, 1×4), serial)       1000                        0      0      0     0
                      VectorAssign(bTt'sT, bTt'sTr)                           Store((1×4, u32, L1, ua), (1×4, u32, VRF, 1×4), serial)                                     10                        0      0      0     0
Note: move* is a MoveLet scope where the introduced tensor is an output.
*/

#include <inttypes.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <immintrin.h>
#define is_aligned(POINTER, BYTE_COUNT) \
  (((uintptr_t)(const void *)(POINTER)) % (BYTE_COUNT) == 0)
typedef uint32_t vui8 __attribute__ ((vector_size (32)));
typedef uint32_t vui4 __attribute__ ((vector_size (16)));
typedef uint8_t vub32 __attribute__ ((vector_size (32)));
typedef uint8_t vub16 __attribute__ ((vector_size (16)));
__attribute__((noinline))
void kernel(
  uint32_t *restrict buf0,
  uint32_t *restrict buf1,
  uint32_t *restrict buf2)
{
  for (int t1 = 0; t1 < 1; t1++) {        // Matmul((2048×2048, u32), (2048×2048, u32), (2048×2048, u32), serial)
  for (int t0 = 0; t0 < 32; t0++) {
    for (int t2 = 0; t2 < 2048; t2++) {        // Zero((2048×64, u32, c1), serial)
    for (int t3 = 0; t3 < 8; t3++) {
      vui4 vbuf0;        // Zero((1×8, u32, L1, ua), serial)
      vui4 vbuf1;
      vbuf0 *= 0;  /* VectorZero */        // Zero((1×4, u32, VRF, ua, 1×4), serial)
      vbuf1 *= 0;  /* VectorZero */        // Zero((1×4, u32, VRF, ua, 1×4), serial)
      _mm_storeu_si128((__m128i *)(buf2 + ((8 * t3) + (64 * t0) + (2048 * t2))), _mm_loadu_si128((__m128i *)(&vbuf0)));  // VectorAssign        // Store((1×4, u32, L1, ua), (1×4, u32, VRF, ua, 1×4), serial)
      _mm_storeu_si128((__m128i *)(buf2 + (4 + (8 * t3) + (64 * t0) + (2048 * t2))), _mm_loadu_si128((__m128i *)(&vbuf1)));  // VectorAssign        // Store((1×4, u32, L1, ua), (1×4, u32, VRF, ua, 1×4), serial)
    }
    }
    for (int t8 = 0; t8 < 32; t8++) {        // MatmulAccum((2048×2048, u32), (2048×64, u32, c1), (2048×64, u32, c1), serial)
      for (int t9 = 0; t9 < 2048; t9++) {        // MatmulAccum((2048×64, u32, c1), (64×64, u32, L1, c1, ua), (2048×64, u32, c1), serial)
      for (int t10 = 0; t10 < 1; t10++) {
        for (int t11 = 0; t11 < 4; t11++) {        // MatmulAccum((1×64, u32, L1, ua), (64×64, u32, L1, c1, ua), (1×64, u32, L1, ua), serial)
          uint32_t buf3[16] __attribute__((aligned (128)));        // MatmulAccum((1×16, u32, L1, ua), (16×64, u32, L1, c1, ua), (1×64, u32, L1, ua), serial)
          for (int t13 = 0; t13 < 1; t13++) {        // Load((1×16, u32, L1, ua), (1×16, u32, RF), serial)
          for (int t12 = 0; t12 < 16; t12++) {
            buf3[t12] = buf0[(t12 + (16 * t11) + (64 * t8) + (2048 * t9))];  // ValueAssign        // Load((1×1, u32, L1, ua), (1×1, u32, RF, ua), serial)
          }
          }
          for (int t15 = 0; t15 < 1; t15++) {        // MatmulAccum((1×16, u32, RF), (16×64, u32, L1, c1, ua), (1×64, u32, L1, ua), serial)
          for (int t14 = 0; t14 < 16; t14++) {
            vui4 vbuf2;        // MatmulAccum((1×16, u32, RF), (16×4, u32, L1, c1, ua), (1×4, u32, L1, ua), serial)
            _mm_storeu_si128((__m128i *)(&vbuf2), _mm_loadu_si128((__m128i *)(buf2 + ((4 * t14) + (64 * t0) + (2048 * t9)))));  // VectorAssign        // Load((1×4, u32, L1, ua), (1×4, u32, VRF, 1×4), serial)
            for (int t16 = 0; t16 < 16; t16++) {        // MatmulAccum((1×16, u32, RF), (16×4, u32, L1, c1, ua), (1×4, u32, VRF, 1×4), serial)
              vui4 vbuf3;        // MatmulAccum((1×1, u32, RF, ua), (1×4, u32, L1, ua), (1×4, u32, VRF, 1×4), serial)
              _mm_storeu_si128((__m128i *)(&vbuf3), _mm_loadu_si128((__m128i *)(buf1 + ((4 * t14) + (64 * t0) + (2048 * t16) + (32768 * t11) + (131072 * t8)))));  // VectorAssign        // Load((1×4, u32, L1, ua), (1×4, u32, VRF, 1×4), serial)
              *(vui4 *)(&vbuf2) += buf3[t16] * (*(vui4 *)(&vbuf3)); /* BroadcastVecMult */        // MatmulAccum((1×1, u32, RF, ua), (1×4, u32, VRF, 1×4), (1×4, u32, VRF, 1×4), serial)
            }
            _mm_storeu_si128((__m128i *)(buf2 + ((4 * t14) + (64 * t0) + (2048 * t9))), _mm_loadu_si128((__m128i *)(&vbuf2)));  // VectorAssign        // Store((1×4, u32, L1, ua), (1×4, u32, VRF, 1×4), serial)
          }
          }
        }
      }
      }
    }
  }
  }
}

int main() {
  uint32_t *restrict buf0;
  posix_memalign((void **)&buf0, 128, 4194304*sizeof(uint32_t));  // TODO: Handle return
  uint32_t *restrict buf1;
  posix_memalign((void **)&buf1, 128, 4194304*sizeof(uint32_t));  // TODO: Handle return
  uint32_t *restrict buf2;
  posix_memalign((void **)&buf2, 128, 4194304*sizeof(uint32_t));  // TODO: Handle return
  kernel((buf0 + 0), (buf1 + 0), (buf2 + 0));
  free(buf2);
  free(buf1);
  free(buf0);
  return 0;
}

/*
Impl Runtime: 1.5399s

Scheduling took 1084.13s
*/
