/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/kron_d7bwd3lR.c
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
#include "kron_d7bwd3lR.h"

/* Function for MATLAB Function: '<S3>/SOLVE' */
void kron_d7bwd3lR(const real_T A[100], const real_T B[100], real_T K[10000])
{
  int32_T kidx;
  int32_T b_j1;
  int32_T j2;
  int32_T i1;
  int32_T i2;
  kidx = -1;
  for (b_j1 = 0; b_j1 < 10; b_j1++) {
    for (j2 = 0; j2 < 10; j2++) {
      for (i1 = 0; i1 < 10; i1++) {
        for (i2 = 0; i2 < 10; i2++) {
          kidx++;
          K[kidx] = A[10 * b_j1 + i1] * B[10 * j2 + i2];
        }
      }
    }
  }
}
