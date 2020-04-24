/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/norm_UjNDAYVY.c
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
#include <math.h>
#include "norm_UjNDAYVY.h"

/* Function for MATLAB Function: '<S3>/SOLVE' */
real_T norm_UjNDAYVY(const real_T x[99])
{
  real_T y;
  int32_T k;
  y = 0.0;
  for (k = 0; k < 99; k++) {
    y += fabs(x[k]);
  }

  return y;
}
