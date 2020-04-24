/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/blkdiag_CSGxleFs.c
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
#include "blkdiag_CSGxleFs.h"

/* Function for MATLAB Function: '<S3>/SOLVE' */
void blkdiag_CSGxleFs(const real_T varargin_1[16], const real_T varargin_2[9],
                      real_T y[49])
{
  int32_T i;
  int32_T y_tmp;
  memset(&y[0], 0, 49U * sizeof(real_T));
  for (i = 0; i < 4; i++) {
    y_tmp = i << 2;
    y[7 * i] = varargin_1[y_tmp];
    y[1 + 7 * i] = varargin_1[y_tmp + 1];
    y[2 + 7 * i] = varargin_1[y_tmp + 2];
    y[3 + 7 * i] = varargin_1[y_tmp + 3];
  }

  for (i = 0; i < 3; i++) {
    y_tmp = 7 * (4 + i);
    y[4 + y_tmp] = varargin_2[3 * i];
    y[5 + y_tmp] = varargin_2[3 * i + 1];
    y[6 + y_tmp] = varargin_2[3 * i + 2];
  }
}
