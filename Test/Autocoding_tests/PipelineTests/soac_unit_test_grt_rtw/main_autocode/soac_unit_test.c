/*
 * soac_unit_test.c
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
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: ARM Compatible->ARM 7
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "soac_unit_test.h"
#include "soac_unit_test_private.h"
#include "Q_SLERP_sBC0KHXn.h"
#include "blkdiag_CSGxleFs.h"
#include "convert_to_CCS_D5nRpXyA.h"
#include "convert_to_CCS_NXM9uvbW.h"
#include "eye_bAKT5eRN.h"
#include "foh_4t8rPkG0.h"
#include "interp1_3IXp8So0.h"
#include "inv_v2jI2dX7.h"
#include "kron_d7bwd3lR.h"
#include "kron_gzkpgh2R.h"
#include "kron_mrguWHGo.h"
#include "norm_UjNDAYVY.h"
#include "norm_ajWdQkav.h"
#include "schur_hD1lAh31.h"

/* Block signals (default storage) */
B_soac_unit_test_T soac_unit_test_B;

/* Block states (default storage) */
DW_soac_unit_test_T soac_unit_test_DW;

/* Previous zero-crossings (trigger) states */
PrevZCX_soac_unit_test_T soac_unit_test_PrevZCX;

/* Real-time model */
RT_MODEL_soac_unit_test_T soac_unit_test_M_;
RT_MODEL_soac_unit_test_T *const soac_unit_test_M = &soac_unit_test_M_;

/* Forward declaration for local functions */
static void soac_unit_t_parse_ecos_qjx5ENVn(const real_T xi[10], const real_T
  xf[7], const real_T J[9], const real_T EH[10000], const real_T BE[3000], const
  real_T ES[100], const real_T AR[100], const real_T ME[16], const real_T MI[16],
  real_T T_max, real_T w_max, real_T s_max, real_T s_min, real_T w_v, const
  real_T Dx[100], const real_T Du[9], real_T Ds, const real_T iDx[100], real_T
  c[332], real_T G[157368], real_T h[474], real_T A[38844], real_T b[117]);

/* Output and update for Simulink Function: '<S3>/call to ECOS SOCP solver (compiled C function)' */
void soac_unit_test_run_ecos(real_T rtu_n, real_T rtu_m, real_T rtu_p, real_T
  rtu_l, real_T rtu_ncones, const real_T rtu_c[332], const real_T rtu_Gjc[333],
  const real_T rtu_Gir[834], const real_T rtu_Gpr[834], const real_T rtu_h[474],
  const real_T rtu_q[21], const real_T rtu_Ajc[333], const real_T rtu_Air[1278],
  const real_T rtu_Apr[1278], const real_T rtu_b[117], real_T rty_y[334])
{
  /* local block i/o variables */
  real_T rtb_TmpSignalConversionAtcOutpo[332];
  real_T rtb_TmpSignalConversionAthOutpo[474];
  real_T rtb_TmpSignalConversionAtbOutpo[117];
  real_T rtb_sfun_ecos[334];
  int32_T rtb_DataTypeConversion;
  int32_T rtb_DataTypeConversion1;
  int32_T rtb_DataTypeConversion2;
  int32_T rtb_DataTypeConversion3;
  int32_T rtb_DataTypeConversion4;
  int32_T rtb_DataTypeConversion5[333];
  int32_T rtb_DataTypeConversion6[834];
  int32_T rtb_DataTypeConversion7[21];
  int32_T rtb_DataTypeConversion8[333];
  int32_T i;

  /* DataTypeConversion: '<S7>/Data Type Conversion' incorporates:
   *  SignalConversion: '<S7>/TmpSignal ConversionAtnOutport1'
   */
  rtb_DataTypeConversion = (int32_T)floor(rtu_n);

  /* DataTypeConversion: '<S7>/Data Type Conversion1' incorporates:
   *  SignalConversion: '<S7>/TmpSignal ConversionAtmOutport1'
   */
  rtb_DataTypeConversion1 = (int32_T)floor(rtu_m);

  /* DataTypeConversion: '<S7>/Data Type Conversion2' incorporates:
   *  SignalConversion: '<S7>/TmpSignal ConversionAtpOutport1'
   */
  rtb_DataTypeConversion2 = (int32_T)floor(rtu_p);

  /* DataTypeConversion: '<S7>/Data Type Conversion3' incorporates:
   *  SignalConversion: '<S7>/TmpSignal ConversionAtlOutport1'
   */
  rtb_DataTypeConversion3 = (int32_T)floor(rtu_l);

  /* DataTypeConversion: '<S7>/Data Type Conversion4' incorporates:
   *  SignalConversion: '<S7>/TmpSignal ConversionAtnconesOutport1'
   */
  rtb_DataTypeConversion4 = (int32_T)floor(rtu_ncones);

  /* SignalConversion: '<S7>/TmpSignal ConversionAtcOutport1' */
  memcpy(&rtb_TmpSignalConversionAtcOutpo[0], &rtu_c[0], 332U * sizeof(real_T));

  /* DataTypeConversion: '<S7>/Data Type Conversion5' incorporates:
   *  SignalConversion: '<S7>/TmpSignal ConversionAtGjcOutport1'
   */
  for (i = 0; i < 333; i++) {
    rtb_DataTypeConversion5[i] = (int32_T)floor(rtu_Gjc[i]);
  }

  /* End of DataTypeConversion: '<S7>/Data Type Conversion5' */
  for (i = 0; i < 834; i++) {
    /* SignalConversion: '<S7>/TmpSignal ConversionAtGirOutport1' */
    soac_unit_test_B.TmpSignalConversionAtGprOut[i] = rtu_Gir[i];

    /* DataTypeConversion: '<S7>/Data Type Conversion6' */
    rtb_DataTypeConversion6[i] = (int32_T)floor
      (soac_unit_test_B.TmpSignalConversionAtGprOut[i]);

    /* SignalConversion: '<S7>/TmpSignal ConversionAtGprOutport1' */
    soac_unit_test_B.TmpSignalConversionAtGprOut[i] = rtu_Gpr[i];
  }

  /* SignalConversion: '<S7>/TmpSignal ConversionAthOutport1' */
  memcpy(&rtb_TmpSignalConversionAthOutpo[0], &rtu_h[0], 474U * sizeof(real_T));

  /* DataTypeConversion: '<S7>/Data Type Conversion7' incorporates:
   *  SignalConversion: '<S7>/TmpSignal ConversionAtqOutport1'
   */
  for (i = 0; i < 21; i++) {
    rtb_DataTypeConversion7[i] = (int32_T)floor(rtu_q[i]);
  }

  /* End of DataTypeConversion: '<S7>/Data Type Conversion7' */

  /* DataTypeConversion: '<S7>/Data Type Conversion8' incorporates:
   *  SignalConversion: '<S7>/TmpSignal ConversionAtAjcOutport1'
   */
  for (i = 0; i < 333; i++) {
    rtb_DataTypeConversion8[i] = (int32_T)floor(rtu_Ajc[i]);
  }

  /* End of DataTypeConversion: '<S7>/Data Type Conversion8' */
  for (i = 0; i < 1278; i++) {
    /* SignalConversion: '<S7>/TmpSignal ConversionAtAirOutport1' */
    soac_unit_test_B.TmpSignalConversionAtAprOut[i] = rtu_Air[i];

    /* DataTypeConversion: '<S7>/Data Type Conversion9' */
    soac_unit_test_B.DataTypeConversion9[i] = (int32_T)floor
      (soac_unit_test_B.TmpSignalConversionAtAprOut[i]);

    /* SignalConversion: '<S7>/TmpSignal ConversionAtAprOutport1' */
    soac_unit_test_B.TmpSignalConversionAtAprOut[i] = rtu_Apr[i];
  }

  /* SignalConversion: '<S7>/TmpSignal ConversionAtbOutport1' */
  memcpy(&rtb_TmpSignalConversionAtbOutpo[0], &rtu_b[0], 117U * sizeof(real_T));

  /* S-Function (sfun_ecos): '<S7>/sfun_ecos' */
  callecos(rtb_DataTypeConversion, rtb_DataTypeConversion1,
           rtb_DataTypeConversion2, rtb_DataTypeConversion3,
           rtb_DataTypeConversion4, (real_T*)&rtb_TmpSignalConversionAtcOutpo[0],
           (int32_T*)&rtb_DataTypeConversion5[0], (int32_T*)
           &rtb_DataTypeConversion6[0], (real_T*)
           &soac_unit_test_B.TmpSignalConversionAtGprOut[0], (real_T*)
           &rtb_TmpSignalConversionAthOutpo[0], (int32_T*)
           &rtb_DataTypeConversion7[0], (int32_T*)&rtb_DataTypeConversion8[0],
           (int32_T*)&soac_unit_test_B.DataTypeConversion9[0], (real_T*)
           &soac_unit_test_B.TmpSignalConversionAtAprOut[0], (real_T*)
           &rtb_TmpSignalConversionAtbOutpo[0], &rtb_sfun_ecos[0]);

  /* SignalConversion: '<S7>/TmpSignal ConversionAtyInport1' */
  memcpy(&rty_y[0], &rtb_sfun_ecos[0], 334U * sizeof(real_T));
}

/*
 * Function for MATLAB Function: '<S3>/SOLVE'
 * function [c,G,h,A,b] = parse_ecos(xi,xf,J,EH,BE,ES,AR,N,...
 *                                   ME,MI,T_max,w_max,s_max,s_min,...
 *                                   w_v,Dx,Du,Ds,iDx,config)
 */
static void soac_unit_t_parse_ecos_qjx5ENVn(const real_T xi[10], const real_T
  xf[7], const real_T J[9], const real_T EH[10000], const real_T BE[3000], const
  real_T ES[100], const real_T AR[100], const real_T ME[16], const real_T MI[16],
  real_T T_max, real_T w_max, real_T s_max, real_T s_min, real_T w_v, const
  real_T Dx[100], const real_T Du[9], real_T Ds, const real_T iDx[100], real_T
  c[332], real_T G[157368], real_T h[474], real_T A[38844], real_T b[117])
{
  real_T u_max[30];
  real_T Hs[332];
  real_T hquad_[92];
  int8_T Hk[3320];
  real_T hquad__[152];
  real_T b_w_max[30];
  static const real_T d[100] = { 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    1.0 };

  static const int8_T e[3320] = { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0 };

  static const real_T f[16] = { 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0,
    1.0, 0.0, 0.0, 0.0, 0.0, 1.0 };

  static const real_T g[92] = { 0.70710678118654746, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.70710678118654746, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

  static const real_T i[6] = { 2.1213203435596424, 0.0, 0.0, 0.0, 0.0,
    -0.70710678118654746 };

  static const int8_T a[9] = { 1, 0, 0, 0, 1, 0, 0, 0, 1 };

  static const real_T j[332] = { -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.70710678118654746, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, -0.0 };

  static const real_T l[332] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.70710678118654746, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

  static const int8_T c_b[40] = { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

  int32_T i_0;
  real_T tmp[49];
  real_T a_0[9];
  real_T tmp_0[30];
  real_T tmp_1[30];
  real_T MI_0[40];
  real_T MI_1[40];
  real_T tmp_2;
  int32_T a_tmp;
  int32_T a_tmp_0;
  int32_T Dx_tmp;
  int32_T MI_tmp;
  int32_T MI_tmp_0;

  /* '<S6>:1:301' u_max = T_max .* ones(N*3,1); */
  /* '<S6>:1:302' w_max = w_max .* ones(N*3,1); */
  for (i_0 = 0; i_0 < 30; i_0++) {
    u_max[i_0] = T_max;
    b_w_max[i_0] = w_max;
  }

  /* '<S6>:1:303' Nx = 10; */
  /* '<S6>:1:304' Nu = 3; */
  /* '<S6>:1:306' Dw = Dx(5:7,5:7); */
  /* '<S6>:1:308' Hw  = [ kron(eye(N),[zeros(3,4) inv(J) zeros(3)]*Dx) ... */
  /* '<S6>:1:309'         zeros(3*N,N*(Nu+2*Nx)+2) ]; */
  inv_v2jI2dX7(J, a_0);
  memset(&tmp_1[0], 0, 12U * sizeof(real_T));
  for (i_0 = 0; i_0 < 9; i_0++) {
    tmp_1[i_0 + 12] = a_0[i_0];
    tmp_1[i_0 + 21] = 0.0;
  }

  for (i_0 = 0; i_0 < 10; i_0++) {
    for (Dx_tmp = 0; Dx_tmp < 3; Dx_tmp++) {
      a_tmp_0 = Dx_tmp + 3 * i_0;
      tmp_0[a_tmp_0] = 0.0;
      for (a_tmp = 0; a_tmp < 10; a_tmp++) {
        tmp_0[a_tmp_0] = tmp_1[3 * a_tmp + Dx_tmp] * Dx[10 * i_0 + a_tmp] +
          tmp_0[3 * i_0 + Dx_tmp];
      }
    }
  }

  kron_gzkpgh2R(d, tmp_0, soac_unit_test_B.dv1);
  memcpy(&soac_unit_test_B.Hw[0], &soac_unit_test_B.dv1[0], 3000U * sizeof
         (real_T));
  memset(&soac_unit_test_B.Hw[3000], 0, 6960U * sizeof(real_T));

  /* '<S6>:1:310' Hu  = [ zeros(N*3,N*Nx) kron(eye(N),eye(Nu)*Du) zeros(N*3,2*N*Nx+2) ]; */
  for (i_0 = 0; i_0 < 3; i_0++) {
    for (Dx_tmp = 0; Dx_tmp < 3; Dx_tmp++) {
      a_tmp = Dx_tmp + 3 * i_0;
      a_0[a_tmp] = 0.0;
      a_tmp_0 = 3 * i_0 + Dx_tmp;
      a_0[a_tmp] = a_0[a_tmp_0] + Du[3 * i_0] * (real_T)a[Dx_tmp];
      a_0[a_tmp] = Du[3 * i_0 + 1] * (real_T)a[Dx_tmp + 3] + a_0[a_tmp_0];
      a_0[a_tmp] = Du[3 * i_0 + 2] * (real_T)a[Dx_tmp + 6] + a_0[a_tmp_0];
    }
  }

  kron_mrguWHGo(d, a_0, soac_unit_test_B.dv2);
  memset(&soac_unit_test_B.Hu[0], 0, 3000U * sizeof(real_T));
  memcpy(&soac_unit_test_B.Hu[3000], &soac_unit_test_B.dv2[0], 900U * sizeof
         (real_T));
  memset(&soac_unit_test_B.Hu[3900], 0, 6060U * sizeof(real_T));

  /* '<S6>:1:311' Hv  = [ zeros(N*Nx) zeros(N*Nx,N*3) ... */
  /* '<S6>:1:312'         zeros(N*Nx,2) eye(N*Nx) zeros(N*Nx,N*Nx) ]; */
  eye_bAKT5eRN(soac_unit_test_B.Hv_tmp);
  memset(&soac_unit_test_B.Hv[0], 0, 13200U * sizeof(real_T));
  for (i_0 = 0; i_0 < 10000; i_0++) {
    soac_unit_test_B.Hv[i_0 + 13200] = soac_unit_test_B.Hv_tmp[i_0];
    soac_unit_test_B.Hv[i_0 + 23200] = 0.0;
  }

  /* '<S6>:1:313' Hg  = [ zeros(1,N*(Nx+3)) 1 0 zeros(1,2*N*Nx) ]; */
  /* '<S6>:1:314' Hs  = [ zeros(1,N*(Nx+3)) 0 Ds zeros(1,2*N*Nx) ]; */
  memset(&Hs[0], 0, 131U * sizeof(real_T));
  Hs[131] = Ds;
  memset(&Hs[132], 0, 200U * sizeof(real_T));

  /* '<S6>:1:315' Hev = [ zeros(N*Nx,N*(2*Nx+3)+2) eye(N*Nx) ]; */
  memset(&soac_unit_test_B.Hev[0], 0, 23200U * sizeof(real_T));
  memcpy(&soac_unit_test_B.Hev[23200], &soac_unit_test_B.Hv_tmp[0], 10000U *
         sizeof(real_T));

  /* '<S6>:1:318' c = [ zeros(N*(Nx+Nu),1); 1; 0; zeros(N*Nx,1); w_v*ones(N*Nx,1) ]; */
  memset(&c[0], 0, 130U * sizeof(real_T));
  c[130] = 1.0;
  c[131] = 0.0;
  for (i_0 = 0; i_0 < 100; i_0++) {
    c[i_0 + 132] = 0.0;
    c[i_0 + 232] = w_v;
  }

  /* '<S6>:1:320' A = [ eye(Nx) repmat(zeros(Nx),1,N-1) zeros(Nx,N*(Nu+2*Nx)+2); */
  /* '<S6>:1:321'     EH-eye(size(EH)) BE zeros(N*Nx,1) ES kron(eye(N),iDx) zeros(N*Nx,N*Nx); */
  /* '<S6>:1:322'     repmat(zeros(7,Nx),1,N-1) horzcat(blkdiag(eye(4),Dw),zeros(7,3)) ... */
  /* '<S6>:1:323'     zeros(7,N*(Nu+2*Nx)+2) ]; */
  kron_d7bwd3lR(d, iDx, soac_unit_test_B.dv0);
  for (i_0 = 0; i_0 < 3; i_0++) {
    Dx_tmp = (4 + i_0) * 10;
    a_0[3 * i_0] = Dx[Dx_tmp + 4];
    a_0[1 + 3 * i_0] = Dx[Dx_tmp + 5];
    a_0[2 + 3 * i_0] = Dx[Dx_tmp + 6];
  }

  blkdiag_CSGxleFs(f, a_0, tmp);
  for (i_0 = 0; i_0 < 332; i_0++) {
    for (Dx_tmp = 0; Dx_tmp < 10; Dx_tmp++) {
      A[Dx_tmp + 117 * i_0] = e[10 * i_0 + Dx_tmp];
    }
  }

  for (i_0 = 0; i_0 < 100; i_0++) {
    for (Dx_tmp = 0; Dx_tmp < 100; Dx_tmp++) {
      a_tmp = 100 * i_0 + Dx_tmp;
      A[(Dx_tmp + 117 * i_0) + 10] = EH[a_tmp] - soac_unit_test_B.Hv_tmp[a_tmp];
    }
  }

  for (i_0 = 0; i_0 < 30; i_0++) {
    memcpy(&A[i_0 * 117 + 11710], &BE[i_0 * 100], 100U * sizeof(real_T));
  }

  for (i_0 = 0; i_0 < 100; i_0++) {
    A[i_0 + 15220] = 0.0;
    A[i_0 + 15337] = ES[i_0];
    for (Dx_tmp = 0; Dx_tmp < 100; Dx_tmp++) {
      A[(Dx_tmp + 117 * (i_0 + 132)) + 10] = soac_unit_test_B.dv0[100 * i_0 +
        Dx_tmp];
      A[(Dx_tmp + 117 * (i_0 + 232)) + 10] = 0.0;
    }
  }

  for (i_0 = 0; i_0 < 90; i_0++) {
    for (Dx_tmp = 0; Dx_tmp < 7; Dx_tmp++) {
      A[(Dx_tmp + 117 * i_0) + 110] = 0.0;
    }
  }

  for (i_0 = 0; i_0 < 7; i_0++) {
    for (Dx_tmp = 0; Dx_tmp < 7; Dx_tmp++) {
      A[(Dx_tmp + 117 * (i_0 + 90)) + 110] = tmp[7 * i_0 + Dx_tmp];
    }
  }

  for (i_0 = 0; i_0 < 3; i_0++) {
    for (Dx_tmp = 0; Dx_tmp < 7; Dx_tmp++) {
      A[(Dx_tmp + 117 * (i_0 + 97)) + 110] = 0.0;
    }
  }

  for (i_0 = 0; i_0 < 232; i_0++) {
    for (Dx_tmp = 0; Dx_tmp < 7; Dx_tmp++) {
      A[(Dx_tmp + 117 * (i_0 + 100)) + 110] = 0.0;
    }
  }

  /* '<S6>:1:324' b = [xi; -AR; xf]; */
  memcpy(&b[0], &xi[0], 10U * sizeof(real_T));
  for (i_0 = 0; i_0 < 100; i_0++) {
    b[i_0 + 10] = -AR[i_0];
  }

  for (i_0 = 0; i_0 < 7; i_0++) {
    b[i_0 + 110] = xf[i_0];
  }

  /* '<S6>:1:326' Glin    = [ Hw; -Hw; Hu; -Hu; Hs; -Hs; Hv-Hev; -Hv-Hev ]; */
  /* '<S6>:1:327' hlin    = [ w_max; w_max; u_max; u_max; ... */
  /* '<S6>:1:328'             s_max; -s_min; zeros(N*Nx,1); zeros(N*Nx,1) ]; */
  /* '<S6>:1:339' Gquad   = [ -Hg./sqrt(2); -Hu; Hg./sqrt(2) ]; */
  /* '<S6>:1:340' hquad   = [ 1/sqrt(2); zeros(size(Hu,1),1); 1/sqrt(2) ]; */
  /* '<S6>:1:341' if (strncmp(config,'bi',2)) */
  /* '<S6>:1:342' Hq  = [ eye(4) zeros(4,6) ]; */
  /* '<S6>:1:343' Gquad_ = [Gquad; zeros(60,332)]; */
  for (i_0 = 0; i_0 < 332; i_0++) {
    soac_unit_test_B.Gquad_[92 * i_0] = j[i_0];
    for (Dx_tmp = 0; Dx_tmp < 30; Dx_tmp++) {
      soac_unit_test_B.Gquad_[(Dx_tmp + 92 * i_0) + 1] = -soac_unit_test_B.Hu[30
        * i_0 + Dx_tmp];
    }

    soac_unit_test_B.Gquad_[31 + 92 * i_0] = l[i_0];
    memset(&soac_unit_test_B.Gquad_[i_0 * 92 + 32], 0, 60U * sizeof(real_T));
  }

  /* '<S6>:1:344' hquad_ = [hquad; zeros(60,1)]; */
  memcpy(&hquad_[0], &g[0], 92U * sizeof(real_T));

  /* '<S6>:1:345' for k = 1:N */
  for (a_tmp = 0; a_tmp < 10; a_tmp++) {
    /* '<S6>:1:346' Hk = zeros(Nx,332); */
    memset(&Hk[0], 0, 3320U * sizeof(int8_T));

    /* '<S6>:1:347' Hk(1:Nx,Nx*(k-1)+(1:Nx)) = eye(Nx); */
    i_0 = 10 * a_tmp;
    for (Dx_tmp = 0; Dx_tmp < 10; Dx_tmp++) {
      for (a_tmp_0 = 0; a_tmp_0 < 10; a_tmp_0++) {
        Hk[a_tmp_0 + 10 * (Dx_tmp + i_0)] = (int8_T)d[10 * Dx_tmp + a_tmp_0];
      }
    }

    /* '<S6>:1:348' Pk = MI*Hq*Dx*Hk; */
    /* '<S6>:1:349' Gk = [ zeros(1,332); -Pk; zeros(1,332) ]; */
    /* '<S6>:1:350' hk = [ 3/sqrt(2); zeros(size(Pk,1),1); -1/sqrt(2) ]; */
    /* '<S6>:1:351' Gquad_(6*(k-1)+(33:38),:) = Gk; */
    for (i_0 = 0; i_0 < 4; i_0++) {
      for (Dx_tmp = 0; Dx_tmp < 10; Dx_tmp++) {
        MI_tmp = Dx_tmp << 2;
        MI_tmp_0 = i_0 + MI_tmp;
        MI_0[MI_tmp_0] = 0.0;
        a_tmp_0 = MI_tmp + i_0;
        MI_0[MI_tmp_0] = MI_0[a_tmp_0] + (real_T)c_b[MI_tmp] * MI[i_0];
        MI_0[MI_tmp_0] = (real_T)c_b[MI_tmp + 1] * MI[i_0 + 4] + MI_0[a_tmp_0];
        MI_0[MI_tmp_0] = (real_T)c_b[MI_tmp + 2] * MI[i_0 + 8] + MI_0[a_tmp_0];
        MI_0[MI_tmp_0] = (real_T)c_b[MI_tmp + 3] * MI[i_0 + 12] + MI_0[a_tmp_0];
      }

      for (Dx_tmp = 0; Dx_tmp < 10; Dx_tmp++) {
        MI_tmp = Dx_tmp << 2;
        MI_tmp_0 = i_0 + MI_tmp;
        MI_1[MI_tmp_0] = 0.0;
        for (a_tmp_0 = 0; a_tmp_0 < 10; a_tmp_0++) {
          MI_1[MI_tmp_0] = MI_0[(a_tmp_0 << 2) + i_0] * Dx[10 * Dx_tmp + a_tmp_0]
            + MI_1[MI_tmp + i_0];
        }
      }

      for (Dx_tmp = 0; Dx_tmp < 332; Dx_tmp++) {
        tmp_2 = 0.0;
        for (a_tmp_0 = 0; a_tmp_0 < 10; a_tmp_0++) {
          tmp_2 += MI_1[(a_tmp_0 << 2) + i_0] * (real_T)Hk[10 * Dx_tmp + a_tmp_0];
        }

        soac_unit_test_B.MI[i_0 + (Dx_tmp << 2)] = -tmp_2;
      }
    }

    i_0 = 6 * a_tmp;
    for (Dx_tmp = 0; Dx_tmp < 332; Dx_tmp++) {
      soac_unit_test_B.Gquad_[(i_0 + 92 * Dx_tmp) + 32] = 0.0;
    }

    for (Dx_tmp = 0; Dx_tmp < 332; Dx_tmp++) {
      a_tmp_0 = Dx_tmp << 2;
      MI_tmp = i_0 + 92 * Dx_tmp;
      soac_unit_test_B.Gquad_[MI_tmp + 33] = soac_unit_test_B.MI[a_tmp_0];
      soac_unit_test_B.Gquad_[MI_tmp + 34] = soac_unit_test_B.MI[a_tmp_0 + 1];
      soac_unit_test_B.Gquad_[MI_tmp + 35] = soac_unit_test_B.MI[a_tmp_0 + 2];
      soac_unit_test_B.Gquad_[MI_tmp + 36] = soac_unit_test_B.MI[a_tmp_0 + 3];
    }

    for (Dx_tmp = 0; Dx_tmp < 332; Dx_tmp++) {
      soac_unit_test_B.Gquad_[(i_0 + 92 * Dx_tmp) + 37] = 0.0;
    }

    /* '<S6>:1:352' hquad_(6*(k-1)+(33:38)) = hk; */
    i_0 = 6 * a_tmp;
    for (Dx_tmp = 0; Dx_tmp < 6; Dx_tmp++) {
      hquad_[(Dx_tmp + i_0) + 32] = i[Dx_tmp];
    }
  }

  /* '<S6>:1:354' if (strcmp(config,'bie')) */
  /* '<S6>:1:355' Gquad__ = [Gquad_; zeros(60,332)]; */
  for (i_0 = 0; i_0 < 332; i_0++) {
    memcpy(&soac_unit_test_B.Gquad__[i_0 * 152], &soac_unit_test_B.Gquad_[i_0 *
           92], 92U * sizeof(real_T));
    memset(&soac_unit_test_B.Gquad__[i_0 * 152 + 92], 0, 60U * sizeof(real_T));
  }

  /* '<S6>:1:356' hquad__ = [hquad_; zeros(60,1)]; */
  memcpy(&hquad__[0], &hquad_[0], 92U * sizeof(real_T));
  memset(&hquad__[92], 0, 60U * sizeof(real_T));

  /* '<S6>:1:357' for k = 1:N */
  for (a_tmp = 0; a_tmp < 10; a_tmp++) {
    /* '<S6>:1:358' Hk = zeros(Nx,332); */
    memset(&Hk[0], 0, 3320U * sizeof(int8_T));

    /* '<S6>:1:359' Hk(1:Nx,Nx*(k-1)+(1:Nx)) = eye(Nx); */
    i_0 = 10 * a_tmp;
    for (Dx_tmp = 0; Dx_tmp < 10; Dx_tmp++) {
      for (a_tmp_0 = 0; a_tmp_0 < 10; a_tmp_0++) {
        Hk[a_tmp_0 + 10 * (Dx_tmp + i_0)] = (int8_T)d[10 * Dx_tmp + a_tmp_0];
      }
    }

    /* '<S6>:1:360' Pk = ME*Hq*Dx*Hk; */
    /* '<S6>:1:361' Gk = [ zeros(1,332); -Pk; zeros(1,332) ]; */
    /* '<S6>:1:362' hk = [ 3/sqrt(2); zeros(size(Pk,1),1); -1/sqrt(2) ]; */
    /* '<S6>:1:363' Gquad__(6*(k-1)+(33:38),:) = Gk; */
    for (i_0 = 0; i_0 < 4; i_0++) {
      for (Dx_tmp = 0; Dx_tmp < 10; Dx_tmp++) {
        MI_tmp = Dx_tmp << 2;
        MI_tmp_0 = i_0 + MI_tmp;
        MI_0[MI_tmp_0] = 0.0;
        a_tmp_0 = MI_tmp + i_0;
        MI_0[MI_tmp_0] = MI_0[a_tmp_0] + (real_T)c_b[MI_tmp] * ME[i_0];
        MI_0[MI_tmp_0] = (real_T)c_b[MI_tmp + 1] * ME[i_0 + 4] + MI_0[a_tmp_0];
        MI_0[MI_tmp_0] = (real_T)c_b[MI_tmp + 2] * ME[i_0 + 8] + MI_0[a_tmp_0];
        MI_0[MI_tmp_0] = (real_T)c_b[MI_tmp + 3] * ME[i_0 + 12] + MI_0[a_tmp_0];
      }

      for (Dx_tmp = 0; Dx_tmp < 10; Dx_tmp++) {
        MI_tmp = Dx_tmp << 2;
        MI_tmp_0 = i_0 + MI_tmp;
        MI_1[MI_tmp_0] = 0.0;
        for (a_tmp_0 = 0; a_tmp_0 < 10; a_tmp_0++) {
          MI_1[MI_tmp_0] = MI_0[(a_tmp_0 << 2) + i_0] * Dx[10 * Dx_tmp + a_tmp_0]
            + MI_1[MI_tmp + i_0];
        }
      }

      for (Dx_tmp = 0; Dx_tmp < 332; Dx_tmp++) {
        tmp_2 = 0.0;
        for (a_tmp_0 = 0; a_tmp_0 < 10; a_tmp_0++) {
          tmp_2 += MI_1[(a_tmp_0 << 2) + i_0] * (real_T)Hk[10 * Dx_tmp + a_tmp_0];
        }

        soac_unit_test_B.MI[i_0 + (Dx_tmp << 2)] = -tmp_2;
      }
    }

    i_0 = 6 * a_tmp;
    for (Dx_tmp = 0; Dx_tmp < 332; Dx_tmp++) {
      soac_unit_test_B.Gquad__[(i_0 + 152 * Dx_tmp) + 32] = 0.0;
    }

    for (Dx_tmp = 0; Dx_tmp < 332; Dx_tmp++) {
      a_tmp_0 = Dx_tmp << 2;
      MI_tmp = i_0 + 152 * Dx_tmp;
      soac_unit_test_B.Gquad__[MI_tmp + 33] = soac_unit_test_B.MI[a_tmp_0];
      soac_unit_test_B.Gquad__[MI_tmp + 34] = soac_unit_test_B.MI[a_tmp_0 + 1];
      soac_unit_test_B.Gquad__[MI_tmp + 35] = soac_unit_test_B.MI[a_tmp_0 + 2];
      soac_unit_test_B.Gquad__[MI_tmp + 36] = soac_unit_test_B.MI[a_tmp_0 + 3];
    }

    for (Dx_tmp = 0; Dx_tmp < 332; Dx_tmp++) {
      soac_unit_test_B.Gquad__[(i_0 + 152 * Dx_tmp) + 37] = 0.0;
    }

    /* '<S6>:1:364' hquad__(6*(k-1)+(33:38)) = hk; */
    i_0 = 6 * a_tmp;
    for (Dx_tmp = 0; Dx_tmp < 6; Dx_tmp++) {
      hquad__[(Dx_tmp + i_0) + 32] = i[Dx_tmp];
    }
  }

  /* '<S6>:1:366' G = [Glin;Gquad__]; */
  for (i_0 = 0; i_0 < 332; i_0++) {
    for (Dx_tmp = 0; Dx_tmp < 30; Dx_tmp++) {
      a_tmp_0 = 30 * i_0 + Dx_tmp;
      a_tmp = Dx_tmp + 474 * i_0;
      G[a_tmp] = soac_unit_test_B.Hw[a_tmp_0];
      G[a_tmp + 30] = -soac_unit_test_B.Hw[a_tmp_0];
      G[a_tmp + 60] = soac_unit_test_B.Hu[a_tmp_0];
      G[a_tmp + 90] = -soac_unit_test_B.Hu[a_tmp_0];
    }

    G[120 + 474 * i_0] = Hs[i_0];
    G[121 + 474 * i_0] = -Hs[i_0];
    for (Dx_tmp = 0; Dx_tmp < 100; Dx_tmp++) {
      a_tmp_0 = 100 * i_0 + Dx_tmp;
      a_tmp = Dx_tmp + 474 * i_0;
      G[a_tmp + 122] = soac_unit_test_B.Hv[a_tmp_0] -
        soac_unit_test_B.Hev[a_tmp_0];
      G[a_tmp + 222] = -soac_unit_test_B.Hv[a_tmp_0] -
        soac_unit_test_B.Hev[a_tmp_0];
    }

    memcpy(&G[i_0 * 474 + 322], &soac_unit_test_B.Gquad__[i_0 * 152], 152U *
           sizeof(real_T));
  }

  /* '<S6>:1:367' h = [hlin;hquad__]; */
  for (i_0 = 0; i_0 < 30; i_0++) {
    h[i_0] = b_w_max[i_0];
    h[i_0 + 30] = b_w_max[i_0];
    h[i_0 + 60] = u_max[i_0];
    h[i_0 + 90] = u_max[i_0];
  }

  h[120] = s_max;
  h[121] = -s_min;
  for (i_0 = 0; i_0 < 100; i_0++) {
    h[i_0 + 122] = 0.0;
    h[i_0 + 222] = 0.0;
  }

  memcpy(&h[322], &hquad__[0], 152U * sizeof(real_T));
}

/* Model step function */
void soac_unit_test_step(void)
{
  real_T currentTime;
  real_T Mi[16];
  real_T De[16];
  real_T Di[16];
  real_T wk[3];
  real_T qb[40];
  int8_T flag;
  int32_T k;
  int32_T b_k;
  static const int8_T b[3] = { 0, 0, -1 };

  static const int8_T b_b[3] = { 0, 1, 0 };

  static const real_T c_y[16] = { 0.50000000000000011, 0.0, 0.0, 0.0, 0.0,
    0.50000000000000011, 0.0, 0.0, 0.0, 0.0, 0.50000000000000011, 0.0, 0.0, 0.0,
    0.0, 0.50000000000000011 };

  static const int8_T d_y[16] = { 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2
  };

  static const real_T e_y[16] = { 6.123233995736766E-17, 0.0, 0.0, 0.0, 0.0,
    6.123233995736766E-17, 0.0, 0.0, 0.0, 0.0, 6.123233995736766E-17, 0.0, 0.0,
    0.0, 0.0, 6.123233995736766E-17 };

  real_T time[15];
  real_T exitcode[17];
  real_T xi[10];
  real_T xf[7];
  real_T y[334];
  real_T diff;
  real_T AR[100];
  real_T c[332];
  real_T h[474];
  real_T b_0[117];
  real_T Ajc[333];
  real_T Gjc[333];
  static const real_T d[100] = { 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    1.0 };

  static const real_T e[9] = { 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0 };

  static const real_T f[100] = { 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 1.0, 0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0,
    -0.0, 1.0 };

  static const int8_T g[21] = { 32, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
    6, 6, 6, 6, 6 };

  static const int8_T a[10000] = { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1 };

  static const int8_T b_a[900] = { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1 };

  real_T rtb_X0[100];
  real_T rtb_J[9];
  real_T rtb_ME[16];
  real_T rtb_MI[16];
  int32_T i;
  static const real_T tmp[9] = { 0.033800072, -4.88358E-5, -7.392968E-5,
    -4.88358E-5, 0.03456792999, 7.12402E-6, -7.392968E-5, 7.12402E-6,
    0.00742076536 };

  real_T g_0[21];
  real_T d_y_0[16];
  boolean_T tmp_0;
  real_T tmp_1[2];
  real_T tmp_2[2];
  int8_T tmp_3[9];
  int8_T tmp_4[9];
  real_T tmp_5[9];
  real_T b_1[9];
  real_T Mi_0[16];
  real_T rtb_J_0[3];
  int32_T i_0;
  int32_T rtb_MI_tmp;
  real_T *V;
  boolean_T exitg1;
  tmp_0 = false;

  /* Step: '<Root>/Step' */
  currentTime = soac_unit_test_M->Timing.t[0];
  if (currentTime < 0.0) {
    i = 0;
  } else {
    i = 33;
  }

  /* End of Step: '<Root>/Step' */

  /* RelationalOperator: '<S4>/Compare' incorporates:
   *  Constant: '<S1>/Constant'
   *  Constant: '<S4>/Constant'
   *  RelationalOperator: '<S1>/Compare'
   */
  soac_unit_test_B.Compare = (i == 33);

  /* UnitDelay: '<S2>/Delay Input1' */
  soac_unit_test_B.Uk1 = soac_unit_test_DW.DelayInput1_DSTATE;

  /* RelationalOperator: '<S2>/FixPt Relational Operator' */
  soac_unit_test_B.FixPtRelationalOperator = ((int32_T)soac_unit_test_B.Compare >
    (int32_T)soac_unit_test_B.Uk1);

  /* Outputs for Triggered SubSystem: '<Root>/soac_lib' incorporates:
   *  TriggerPort: '<S3>/Trigger'
   */
  if (soac_unit_test_B.FixPtRelationalOperator &&
      (soac_unit_test_PrevZCX.soac_lib_Trig_ZCE != POS_ZCSIG)) {
    /* MATLAB Function: '<S3>/INITIALIZE' incorporates:
     *  Constant: '<Root>/Constant'
     *  Constant: '<Root>/Constant2'
     *  Constant: '<Root>/Constant4'
     *  Constant: '<Root>/Constant5'
     */
    memcpy(&rtb_J[0], &tmp[0], 9U * sizeof(real_T));

    /* MATLAB Function 'soac_lib/INITIALIZE': '<S5>:1' */
    /* '<S5>:1:12' cB      = [ 0.0; 0.0; -1.0 ]; */
    /* '<S5>:1:13' ssB     = [ 0.0; 1.0; 0.0 ]; */
    /* '<S5>:1:14' amin    = deg2rad(90); */
    /* '<S5>:1:15' amax    = deg2rad(60); */
    /* '<S5>:1:16' Me      = [ sI'*cB             (skew(sI)*cB)'; */
    /* '<S5>:1:17'             skew(sI)*cB  sI*cB'+cB*sI'-(sI'*cB)*eye(3) ] - cos(amin)*eye(4); */
    /* 'skew:8' if( length(v) ~= 3 ) */
    /* 'skew:12' v_skew  = [ 0       -v(3)   v(2); */
    /* 'skew:13'             v(3)    0       -v(1); */
    /* 'skew:14'             -v(2)   v(1)    0 ]; */
    /* 'skew:8' if( length(v) ~= 3 ) */
    /* 'skew:12' v_skew  = [ 0       -v(3)   v(2); */
    /* 'skew:13'             v(3)    0       -v(1); */
    /* 'skew:14'             -v(2)   v(1)    0 ]; */
    /* '<S5>:1:18' Mi      = [ sI'*ssB             (skew(sI)*ssB)'; */
    /* '<S5>:1:19'             skew(sI)*ssB  sI*ssB'+ssB*sI'-(sI'*ssB)*eye(3) ] - cos(amax)*eye(4); */
    /* 'skew:8' if( length(v) ~= 3 ) */
    /* 'skew:12' v_skew  = [ 0       -v(3)   v(2); */
    /* 'skew:13'             v(3)    0       -v(1); */
    /* 'skew:14'             -v(2)   v(1)    0 ]; */
    /* 'skew:8' if( length(v) ~= 3 ) */
    /* 'skew:12' v_skew  = [ 0       -v(3)   v(2); */
    /* 'skew:13'             v(3)    0       -v(1); */
    /* 'skew:14'             -v(2)   v(1)    0 ]; */
    /* '<S5>:1:20' Met     = Me + 2*eye(4); */
    /* '<S5>:1:21' Mit     = 2*eye(4) - Mi; */
    /* '<S5>:1:24' [Ve,De] = schur(Met); */
    tmp_3[0] = 0;
    tmp_3[3] = 0;
    tmp_3[6] = 0;
    tmp_3[1] = 0;
    tmp_3[4] = 0;
    tmp_3[7] = -1;
    tmp_3[2] = 0;
    tmp_3[5] = 1;
    tmp_3[8] = 0;
    tmp_4[0] = 0;
    tmp_4[3] = 0;
    tmp_4[6] = 0;
    tmp_4[1] = 0;
    tmp_4[4] = 0;
    tmp_4[7] = -1;
    tmp_4[2] = 0;
    tmp_4[5] = 1;
    tmp_4[8] = 0;
    rtb_MI[0] = 0.0;
    for (i = 0; i < 3; i++) {
      tmp_5[i] = rtCP_Constant4_Value[i] * 0.0;
      b_1[i] = b[i];
      tmp_5[i + 3] = rtCP_Constant4_Value[i] * 0.0;
      currentTime = (real_T)b[i] * 0.0;
      b_1[i + 3] = currentTime;
      tmp_5[i + 6] = -rtCP_Constant4_Value[i];
      b_1[i + 6] = currentTime;
      rtb_MI[(i + 1) << 2] = -(real_T)tmp_3[i + 6] + ((real_T)tmp_3[i + 3] * 0.0
        + (real_T)tmp_3[i] * 0.0);
      rtb_MI[i + 1] = -(real_T)tmp_4[i + 6] + ((real_T)tmp_4[i + 3] * 0.0 +
        (real_T)tmp_4[i] * 0.0);
    }

    for (i = 0; i < 3; i++) {
      i_0 = (i + 1) << 2;
      rtb_MI[1 + i_0] = tmp_5[3 * i] + b_1[3 * i];
      b_k = 3 * i + 1;
      rtb_MI[2 + i_0] = tmp_5[b_k] + b_1[b_k];
      b_k = 3 * i + 2;
      rtb_MI[3 + i_0] = tmp_5[b_k] + b_1[b_k];
    }

    for (i = 0; i < 16; i++) {
      Mi[i] = (rtb_MI[i] - e_y[i]) + (real_T)d_y[i];
    }

    schur_hD1lAh31(Mi, rtb_MI, De);

    /* '<S5>:1:25' [Vi,Di] = schur(Mit); */
    tmp_3[0] = 0;
    tmp_3[3] = 0;
    tmp_3[6] = 0;
    tmp_3[1] = 0;
    tmp_3[4] = 0;
    tmp_3[7] = -1;
    tmp_3[2] = 0;
    tmp_3[5] = 1;
    tmp_3[8] = 0;
    tmp_4[0] = 0;
    tmp_4[3] = 0;
    tmp_4[6] = 0;
    tmp_4[1] = 0;
    tmp_4[4] = 0;
    tmp_4[7] = -1;
    tmp_4[2] = 0;
    tmp_4[5] = 1;
    tmp_4[8] = 0;
    Mi[0] = 0.0;
    for (i = 0; i < 3; i++) {
      tmp_5[i] = rtCP_Constant4_Value[i] * 0.0;
      b_1[i] = b_b[i];
      tmp_5[i + 3] = rtCP_Constant4_Value[i];
      b_1[i + 3] = 0.0;
      tmp_5[i + 6] = rtCP_Constant4_Value[i] * 0.0;
      b_1[i + 6] = 0.0;
      Mi[(i + 1) << 2] = (real_T)tmp_3[i + 6] * 0.0 + ((real_T)tmp_3[i + 3] +
        (real_T)tmp_3[i] * 0.0);
      Mi[i + 1] = (real_T)tmp_4[i + 6] * 0.0 + ((real_T)tmp_4[i + 3] + (real_T)
        tmp_4[i] * 0.0);
    }

    for (i = 0; i < 3; i++) {
      i_0 = (i + 1) << 2;
      Mi[1 + i_0] = tmp_5[3 * i] + b_1[3 * i];
      b_k = 3 * i + 1;
      Mi[2 + i_0] = tmp_5[b_k] + b_1[b_k];
      b_k = 3 * i + 2;
      Mi[3 + i_0] = tmp_5[b_k] + b_1[b_k];
    }

    for (i = 0; i < 16; i++) {
      d_y_0[i] = (real_T)d_y[i] - (Mi[i] - c_y[i]);
    }

    schur_hD1lAh31(d_y_0, Mi, Di);

    /* '<S5>:1:26' for k = 1:4 */
    /* '<S5>:1:27' De(k,k) = realsqrt(De(k,k)); */
    /* '<S5>:1:28' Di(k,k) = realsqrt(Di(k,k)); */
    De[0] = sqrt(De[0]);
    Di[0] = sqrt(Di[0]);

    /* '<S5>:1:27' De(k,k) = realsqrt(De(k,k)); */
    /* '<S5>:1:28' Di(k,k) = realsqrt(Di(k,k)); */
    De[5] = sqrt(De[5]);
    Di[5] = sqrt(Di[5]);

    /* '<S5>:1:27' De(k,k) = realsqrt(De(k,k)); */
    /* '<S5>:1:28' Di(k,k) = realsqrt(Di(k,k)); */
    De[10] = sqrt(De[10]);
    Di[10] = sqrt(Di[10]);

    /* '<S5>:1:27' De(k,k) = realsqrt(De(k,k)); */
    /* '<S5>:1:28' Di(k,k) = realsqrt(Di(k,k)); */
    De[15] = sqrt(De[15]);
    Di[15] = sqrt(Di[15]);

    /* '<S5>:1:30' ME  = Ve*De*Ve'; */
    /* '<S5>:1:31' MI  = Vi*Di*Vi'; */
    /* '<S5>:1:32' s_min   = soac_params.s_min; */
    /* '<S5>:1:33' s_max   = soac_params.s_max; */
    /* '<S5>:1:36' N       = 10; */
    /* '<S5>:1:37' Nx      = 10; */
    /* '<S5>:1:38' Nu      = 3; */
    /* '<S5>:1:41' J       = soac_params.inertia; */
    /* '<S5>:1:42' T_max   = soac_params.T_max; */
    /* '<S5>:1:43' w_max   = soac_params.w_max; */
    /* '<S5>:1:44' w_v     = soac_params.w_v; */
    /* '<S5>:1:47' x0  = zeros(Nx,N); */
    memset(&rtb_X0[0], 0, 100U * sizeof(real_T));

    /* '<S5>:1:48' u0  = zeros(Nu,N); */
    /* '<S5>:1:49' s0  = s_max; */
    /* '<S5>:1:50' tau = linspace(0,1,N); */
    /* '<S5>:1:51' [qb,flag] = Q_SLERP(q0,qf); */
    Q_SLERP_sBC0KHXn(rtCP_Constant_Value_c, rtCP_Constant2_Value, qb, &flag);

    /* '<S5>:1:52' if ( flag == 0 ) */
    if (flag == 0) {
      /* '<S5>:1:53' for k = 1:N */
      for (b_k = 0; b_k < 10; b_k++) {
        /* '<S5>:1:54' wk = zeros(3,1); */
        /* '<S5>:1:55' for i = 1:3 */
        for (k = 0; k < 3; k++) {
          /* '<S5>:1:56' wk(i) = interp1([0 1],[w0(i) wf(i)],tau(k),'linear'); */
          if (!tmp_0) {
            tmp_1[0] = 0.0;
            tmp_1[1] = 1.0;
            tmp_0 = true;
          }

          tmp_2[0] = 0.0;
          tmp_2[1] = 0.0;
          wk[k] = interp1_3IXp8So0(tmp_1, tmp_2, 0.1111111111111111 * (real_T)
            b_k);
        }

        /* '<S5>:1:58' x0(:,k)   = [ qb(:,k); J*wk; hw0 ]; */
        for (i = 0; i < 3; i++) {
          rtb_J_0[i] = rtb_J[i + 6] * wk[2] + (rtb_J[i + 3] * wk[1] + rtb_J[i] *
            wk[0]);
        }

        i = b_k << 2;
        rtb_X0[10 * b_k] = qb[i];
        rtb_X0[1 + 10 * b_k] = qb[i + 1];
        rtb_X0[2 + 10 * b_k] = qb[i + 2];
        rtb_X0[3 + 10 * b_k] = qb[i + 3];

        /* '<S5>:1:59' u0(:,k)     = zeros(3,1); */
        rtb_X0[4 + 10 * b_k] = rtb_J_0[0];
        rtb_X0[7 + 10 * b_k] = 0.0030768758449258504;
        rtb_X0[5 + 10 * b_k] = rtb_J_0[1];
        rtb_X0[8 + 10 * b_k] = 0.0030768758449258504;
        rtb_X0[6 + 10 * b_k] = rtb_J_0[2];
        rtb_X0[9 + 10 * b_k] = 0.0030768758449258504;
      }
    }

    /* '<S5>:1:64' X0   = reshape(x0,Nx*N,1); */
    /* '<S5>:1:65' U0   = reshape(u0,Nu*N,1); */
    for (i = 0; i < 10; i++) {
      /* MATLAB Function: '<S3>/SOLVE' incorporates:
       *  MATLAB Function: '<S3>/INITIALIZE'
       */
      memcpy(&soac_unit_test_B.X[i * 10], &rtb_X0[i * 10], 10U * sizeof(real_T));
      soac_unit_test_B.U[3 * i] = 0.0;
      soac_unit_test_B.U[1 + 3 * i] = 0.0;
      soac_unit_test_B.U[2 + 3 * i] = 0.0;
    }

    /* MATLAB Function: '<S3>/INITIALIZE' */
    for (i = 0; i < 4; i++) {
      for (i_0 = 0; i_0 < 4; i_0++) {
        b_k = i_0 << 2;
        k = i + b_k;
        d_y_0[k] = 0.0;
        rtb_MI_tmp = b_k + i;
        d_y_0[k] = d_y_0[rtb_MI_tmp] + De[b_k] * rtb_MI[i];
        d_y_0[k] = De[b_k + 1] * rtb_MI[i + 4] + d_y_0[rtb_MI_tmp];
        d_y_0[k] = De[b_k + 2] * rtb_MI[i + 8] + d_y_0[rtb_MI_tmp];
        d_y_0[k] = De[b_k + 3] * rtb_MI[i + 12] + d_y_0[rtb_MI_tmp];
      }

      for (i_0 = 0; i_0 < 4; i_0++) {
        b_k = i_0 << 2;
        k = i + b_k;
        rtb_ME[k] = 0.0;
        Mi_0[k] = 0.0;
        rtb_MI_tmp = b_k + i;
        rtb_ME[k] = rtb_ME[rtb_MI_tmp] + d_y_0[i] * rtb_MI[i_0];
        Mi_0[k] = Mi_0[rtb_MI_tmp] + Di[b_k] * Mi[i];
        rtb_ME[k] = rtb_ME[rtb_MI_tmp] + d_y_0[i + 4] * rtb_MI[i_0 + 4];
        Mi_0[k] = Di[b_k + 1] * Mi[i + 4] + Mi_0[rtb_MI_tmp];
        rtb_ME[k] = rtb_ME[rtb_MI_tmp] + d_y_0[i + 8] * rtb_MI[i_0 + 8];
        Mi_0[k] = Di[b_k + 2] * Mi[i + 8] + Mi_0[rtb_MI_tmp];
        rtb_ME[k] = rtb_ME[rtb_MI_tmp] + d_y_0[i + 12] * rtb_MI[i_0 + 12];
        Mi_0[k] = Di[b_k + 3] * Mi[i + 12] + Mi_0[rtb_MI_tmp];
      }
    }

    for (i = 0; i < 4; i++) {
      for (i_0 = 0; i_0 < 4; i_0++) {
        b_k = i_0 << 2;
        k = i + b_k;
        rtb_MI[k] = 0.0;
        b_k += i;
        rtb_MI[k] = rtb_MI[b_k] + Mi_0[i] * Mi[i_0];
        rtb_MI[k] = rtb_MI[b_k] + Mi_0[i + 4] * Mi[i_0 + 4];
        rtb_MI[k] = rtb_MI[b_k] + Mi_0[i + 8] * Mi[i_0 + 8];
        rtb_MI[k] = rtb_MI[b_k] + Mi_0[i + 12] * Mi[i_0 + 12];
      }
    }

    /* MATLAB Function: '<S3>/SOLVE' incorporates:
     *  MATLAB Function: '<S3>/INITIALIZE'
     */
    soac_unit_test_B.s = 25.0;

    /* MATLAB Function 'soac_lib/SOLVE': '<S6>:1' */
    currentTime = soac_unit_test_B.s;

    /* '<S6>:1:13' N  = 10; */
    /* '<S6>:1:14' Nx = 10; */
    /* '<S6>:1:15' Nu = 3; */
    /* '<S6>:1:16' iter_max = 15; */
    /* '<S6>:1:17' config = soac_params.config; */
    /* '<S6>:1:20' c_size   = soac_params.c_size; */
    /* '<S6>:1:21' b_size   = soac_params.b_size; */
    /* '<S6>:1:22' h_size   = soac_params.h_size; */
    /* '<S6>:1:23' q_size   = soac_params.q_size; */
    /* '<S6>:1:24' Air_size = soac_params.Air_size; */
    /* '<S6>:1:25' Ajc_size = soac_params.Ajc_size; */
    /* '<S6>:1:26' Apr_size = soac_params.Apr_size; */
    /* '<S6>:1:27' Gir_size = soac_params.Gir_size; */
    /* '<S6>:1:28' Gjc_size = soac_params.Gjc_size; */
    /* '<S6>:1:29' Gpr_size = soac_params.Gpr_size; */
    /* '<S6>:1:30' l_dim    = soac_params.l_dim; */
    /* '<S6>:1:31' soc_dim  = soac_params.soc_dim; */
    /* '<S6>:1:32' n        = c_size; */
    /* '<S6>:1:33' m        = h_size; */
    /* '<S6>:1:34' p        = b_size; */
    /* '<S6>:1:35' l        = l_dim; */
    /* '<S6>:1:36' ncones   = q_size; */
    /* '<S6>:1:37' q        = soc_dim; */
    /* '<S6>:1:38' exitcode = zeros(iter_max+2,1); */
    memset(&exitcode[0], 0, 17U * sizeof(real_T));

    /* '<S6>:1:39' time     = zeros(iter_max,1); */
    memset(&time[0], 0, 15U * sizeof(real_T));

    /* '<S6>:1:42' Dx  = soac_params.Dx; */
    /* '<S6>:1:43' Du  = soac_params.Du; */
    /* '<S6>:1:44' Ds  = soac_params.Ds; */
    /* '<S6>:1:45' iDx = soac_params.iDx; */
    /* '<S6>:1:48' xi = X(1:Nx); */
    memcpy(&xi[0], &soac_unit_test_B.X[0], 10U * sizeof(real_T));

    /* '<S6>:1:49' xf = X(Nx*(N-1)+(1:7)); */
    for (i = 0; i < 7; i++) {
      xf[i] = soac_unit_test_B.X[i + 90];
    }

    /* '<S6>:1:51' for k = 1:iter_max */
    k = 1;
    b_k = 0;
    exitg1 = false;
    while ((!exitg1) && (b_k < 15)) {
      k = b_k + 1;

      /* '<S6>:1:54' [EH,BE,ES,AR] = foh(X,U,s,N,Nx,Nu,J,Dx,Du,Ds,iDx); */
      foh_4t8rPkG0(soac_unit_test_B.X, soac_unit_test_B.U, currentTime, rtb_J, d,
                   e, f, soac_unit_test_B.EH, soac_unit_test_B.BE, rtb_X0, AR);

      /* '<S6>:1:57' [c,G,h,A,b] = parse_ecos(xi,xf,J,EH,BE,ES,AR,N,... */
      /* '<S6>:1:58'                              ME,MI,T_max,w_max,s_max,s_min,... */
      /* '<S6>:1:59'                              w_v,Dx,Du,Ds,iDx,config); */
      soac_unit_t_parse_ecos_qjx5ENVn(xi, xf, rtb_J, soac_unit_test_B.EH,
        soac_unit_test_B.BE, rtb_X0, AR, rtb_ME, rtb_MI, 0.0032, 0.1, 25.0, 15.0,
        100.0, d, e, 1.0, f, c, soac_unit_test_B.G, h, soac_unit_test_B.A, b_0);

      /* '<S6>:1:62' [Air,Ajc,Apr] = convert_to_CCS(A,Air_size); */
      convert_to_CCS_NXM9uvbW(soac_unit_test_B.A, soac_unit_test_B.Air, Ajc,
        soac_unit_test_B.Apr);

      /* '<S6>:1:63' [Gir,Gjc,Gpr] = convert_to_CCS(G,Gir_size); */
      convert_to_CCS_D5nRpXyA(soac_unit_test_B.G, soac_unit_test_B.Gir, Gjc,
        soac_unit_test_B.Gpr);

      /* '<S6>:1:66' y = run_ecos(n,m,p,l,ncones,c(1:c_size),... */
      /* '<S6>:1:67'                     Gjc(1:Gjc_size),Gir(1:Gir_size),Gpr(1:Gpr_size),... */
      /* '<S6>:1:68'                     h(1:h_size),reshape(q(1:q_size),q_size,1),... */
      /* '<S6>:1:69'                     Ajc(1:Ajc_size),Air(1:Air_size),Apr(1:Apr_size),... */
      /* '<S6>:1:70'                     b(1:b_size)); */
      for (i = 0; i < 21; i++) {
        g_0[i] = g[i];
      }

      soac_unit_test_run_ecos(332.0, 474.0, 117.0, 322.0, 21.0, c, Gjc,
        soac_unit_test_B.Gir, soac_unit_test_B.Gpr, h, g_0, Ajc,
        soac_unit_test_B.Air, soac_unit_test_B.Apr, b_0, y);

      /* '<S6>:1:73' diff        = norm(X - y(1:N*Nx),1); */
      for (i = 0; i < 100; i++) {
        rtb_X0[i] = soac_unit_test_B.X[i] - y[i];
      }

      diff = norm_ajWdQkav(rtb_X0);

      /* '<S6>:1:74' X           = soac_params.DX*y(1:N*Nx); */
      for (i = 0; i < 100; i++) {
        soac_unit_test_B.X[i] = 0.0;
        for (i_0 = 0; i_0 < 100; i_0++) {
          soac_unit_test_B.X[i] += (real_T)a[100 * i_0 + i] * y[i_0];
        }
      }

      /* '<S6>:1:75' U           = soac_params.DU*y(N*Nx+1:N*(Nx+Nu)); */
      for (i = 0; i < 30; i++) {
        soac_unit_test_B.U[i] = 0.0;
        for (i_0 = 0; i_0 < 30; i_0++) {
          soac_unit_test_B.U[i] += (real_T)b_a[30 * i_0 + i] * y[100 + i_0];
        }
      }

      /* '<S6>:1:76' s           = Ds*y(N*(Nx+Nu)+2); */
      currentTime = y[131];

      /* '<S6>:1:77' V           = y(N*(Nx+Nu)+3:N*(2*Nx+Nu)+1); */
      V = &y[132];

      /* '<S6>:1:78' exitcode(k) = y(c_size+1); */
      exitcode[b_k] = y[332];

      /* '<S6>:1:79' time(k)     = y(c_size+2); */
      time[b_k] = y[333];

      /* '<S6>:1:83' if (exitcode(k) ~= 0) */
      if (exitcode[b_k] != 0.0) {
        /* '<S6>:1:84' exitcode(iter_max+2) = -1; */
        exitcode[16] = -1.0;
      }

      /* '<S6>:1:90' if ( (k>1) && (norm(V,1) < 1e-5) && (diff < 5e-2) ) */
      if ((1 + b_k > 1) && (norm_UjNDAYVY(V) < 1.0E-5) && (diff < 0.05)) {
        /* '<S6>:1:92' exitcode(iter_max+1) = k; */
        exitcode[15] = 1.0 + (real_T)b_k;
        exitg1 = true;
      } else {
        b_k++;
      }
    }

    /* '<S6>:1:99' if (k==iter_max) */
    if (k == 15) {
      /* '<S6>:1:100' exitcode(iter_max+1) = iter_max; */
      exitcode[15] = 15.0;

      /* '<S6>:1:101' if (exitcode(iter_max+2) ~= -1 ) */
      if (exitcode[16] != -1.0) {
        /* '<S6>:1:102' if (norm(V,1) > 1e-5) */
        if (norm_UjNDAYVY(V) > 1.0E-5) {
          /* '<S6>:1:103' exitcode(iter_max+2) = 3; */
          exitcode[16] = 3.0;
        } else {
          if (diff > 0.05) {
            /* '<S6>:1:104' elseif (diff>5e-2) */
            /* '<S6>:1:105' exitcode(iter_max+2) = 4; */
            exitcode[16] = 4.0;
          }
        }
      }
    }

    soac_unit_test_B.s = currentTime;
    memcpy(&soac_unit_test_B.time[0], &time[0], 15U * sizeof(real_T));
    memcpy(&soac_unit_test_B.exitcode[0], &exitcode[0], 17U * sizeof(real_T));
  }

  soac_unit_test_PrevZCX.soac_lib_Trig_ZCE =
    soac_unit_test_B.FixPtRelationalOperator;

  /* End of Outputs for SubSystem: '<Root>/soac_lib' */

  /* ToWorkspace: '<Root>/To Workspace' */
  rt_UpdateLogVar((LogVar *)(LogVar*)
                  (soac_unit_test_DW.ToWorkspace_PWORK.LoggedData),
                  &soac_unit_test_B.X[0], 0);

  /* ToWorkspace: '<Root>/To Workspace1' */
  rt_UpdateLogVar((LogVar *)(LogVar*)
                  (soac_unit_test_DW.ToWorkspace1_PWORK.LoggedData),
                  &soac_unit_test_B.U[0], 0);

  /* ToWorkspace: '<Root>/To Workspace2' */
  rt_UpdateLogVar((LogVar *)(LogVar*)
                  (soac_unit_test_DW.ToWorkspace2_PWORK.LoggedData),
                  &soac_unit_test_B.s, 0);

  /* ToWorkspace: '<Root>/To Workspace3' */
  rt_UpdateLogVar((LogVar *)(LogVar*)
                  (soac_unit_test_DW.ToWorkspace3_PWORK.LoggedData),
                  &soac_unit_test_B.exitcode[0], 0);

  /* ToWorkspace: '<Root>/To Workspace4' */
  rt_UpdateLogVar((LogVar *)(LogVar*)
                  (soac_unit_test_DW.ToWorkspace4_PWORK.LoggedData),
                  &soac_unit_test_B.time[0], 0);

  /* Matfile logging */
  rt_UpdateTXYLogVars(soac_unit_test_M->rtwLogInfo, (soac_unit_test_M->Timing.t));

  /* Update for UnitDelay: '<S2>/Delay Input1' */
  soac_unit_test_DW.DelayInput1_DSTATE = soac_unit_test_B.Compare;

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.0s, 0.0s] */
    if ((rtmGetTFinal(soac_unit_test_M)!=-1) &&
        !((rtmGetTFinal(soac_unit_test_M)-soac_unit_test_M->Timing.t[0]) >
          soac_unit_test_M->Timing.t[0] * (DBL_EPSILON))) {
      rtmSetErrorStatus(soac_unit_test_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++soac_unit_test_M->Timing.clockTick0)) {
    ++soac_unit_test_M->Timing.clockTickH0;
  }

  soac_unit_test_M->Timing.t[0] = soac_unit_test_M->Timing.clockTick0 *
    soac_unit_test_M->Timing.stepSize0 + soac_unit_test_M->Timing.clockTickH0 *
    soac_unit_test_M->Timing.stepSize0 * 4294967296.0;

  {
    /* Update absolute timer for sample time: [0.02s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The resolution of this integer timer is 0.02, which is the step size
     * of the task. Size of "clockTick1" ensures timer will not overflow during the
     * application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    soac_unit_test_M->Timing.clockTick1++;
    if (!soac_unit_test_M->Timing.clockTick1) {
      soac_unit_test_M->Timing.clockTickH1++;
    }
  }
}

/* Model initialize function */
void soac_unit_test_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)soac_unit_test_M, 0,
                sizeof(RT_MODEL_soac_unit_test_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&soac_unit_test_M->solverInfo,
                          &soac_unit_test_M->Timing.simTimeStep);
    rtsiSetTPtr(&soac_unit_test_M->solverInfo, &rtmGetTPtr(soac_unit_test_M));
    rtsiSetStepSizePtr(&soac_unit_test_M->solverInfo,
                       &soac_unit_test_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&soac_unit_test_M->solverInfo, (&rtmGetErrorStatus
      (soac_unit_test_M)));
    rtsiSetRTModelPtr(&soac_unit_test_M->solverInfo, soac_unit_test_M);
  }

  rtsiSetSimTimeStep(&soac_unit_test_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&soac_unit_test_M->solverInfo,"FixedStepDiscrete");
  rtmSetTPtr(soac_unit_test_M, &soac_unit_test_M->Timing.tArray[0]);
  rtmSetTFinal(soac_unit_test_M, 1.0);
  soac_unit_test_M->Timing.stepSize0 = 0.02;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = NULL;
    soac_unit_test_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(soac_unit_test_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(soac_unit_test_M->rtwLogInfo, (NULL));
    rtliSetLogT(soac_unit_test_M->rtwLogInfo, "tout");
    rtliSetLogX(soac_unit_test_M->rtwLogInfo, "");
    rtliSetLogXFinal(soac_unit_test_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(soac_unit_test_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(soac_unit_test_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(soac_unit_test_M->rtwLogInfo, 0);
    rtliSetLogDecimation(soac_unit_test_M->rtwLogInfo, 1);
    rtliSetLogY(soac_unit_test_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(soac_unit_test_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(soac_unit_test_M->rtwLogInfo, (NULL));
  }

  /* block I/O */
  (void) memset(((void *) &soac_unit_test_B), 0,
                sizeof(B_soac_unit_test_T));

  /* states (dwork) */
  (void) memset((void *)&soac_unit_test_DW, 0,
                sizeof(DW_soac_unit_test_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(soac_unit_test_M->rtwLogInfo, 0.0,
    rtmGetTFinal(soac_unit_test_M), soac_unit_test_M->Timing.stepSize0,
    (&rtmGetErrorStatus(soac_unit_test_M)));

  /* Start for ToWorkspace: '<Root>/To Workspace' */
  {
    int_T dimensions[1] = { 100 };

    soac_unit_test_DW.ToWorkspace_PWORK.LoggedData = rt_CreateLogVar(
      soac_unit_test_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(soac_unit_test_M),
      soac_unit_test_M->Timing.stepSize0,
      (&rtmGetErrorStatus(soac_unit_test_M)),
      "x_star",
      SS_DOUBLE,
      0,
      0,
      0,
      100,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.02,
      1);
    if (soac_unit_test_DW.ToWorkspace_PWORK.LoggedData == (NULL))
      return;
  }

  /* Start for ToWorkspace: '<Root>/To Workspace1' */
  {
    int_T dimensions[1] = { 30 };

    soac_unit_test_DW.ToWorkspace1_PWORK.LoggedData = rt_CreateLogVar(
      soac_unit_test_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(soac_unit_test_M),
      soac_unit_test_M->Timing.stepSize0,
      (&rtmGetErrorStatus(soac_unit_test_M)),
      "u_star",
      SS_DOUBLE,
      0,
      0,
      0,
      30,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.02,
      1);
    if (soac_unit_test_DW.ToWorkspace1_PWORK.LoggedData == (NULL))
      return;
  }

  /* Start for ToWorkspace: '<Root>/To Workspace2' */
  {
    int_T dimensions[1] = { 1 };

    soac_unit_test_DW.ToWorkspace2_PWORK.LoggedData = rt_CreateLogVar(
      soac_unit_test_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(soac_unit_test_M),
      soac_unit_test_M->Timing.stepSize0,
      (&rtmGetErrorStatus(soac_unit_test_M)),
      "s_star",
      SS_DOUBLE,
      0,
      0,
      0,
      1,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.02,
      1);
    if (soac_unit_test_DW.ToWorkspace2_PWORK.LoggedData == (NULL))
      return;
  }

  /* Start for ToWorkspace: '<Root>/To Workspace3' */
  {
    int_T dimensions[1] = { 17 };

    soac_unit_test_DW.ToWorkspace3_PWORK.LoggedData = rt_CreateLogVar(
      soac_unit_test_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(soac_unit_test_M),
      soac_unit_test_M->Timing.stepSize0,
      (&rtmGetErrorStatus(soac_unit_test_M)),
      "exitcode",
      SS_DOUBLE,
      0,
      0,
      0,
      17,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.02,
      1);
    if (soac_unit_test_DW.ToWorkspace3_PWORK.LoggedData == (NULL))
      return;
  }

  /* Start for ToWorkspace: '<Root>/To Workspace4' */
  {
    int_T dimensions[1] = { 15 };

    soac_unit_test_DW.ToWorkspace4_PWORK.LoggedData = rt_CreateLogVar(
      soac_unit_test_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(soac_unit_test_M),
      soac_unit_test_M->Timing.stepSize0,
      (&rtmGetErrorStatus(soac_unit_test_M)),
      "sol_times",
      SS_DOUBLE,
      0,
      0,
      0,
      15,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.02,
      1);
    if (soac_unit_test_DW.ToWorkspace4_PWORK.LoggedData == (NULL))
      return;
  }

  /* InitializeConditions for UnitDelay: '<S2>/Delay Input1' */
  soac_unit_test_DW.DelayInput1_DSTATE = false;

  /* SystemInitialize for Triggered SubSystem: '<Root>/soac_lib' */
  /* SystemInitialize for Outport: '<S3>/opt_state' */
  memset(&soac_unit_test_B.X[0], 0, 100U * sizeof(real_T));

  /* SystemInitialize for Outport: '<S3>/opt_ctrl_Nm' */
  memset(&soac_unit_test_B.U[0], 0, 30U * sizeof(real_T));

  /* SystemInitialize for Outport: '<S3>/final_time_s' */
  soac_unit_test_B.s = 0.0;

  /* SystemInitialize for Outport: '<S3>/exitcode' */
  memset(&soac_unit_test_B.exitcode[0], 0, 17U * sizeof(real_T));

  /* SystemInitialize for Outport: '<S3>/sol_times_s' */
  memset(&soac_unit_test_B.time[0], 0, 15U * sizeof(real_T));
  soac_unit_test_PrevZCX.soac_lib_Trig_ZCE = ZERO_ZCSIG;

  /* End of SystemInitialize for SubSystem: '<Root>/soac_lib' */
}

/* Model terminate function */
void soac_unit_test_terminate(void)
{
  /* (no terminate code required) */
}
