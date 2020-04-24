/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/deriv_j3VW1WvS.c
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
#include "get_f_vals_mvPkw11S.h"
#include "mldivide_JgAM3Jry.h"
#include "mldivide_gjtSm7pm.h"
#include "deriv_j3VW1WvS.h"

/*
 * Function for MATLAB Function: '<S3>/SOLVE'
 * function DX = deriv(t,X,u,tspan,s,J)
 */
void deriv_j3VW1WvS(real_T t, const real_T X[190], const real_T u[6], const
                    real_T tspan[10], real_T s, const real_T J[9], real_T DX[190])
{
  real_T Bdp_dot[30];
  real_T Bdm_dot[30];
  real_T Sd_dot[10];
  real_T Zd_dot[10];
  real_T f[10];
  real_T A[100];
  real_T X_0[100];
  real_T s_0[100];
  int32_T i;
  int32_T i_0;
  int32_T i_1;
  int32_T s_tmp;

  /* '<S6>:1:213' Nx = 10; */
  /* '<S6>:1:214' x   = X(1:Nx); */
  /* '<S6>:1:216' [f,A,Bp,Bm,Z] = get_f_vals(t,x,u,tspan,J); */
  get_f_vals_mvPkw11S(t, &X[0], u, tspan, J, f, A, Bdp_dot, Bdm_dot, Zd_dot);

  /* '<S6>:1:218' Phi = reshape(X(Nx+1:Nx*(Nx+1)),size(A)); */
  /* '<S6>:1:220' xdot        = s*f; */
  /* '<S6>:1:221' Phi_dot     = (s*A)*Phi; */
  /* '<S6>:1:222' Bdp_dot     = Phi\(s*Bp); */
  for (i = 0; i < 30; i++) {
    Bdp_dot[i] *= s;
  }

  mldivide_gjtSm7pm(&X[10], Bdp_dot);

  /* '<S6>:1:223' Bdm_dot     = Phi\(s*Bm); */
  for (i = 0; i < 30; i++) {
    Bdm_dot[i] *= s;
  }

  mldivide_gjtSm7pm(&X[10], Bdm_dot);

  /* '<S6>:1:224' Sd_dot      = Phi\f; */
  memcpy(&Sd_dot[0], &f[0], 10U * sizeof(real_T));
  mldivide_JgAM3Jry(&X[10], Sd_dot);

  /* '<S6>:1:225' Zd_dot      = Phi\(s*Z); */
  for (i = 0; i < 10; i++) {
    Zd_dot[i] *= s;
  }

  mldivide_JgAM3Jry(&X[10], Zd_dot);

  /* '<S6>:1:227' DX      = [ xdot(:); Phi_dot(:); Bdp_dot(:);... */
  /* '<S6>:1:228'                 Bdm_dot(:); Sd_dot(:); Zd_dot(:)]; */
  memcpy(&X_0[0], &X[10], 100U * sizeof(real_T));
  for (i = 0; i < 10; i++) {
    for (i_0 = 0; i_0 < 10; i_0++) {
      s_tmp = i + 10 * i_0;
      s_0[s_tmp] = 0.0;
      for (i_1 = 0; i_1 < 10; i_1++) {
        s_0[s_tmp] = A[10 * i_1 + i] * s * X_0[10 * i_0 + i_1] + s_0[10 * i_0 +
          i];
      }
    }

    DX[i] = s * f[i];
  }

  memcpy(&DX[10], &s_0[0], 100U * sizeof(real_T));
  for (i = 0; i < 30; i++) {
    DX[i + 110] = Bdp_dot[i];
    DX[i + 140] = Bdm_dot[i];
  }

  for (i = 0; i < 10; i++) {
    DX[i + 170] = Sd_dot[i];
    DX[i + 180] = Zd_dot[i];
  }
}
