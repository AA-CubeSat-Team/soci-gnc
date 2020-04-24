/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/interp1_3IXp8So0.c
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
#include "rtGetNaN.h"
#include "rt_nonfinite.h"
#include "interp1_3IXp8So0.h"

/* Function for MATLAB Function: '<S3>/INITIALIZE' */
real_T interp1_3IXp8So0(const real_T varargin_1[2], const real_T varargin_2[2],
  real_T varargin_3)
{
  real_T Vq;
  int32_T k;
  real_T r;
  real_T x_idx_1;
  real_T y_idx_0;
  real_T y_idx_1;
  int32_T exitg1;
  y_idx_0 = varargin_2[0];
  r = varargin_1[0];
  y_idx_1 = varargin_2[1];
  x_idx_1 = varargin_1[1];
  k = 0;
  do {
    exitg1 = 0;
    if (k < 2) {
      if (rtIsNaN(varargin_1[k])) {
        exitg1 = 1;
      } else {
        k++;
      }
    } else {
      if (varargin_1[1] < varargin_1[0]) {
        r = varargin_1[1];
        x_idx_1 = varargin_1[0];
        y_idx_0 = varargin_2[1];
        y_idx_1 = varargin_2[0];
      }

      Vq = (rtNaN);
      if ((!rtIsNaN(varargin_3)) && (!(varargin_3 > x_idx_1)) && (!(varargin_3 <
            r))) {
        r = (varargin_3 - r) / (x_idx_1 - r);
        if (r == 0.0) {
          Vq = y_idx_0;
        } else if (r == 1.0) {
          Vq = y_idx_1;
        } else if (y_idx_0 == y_idx_1) {
          Vq = y_idx_0;
        } else {
          Vq = (1.0 - r) * y_idx_0 + r * y_idx_1;
        }
      }

      exitg1 = 1;
    }
  } while (exitg1 == 0);

  return Vq;
}
