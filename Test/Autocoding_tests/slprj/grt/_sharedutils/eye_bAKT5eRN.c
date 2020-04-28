/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/eye_bAKT5eRN.c
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
#include "eye_bAKT5eRN.h"

/* Function for MATLAB Function: '<S3>/SOLVE' */
void eye_bAKT5eRN(real_T b_I[10000])
{
  int32_T k;
  memset(&b_I[0], 0, 10000U * sizeof(real_T));
  for (k = 0; k < 100; k++) {
    b_I[k + 100 * k] = 1.0;
  }
}
