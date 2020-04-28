/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/Q_SLERP_sBC0KHXn.c
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
#include "Q_SLERP_sBC0KHXn.h"

/*
 * Function for MATLAB Function: '<S3>/INITIALIZE'
 * function [qt,FLAG] = Q_SLERP( q0,q1 )
 */
void Q_SLERP_sBC0KHXn(const real_T q0[4], const real_T q1[4], real_T qt[40],
                      int8_T *FLAG)
{
  real_T temp;
  real_T sang;
  real_T t;
  int32_T b_k;
  real_T x;
  int32_T qt_tmp;

  /* '<S5>:1:79' N    = 10; */
  /* '<S5>:1:80' FLAG = int8(0); */
  *FLAG = 0;

  /* '<S5>:1:82' if ( length(q0)~=4 || length(q1)~=4 ) */
  /* '<S5>:1:89' q0  = reshape(q0, 4, 1); */
  /* '<S5>:1:90' q1  = reshape(q1, 4 ,1); */
  /* '<S5>:1:94' temp = dot(q0,q1); */
  temp = ((q0[0] * q1[0] + q0[1] * q1[1]) + q0[2] * q1[2]) + q0[3] * q1[3];

  /* '<S5>:1:95' if (1.0-temp<0) */
  if (1.0 - temp < 0.0) {
    /* '<S5>:1:96' ang = 0.0; */
    temp = 0.0;
  } else {
    /* '<S5>:1:97' else */
    /* '<S5>:1:98' ang = acos(temp); */
    temp = acos(temp);
  }

  /* '<S5>:1:100' if ( ang > pi ) */
  if (temp > 3.1415926535897931) {
    /* '<S5>:1:101' FLAG = int8(2); */
    *FLAG = 2;

    /* '<S5>:1:102' qt   = repmat([1.0;0.0;0.0;0.0],1,N); */
    for (b_k = 0; b_k < 10; b_k++) {
      qt_tmp = b_k << 2;
      qt[qt_tmp] = 1.0;
      qt[qt_tmp + 1] = 0.0;
      qt[qt_tmp + 2] = 0.0;
      qt[qt_tmp + 3] = 0.0;
    }
  } else {
    /* '<S5>:1:106' sang = sin(ang); */
    sang = sin(temp);

    /* '<S5>:1:108' if (sang<1e-8) */
    if (sang < 1.0E-8) {
      /* '<S5>:1:109' qt = repmat(q0,1,N); */
      for (b_k = 0; b_k < 10; b_k++) {
        qt_tmp = b_k << 2;
        qt[qt_tmp] = q0[0];
        qt[qt_tmp + 1] = q0[1];
        qt[qt_tmp + 2] = q0[2];
        qt[qt_tmp + 3] = q0[3];
      }
    } else {
      /* '<S5>:1:110' else */
      /* '<S5>:1:111' qt   = zeros(4,N); */
      /* '<S5>:1:112' for k = 1:N */
      for (b_k = 0; b_k < 10; b_k++) {
        /* '<S5>:1:113' t       = (k-1)/(N-1); */
        t = ((1.0 + (real_T)b_k) - 1.0) / 9.0;

        /* '<S5>:1:114' qt(:,k) = (sin((1 - t)*ang)/sang).*q0 + (sin(t*ang)/sang).*q1; */
        x = sin((1.0 - t) * temp);
        t = sin(t * temp);
        x /= sang;
        t /= sang;
        qt_tmp = b_k << 2;
        qt[qt_tmp] = x * q0[0] + t * q1[0];
        qt[1 + qt_tmp] = x * q0[1] + t * q1[1];
        qt[2 + qt_tmp] = x * q0[2] + t * q1[2];
        qt[3 + qt_tmp] = x * q0[3] + t * q1[3];
      }
    }
  }
}
