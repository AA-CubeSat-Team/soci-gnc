/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/my_find_bGR2H07t.c
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
#include "my_find_bGR2H07t.h"

/*
 * Function for MATLAB Function: '<S3>/SOLVE'
 * function [Xir,Xpr] = my_find(X,Xir_size)
 */
void my_find_bGR2H07t(const real_T X[157368], real_T Xir[834], real_T Xpr[834])
{
  uint32_T id;
  int32_T row;
  int32_T n;
  int32_T k;
  real_T X_0;
  int32_T Xir_tmp;

  /* '<S6>:1:391' [n,m] = size(X); */
  /* '<S6>:1:392' Xir   = zeros(Xir_size,1); */
  /* '<S6>:1:393' Xpr   = zeros(Xir_size,1); */
  memset(&Xir[0], 0, 834U * sizeof(real_T));
  memset(&Xpr[0], 0, 834U * sizeof(real_T));

  /* '<S6>:1:394' X_nnz = nnz(X); */
  n = 0;
  for (k = 0; k < 157368; k++) {
    if (X[k] != 0.0) {
      n++;
    }
  }

  /* '<S6>:1:395' id = 1; */
  id = 1U;

  /* '<S6>:1:396' for col = 1:m */
  for (k = 0; k < 332; k++) {
    /* '<S6>:1:397' for row = 1:n */
    for (row = 0; row < 474; row++) {
      X_0 = X[474 * k + row];

      /* '<S6>:1:398' if ((X(row,col)~=0) && (id<X_nnz+1)) */
      if ((X_0 != 0.0) && (id < (real_T)n + 1.0)) {
        /* '<S6>:1:399' Xir(id) = row-1; */
        Xir_tmp = (int32_T)id - 1;
        Xir[Xir_tmp] = (1.0 + (real_T)row) - 1.0;

        /* '<S6>:1:400' Xpr(id) = X(row,col); */
        Xpr[Xir_tmp] = X_0;

        /* '<S6>:1:401' id = id + 1; */
        id++;
      }
    }
  }
}
