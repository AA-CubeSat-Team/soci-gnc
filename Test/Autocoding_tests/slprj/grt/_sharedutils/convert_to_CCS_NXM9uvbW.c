/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/convert_to_CCS_NXM9uvbW.c
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
#include "my_find_I8zUmcVW.h"
#include "convert_to_CCS_NXM9uvbW.h"

/*
 * Function for MATLAB Function: '<S3>/SOLVE'
 * function [Xir,Xjc,Xpr] = convert_to_CCS(X,Xir_size)
 */
void convert_to_CCS_NXM9uvbW(const real_T X[38844], real_T Xir[1278], real_T
  Xjc[333], real_T Xpr[1278])
{
  int32_T col;
  int32_T b_n;
  int32_T b_k;

  /* '<S6>:1:381' [Xir,Xpr] = my_find(X,Xir_size); */
  my_find_I8zUmcVW(X, Xir, Xpr);

  /* '<S6>:1:382' Xjc = zeros(size(X,2)+1,1); */
  memset(&Xjc[0], 0, 333U * sizeof(real_T));

  /* '<S6>:1:383' for col = 2:size(X,2) */
  for (col = 0; col < 331; col++) {
    /* '<S6>:1:384' Xjc(col) = Xjc(col-1)+nnz(X(:,col-1)); */
    b_n = 0;
    for (b_k = 0; b_k < 117; b_k++) {
      if (X[117 * col + b_k] != 0.0) {
        b_n++;
      }
    }

    Xjc[col + 1] = Xjc[col] + (real_T)b_n;
  }

  /* '<S6>:1:386' Xjc(end) = nnz(X); */
  col = 0;
  for (b_n = 0; b_n < 38844; b_n++) {
    if (X[b_n] != 0.0) {
      col++;
    }
  }

  Xjc[332] = col;
}
