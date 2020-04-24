/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/get_f_vals_mvPkw11S.c
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
#include "Q_linearize_VMBM1KcF.h"
#include "get_f_vals_mvPkw11S.h"

/*
 * Function for MATLAB Function: '<S3>/SOLVE'
 * function [f,A,Bp,Bm,Z] = get_f_vals(t,x,u,tspan,J)
 */
void get_f_vals_mvPkw11S(real_T t, const real_T x[10], const real_T u[6], const
  real_T tspan[10], const real_T J[9], real_T f[10], real_T A[100], real_T Bp[30],
  real_T Bm[30], real_T Z[10])
{
  real_T lam_km;
  real_T lam_kp;
  real_T u_tau[3];
  static const int8_T b[30] = { 0, 0, 0, 0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1,
    0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1 };

  int8_T Bp_tmp[30];
  real_T A_0[100];
  real_T A_1[10];
  int32_T i;
  int32_T i_0;

  /* '<S6>:1:233' tkm     = tspan(1); */
  /* '<S6>:1:234' tkp     = tspan(end); */
  /* '<S6>:1:235' lam_km  = (tkp - t)/(tkp - tkm); */
  lam_kp = tspan[9] - tspan[0];
  lam_km = (tspan[9] - t) / lam_kp;

  /* '<S6>:1:236' lam_kp  = (t - tkm)/(tkp - tkm); */
  lam_kp = (t - tspan[0]) / lam_kp;

  /* '<S6>:1:239' u_tau = lam_km .* u(:,1) + lam_kp .* u(:,2); */
  u_tau[0] = lam_km * u[0] + lam_kp * u[3];
  u_tau[1] = lam_km * u[1] + lam_kp * u[4];
  u_tau[2] = lam_km * u[2] + lam_kp * u[5];

  /* '<S6>:1:242' [A,B,f] = Q_linearize(t,x,u_tau,J); */
  Q_linearize_VMBM1KcF(x, u_tau, J, A, f);

  /* '<S6>:1:244' Bp  = lam_kp*B; */
  /* '<S6>:1:245' Bm  = lam_km*B; */
  for (i = 0; i < 30; i++) {
    Bp[i] = lam_kp * (real_T)b[i];
    Bm[i] = lam_km * (real_T)b[i];
    Bp_tmp[i] = b[i];
  }

  /* '<S6>:1:248' Z   = - A*x - B*u_tau; */
  for (i = 0; i < 100; i++) {
    A_0[i] = -A[i];
  }

  for (i = 0; i < 10; i++) {
    A_1[i] = 0.0;
    for (i_0 = 0; i_0 < 10; i_0++) {
      A_1[i] += A_0[10 * i_0 + i] * x[i_0];
    }

    Z[i] = A_1[i] - ((real_T)Bp_tmp[i + 20] * u_tau[2] + ((real_T)Bp_tmp[i + 10]
      * u_tau[1] + (real_T)Bp_tmp[i] * u_tau[0]));
  }
}
