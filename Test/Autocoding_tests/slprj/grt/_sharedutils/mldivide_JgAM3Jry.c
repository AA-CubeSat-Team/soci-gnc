/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/mldivide_JgAM3Jry.c
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
#include "mldivide_JgAM3Jry.h"

/* Function for MATLAB Function: '<S3>/SOLVE' */
void mldivide_JgAM3Jry(const real_T A[100], real_T B[10])
{
  real_T temp;
  real_T b_A[100];
  int32_T ipiv[10];
  int32_T info;
  int32_T kAcol;
  int32_T i;
  memcpy(&b_A[0], &A[0], 100U * sizeof(real_T));
  xgetrf_CjXcXVfl(b_A, ipiv, &info);
  for (info = 0; info < 9; info++) {
    if (info + 1 != ipiv[info]) {
      temp = B[info];
      B[info] = B[ipiv[info] - 1];
      B[ipiv[info] - 1] = temp;
    }
  }

  for (info = 0; info < 10; info++) {
    kAcol = 10 * info;
    if (B[info] != 0.0) {
      for (i = info + 1; i + 1 < 11; i++) {
        B[i] -= b_A[i + kAcol] * B[info];
      }
    }
  }

  for (info = 9; info >= 0; info--) {
    kAcol = 10 * info;
    if (B[info] != 0.0) {
      B[info] /= b_A[info + kAcol];
      for (i = 0; i < info; i++) {
        B[i] -= b_A[i + kAcol] * B[info];
      }
    }
  }
}
