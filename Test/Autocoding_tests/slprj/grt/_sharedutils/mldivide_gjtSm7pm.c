/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/mldivide_gjtSm7pm.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "soac_unit_test".
 *
 * Model version              : 1.95
 * Simulink Coder version : 9.0 (R2018b) 24-May-2018
 * C source code generated on : Tue Apr 21 17:06:42 2020
 * Created for block: soac_unit_test
 */

#include "rtwtypes.h"
#include <string.h>
#include "xgetrf_CjXcXVfl.h"
#include "mldivide_gjtSm7pm.h"

/* Function for MATLAB Function: '<S3>/SOLVE' */
void mldivide_gjtSm7pm(const real_T A[100], real_T B[30])
{
  real_T temp;
  int32_T ip;
  real_T b_A[100];
  int32_T ipiv[10];
  int32_T info;
  int32_T xj;
  int32_T kAcol;
  int32_T i;
  int32_T tmp;
  memcpy(&b_A[0], &A[0], 100U * sizeof(real_T));
  xgetrf_CjXcXVfl(b_A, ipiv, &info);
  for (info = 0; info < 9; info++) {
    if (info + 1 != ipiv[info]) {
      ip = ipiv[info] - 1;
      temp = B[info];
      B[info] = B[ip];
      B[ip] = temp;
      temp = B[info + 10];
      B[info + 10] = B[ip + 10];
      B[ip + 10] = temp;
      temp = B[info + 20];
      B[info + 20] = B[ip + 20];
      B[ip + 20] = temp;
    }
  }

  for (info = 0; info < 3; info++) {
    ip = 10 * info;
    for (xj = 0; xj < 10; xj++) {
      kAcol = 10 * xj;
      if (B[xj + ip] != 0.0) {
        for (i = xj + 2; i < 11; i++) {
          tmp = (i + ip) - 1;
          B[tmp] -= b_A[(i + kAcol) - 1] * B[xj + ip];
        }
      }
    }
  }

  for (info = 0; info < 3; info++) {
    ip = 10 * info;
    for (xj = 9; xj >= 0; xj--) {
      kAcol = 10 * xj;
      if (B[xj + ip] != 0.0) {
        B[xj + ip] /= b_A[xj + kAcol];
        for (i = 0; i < xj; i++) {
          tmp = i + ip;
          B[tmp] -= B[xj + ip] * b_A[i + kAcol];
        }
      }
    }
  }
}
