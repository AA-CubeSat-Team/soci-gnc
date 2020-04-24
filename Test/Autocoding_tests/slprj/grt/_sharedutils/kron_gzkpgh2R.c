/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/kron_gzkpgh2R.c
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
#include "kron_gzkpgh2R.h"

/* Function for MATLAB Function: '<S3>/SOLVE' */
void kron_gzkpgh2R(const real_T A[100], const real_T B[30], real_T K[3000])
{
  int32_T kidx;
  int32_T b_j1;
  int32_T j2;
  int32_T i1;
  real_T K_tmp;
  kidx = -1;
  for (b_j1 = 0; b_j1 < 10; b_j1++) {
    for (j2 = 0; j2 < 10; j2++) {
      for (i1 = 0; i1 < 10; i1++) {
        kidx++;
        K_tmp = A[10 * b_j1 + i1];
        K[kidx] = K_tmp * B[3 * j2];
        kidx++;
        K[kidx] = K_tmp * B[3 * j2 + 1];
        kidx++;
        K[kidx] = K_tmp * B[3 * j2 + 2];
      }
    }
  }
}
