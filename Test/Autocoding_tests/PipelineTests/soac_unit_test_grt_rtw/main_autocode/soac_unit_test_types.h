/*
 * soac_unit_test_types.h
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

#ifndef RTW_HEADER_soac_unit_test_types_h_
#define RTW_HEADER_soac_unit_test_types_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"

/* Custom Type definition for MATLAB Function: '<S3>/SOLVE' */
#ifndef struct_tag_sKpQB9jVSEZrFP5iOeb0DOE
#define struct_tag_sKpQB9jVSEZrFP5iOeb0DOE

struct tag_sKpQB9jVSEZrFP5iOeb0DOE
{
  real_T sc_mode;
  real_T quat_in[4];
  real_T w_body_radps[3];
  real_T hw_Nms[3];
  real_T quat_cmd[4];
  real_T w_body_cmd_radps[3];
  real_T sun_inertial_unit[3];
  real_T gps_epoch_s[2];
  real_T gps_time_s[2];
  real_T cmd_torque[3];
  real_T cmd_state[10];
};

#endif                                 /*struct_tag_sKpQB9jVSEZrFP5iOeb0DOE*/

#ifndef typedef_sKpQB9jVSEZrFP5iOeb0DOE_soac__T
#define typedef_sKpQB9jVSEZrFP5iOeb0DOE_soac__T

typedef struct tag_sKpQB9jVSEZrFP5iOeb0DOE sKpQB9jVSEZrFP5iOeb0DOE_soac__T;

#endif                                 /*typedef_sKpQB9jVSEZrFP5iOeb0DOE_soac__T*/

#ifndef struct_tag_sY11QAKtY7AAPAFOIKTlv1B
#define struct_tag_sY11QAKtY7AAPAFOIKTlv1B

struct tag_sY11QAKtY7AAPAFOIKTlv1B
{
  sKpQB9jVSEZrFP5iOeb0DOE_soac__T ic;
  char_T config[3];
  real_T N;
  real_T dt;
  real_T sample_time_s;
  real_T interp_sample_time_s;
  real_T c_size;
  real_T Air_size;
  real_T Ajc_size;
  real_T Apr_size;
  real_T b_size;
  real_T Gir_size;
  real_T Gjc_size;
  real_T Gpr_size;
  real_T h_size;
  real_T q_size;
  real_T y_size;
  real_T l_dim;
  real_T soc_dim[21];
  real_T inertia[9];
  real_T w_max;
  real_T T_max;
  real_T s_min;
  real_T s_max;
  real_T w_v;
  real_T Dq[16];
  real_T Dw[9];
  real_T Dh[9];
  real_T Dx[100];
  real_T iDx[100];
  real_T Du[9];
  real_T Ds;
  real_T Dg;
  real_T DX[10000];
  real_T DU[900];
};

#endif                                 /*struct_tag_sY11QAKtY7AAPAFOIKTlv1B*/

#ifndef typedef_sY11QAKtY7AAPAFOIKTlv1B_soac__T
#define typedef_sY11QAKtY7AAPAFOIKTlv1B_soac__T

typedef struct tag_sY11QAKtY7AAPAFOIKTlv1B sY11QAKtY7AAPAFOIKTlv1B_soac__T;

#endif                                 /*typedef_sY11QAKtY7AAPAFOIKTlv1B_soac__T*/

/* Forward declaration for rtModel */
typedef struct tag_RTM_soac_unit_test_T RT_MODEL_soac_unit_test_T;

#endif                                 /* RTW_HEADER_soac_unit_test_types_h_ */
