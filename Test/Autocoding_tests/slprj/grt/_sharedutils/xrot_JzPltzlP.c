/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/xrot_JzPltzlP.c
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
#include "xrot_JzPltzlP.h"

/* Function for MATLAB Function: '<S3>/INITIALIZE' */
void xrot_JzPltzlP(int32_T n, real_T x[16], int32_T ix0, int32_T iy0, real_T c,
                   real_T s)
{
  int32_T ix;
  int32_T iy;
  real_T temp;
  int32_T k;
  if (n >= 1) {
    ix = ix0 - 1;
    iy = iy0 - 1;
    for (k = 0; k < n; k++) {
      temp = c * x[ix] + s * x[iy];
      x[iy] = c * x[iy] - s * x[ix];
      x[ix] = temp;
      iy += 4;
      ix += 4;
    }
  }
}
