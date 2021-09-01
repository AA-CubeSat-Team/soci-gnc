/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: target_groundpass_lib.c
 *
 * Code generated for Simulink model 'FSW_Lib'.
 *
 * Model version                  : 1.354
 * Simulink Coder version         : 9.0 (R2018b) 24-May-2018
 * C/C++ source code generated on : Thu Jul 22 19:14:53 2021
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: NXP->Cortex-M4
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 * Validation result: Not run
 */

#include "target_groundpass_lib.h"

/* Include model header file for global data */
#include "FSW_Lib.h"
#include "FSW_Lib_private.h"
#include "rt_atan2d_snf.h"

/* Output and update for atomic system: '<S271>/target_groundpass_lib' */
void target_groundpass_lib(const real_T rtu_r_ecef_m[3], const real_T
  rtu_targ_ecef_m[3], boolean_T *rty_sc_above_target, real_T *rty_elev_sez_rad,
  real_T rty_sc2target_ecef_unit[3], const ConstB_target_groundpass_lib *localC)
{
  real_T rtb_Sum_k5[3];
  real_T rtb_MathFunction_lx[3];
  real_T rtb_Sqrt_e;
  int32_T i;
  real_T rtb_Switch_e_idx_3;
  real_T rtb_Switch_fd_idx_3;
  real_T rtb_Switch_e_idx_0;
  real_T rtb_Switch_e_idx_1;
  real_T rtb_Switch_e_idx_2;
  real_T rtb_Switch_fd_idx_0;
  real_T rtb_Switch_fd_idx_1;
  real_T rtb_Switch_fd_idx_2;

  /* Sum: '<S277>/Sum' */
  rtb_Switch_fd_idx_0 = rtu_targ_ecef_m[0] - rtu_r_ecef_m[0];

  /* Math: '<S320>/Math Function' */
  rtb_MathFunction_lx[0] = rtb_Switch_fd_idx_0 * rtb_Switch_fd_idx_0;

  /* Sum: '<S277>/Sum' */
  rtb_Sum_k5[0] = rtb_Switch_fd_idx_0;
  rtb_Switch_fd_idx_0 = rtu_targ_ecef_m[1] - rtu_r_ecef_m[1];

  /* Math: '<S320>/Math Function' */
  rtb_MathFunction_lx[1] = rtb_Switch_fd_idx_0 * rtb_Switch_fd_idx_0;

  /* Sum: '<S277>/Sum' */
  rtb_Sum_k5[1] = rtb_Switch_fd_idx_0;
  rtb_Switch_fd_idx_0 = rtu_targ_ecef_m[2] - rtu_r_ecef_m[2];

  /* Sum: '<S320>/Sum of Elements' incorporates:
   *  Math: '<S320>/Math Function'
   */
  rtb_Sqrt_e = rtb_MathFunction_lx[0];
  rtb_Sqrt_e += rtb_MathFunction_lx[1];
  rtb_Sqrt_e += rtb_Switch_fd_idx_0 * rtb_Switch_fd_idx_0;

  /* Math: '<S320>/Math Function1'
   *
   * About '<S320>/Math Function1':
   *  Operator: sqrt
   */
  if (rtb_Sqrt_e < 0.0) {
    rtb_Sqrt_e = -sqrt(fabs(rtb_Sqrt_e));
  } else {
    rtb_Sqrt_e = sqrt(rtb_Sqrt_e);
  }

  /* End of Math: '<S320>/Math Function1' */

  /* Switch: '<S320>/Switch' incorporates:
   *  Constant: '<S320>/Constant'
   *  Product: '<S320>/Product'
   */
  if (rtb_Sqrt_e > 0.0) {
    rtb_Switch_e_idx_0 = rtb_Sum_k5[0];
    rtb_Switch_e_idx_1 = rtb_Sum_k5[1];
    rtb_Switch_e_idx_2 = rtb_Switch_fd_idx_0;
    rtb_Switch_e_idx_3 = rtb_Sqrt_e;
  } else {
    rtb_Switch_e_idx_0 = rtb_Sum_k5[0] * 0.0;
    rtb_Switch_e_idx_1 = rtb_Sum_k5[1] * 0.0;
    rtb_Switch_e_idx_2 = rtb_Switch_fd_idx_0 * 0.0;
    rtb_Switch_e_idx_3 = 1.0;
  }

  /* End of Switch: '<S320>/Switch' */

  /* Product: '<S277>/Product' incorporates:
   *  Gain: '<S277>/Gain'
   */
  for (i = 0; i < 3; i++) {
    rtb_MathFunction_lx[i] = localC->VectorConcatenate[i + 6] *
      -rtb_Switch_fd_idx_0 + (localC->VectorConcatenate[i + 3] * -rtb_Sum_k5[1]
      + localC->VectorConcatenate[i] * -rtb_Sum_k5[0]);
  }

  /* End of Product: '<S277>/Product' */

  /* Sum: '<S321>/Sum of Elements' incorporates:
   *  Math: '<S321>/Math Function'
   */
  rtb_Sqrt_e = rtb_MathFunction_lx[0] * rtb_MathFunction_lx[0];
  rtb_Sqrt_e += rtb_MathFunction_lx[1] * rtb_MathFunction_lx[1];
  rtb_Sqrt_e += rtb_MathFunction_lx[2] * rtb_MathFunction_lx[2];

  /* Math: '<S321>/Math Function1'
   *
   * About '<S321>/Math Function1':
   *  Operator: sqrt
   */
  if (rtb_Sqrt_e < 0.0) {
    rtb_Sqrt_e = -sqrt(fabs(rtb_Sqrt_e));
  } else {
    rtb_Sqrt_e = sqrt(rtb_Sqrt_e);
  }

  /* End of Math: '<S321>/Math Function1' */

  /* Switch: '<S321>/Switch' incorporates:
   *  Constant: '<S321>/Constant'
   *  Product: '<S321>/Product'
   */
  if (rtb_Sqrt_e > 0.0) {
    rtb_Switch_fd_idx_0 = rtb_MathFunction_lx[0];
    rtb_Switch_fd_idx_1 = rtb_MathFunction_lx[1];
    rtb_Switch_fd_idx_2 = rtb_MathFunction_lx[2];
    rtb_Switch_fd_idx_3 = rtb_Sqrt_e;
  } else {
    rtb_Switch_fd_idx_0 = rtb_MathFunction_lx[0] * 0.0;
    rtb_Switch_fd_idx_1 = rtb_MathFunction_lx[1] * 0.0;
    rtb_Switch_fd_idx_2 = rtb_MathFunction_lx[2] * 0.0;
    rtb_Switch_fd_idx_3 = 1.0;
  }

  /* End of Switch: '<S321>/Switch' */

  /* Product: '<S321>/Divide' */
  rtb_Sum_k5[0] = rtb_Switch_fd_idx_0 / rtb_Switch_fd_idx_3;

  /* Product: '<S320>/Divide' */
  rty_sc2target_ecef_unit[0] = rtb_Switch_e_idx_0 / rtb_Switch_e_idx_3;

  /* Product: '<S321>/Divide' */
  rtb_Sum_k5[1] = rtb_Switch_fd_idx_1 / rtb_Switch_fd_idx_3;

  /* Product: '<S320>/Divide' */
  rty_sc2target_ecef_unit[1] = rtb_Switch_e_idx_1 / rtb_Switch_e_idx_3;

  /* Product: '<S321>/Divide' */
  rtb_Sum_k5[2] = rtb_Switch_fd_idx_2 / rtb_Switch_fd_idx_3;

  /* Product: '<S320>/Divide' */
  rty_sc2target_ecef_unit[2] = rtb_Switch_e_idx_2 / rtb_Switch_e_idx_3;

  /* Outputs for Atomic SubSystem: '<S277>/twonorm' */
  rtb_Sqrt_e = twonorm_h(&rtb_Sum_k5[0]);

  /* End of Outputs for SubSystem: '<S277>/twonorm' */

  /* Trigonometry: '<S277>/Atan2' */
  *rty_elev_sez_rad = rt_atan2d_snf(rtb_Sum_k5[2], rtb_Sqrt_e);

  /* RelationalOperator: '<S319>/Compare' incorporates:
   *  Constant: '<S319>/Constant'
   */
  *rty_sc_above_target = (*rty_elev_sez_rad >= 0.17453292519943295);
}

/* Output and update for atomic system: '<S271>/target_groundpass_lib1' */
void target_groundpass_lib1(const real_T rtu_r_ecef_m[3], const real_T
  rtu_targ_ecef_m[3], real_T rtu_targ_gd_lat_deg, real_T rtu_targ_lon_deg,
  boolean_T *rty_sc_above_target, real_T *rty_elev_sez_rad, real_T
  rty_sc2target_ecef_unit[3])
{
  real_T rtb_Sum_l[3];
  real_T rtb_MathFunction_d[3];
  real_T rtb_SinCos_o1;
  real_T rtb_SinCos1_o1;
  real_T rtb_VectorConcatenate[9];
  real_T rtb_Sqrt_d;
  int32_T i;
  real_T rtb_Switch_ja_idx_3;
  real_T rtb_Switch_ja_idx_0;
  real_T rtb_Switch_ja_idx_1;
  real_T rtb_Switch_ja_idx_2;
  real_T rtb_Switch_kl_idx_0;
  real_T rtb_Switch_kl_idx_2;

  /* Sum: '<S278>/Sum' */
  rtb_Switch_kl_idx_0 = rtu_targ_ecef_m[0] - rtu_r_ecef_m[0];

  /* Math: '<S326>/Math Function' */
  rtb_MathFunction_d[0] = rtb_Switch_kl_idx_0 * rtb_Switch_kl_idx_0;

  /* Sum: '<S278>/Sum' */
  rtb_Sum_l[0] = rtb_Switch_kl_idx_0;
  rtb_Switch_kl_idx_0 = rtu_targ_ecef_m[1] - rtu_r_ecef_m[1];

  /* Math: '<S326>/Math Function' */
  rtb_MathFunction_d[1] = rtb_Switch_kl_idx_0 * rtb_Switch_kl_idx_0;

  /* Sum: '<S278>/Sum' */
  rtb_Sum_l[1] = rtb_Switch_kl_idx_0;
  rtb_Switch_kl_idx_0 = rtu_targ_ecef_m[2] - rtu_r_ecef_m[2];

  /* Sum: '<S326>/Sum of Elements' incorporates:
   *  Math: '<S326>/Math Function'
   */
  rtb_SinCos_o1 = (rtb_MathFunction_d[0] + rtb_MathFunction_d[1]) +
    rtb_Switch_kl_idx_0 * rtb_Switch_kl_idx_0;

  /* Math: '<S326>/Math Function1'
   *
   * About '<S326>/Math Function1':
   *  Operator: sqrt
   */
  if (rtb_SinCos_o1 < 0.0) {
    rtb_SinCos_o1 = -sqrt(fabs(rtb_SinCos_o1));
  } else {
    rtb_SinCos_o1 = sqrt(rtb_SinCos_o1);
  }

  /* End of Math: '<S326>/Math Function1' */

  /* Switch: '<S326>/Switch' incorporates:
   *  Constant: '<S326>/Constant'
   *  Product: '<S326>/Product'
   */
  if (rtb_SinCos_o1 > 0.0) {
    rtb_Switch_ja_idx_0 = rtb_Sum_l[0];
    rtb_Switch_ja_idx_1 = rtb_Sum_l[1];
    rtb_Switch_ja_idx_2 = rtb_Switch_kl_idx_0;
    rtb_Switch_ja_idx_3 = rtb_SinCos_o1;
  } else {
    rtb_Switch_ja_idx_0 = rtb_Sum_l[0] * 0.0;
    rtb_Switch_ja_idx_1 = rtb_Sum_l[1] * 0.0;
    rtb_Switch_ja_idx_2 = rtb_Switch_kl_idx_0 * 0.0;
    rtb_Switch_ja_idx_3 = 1.0;
  }

  /* End of Switch: '<S326>/Switch' */

  /* Gain: '<S278>/deg2rad1' */
  rtb_SinCos_o1 = 0.017453292519943295 * rtu_targ_gd_lat_deg;

  /* Trigonometry: '<S328>/SinCos' */
  rtb_Switch_kl_idx_2 = cos(rtb_SinCos_o1);
  rtb_SinCos_o1 = sin(rtb_SinCos_o1);

  /* Gain: '<S278>/deg2rad2' */
  rtb_SinCos1_o1 = 0.017453292519943295 * rtu_targ_lon_deg;

  /* Trigonometry: '<S328>/SinCos1' */
  rtb_Sqrt_d = cos(rtb_SinCos1_o1);
  rtb_SinCos1_o1 = sin(rtb_SinCos1_o1);

  /* Product: '<S328>/Product' incorporates:
   *  Trigonometry: '<S328>/SinCos1'
   */
  rtb_VectorConcatenate[0] = rtb_SinCos_o1 * rtb_Sqrt_d;

  /* Gain: '<S328>/Gain1' */
  rtb_VectorConcatenate[1] = -rtb_SinCos1_o1;

  /* Product: '<S328>/Product2' incorporates:
   *  Trigonometry: '<S328>/SinCos'
   *  Trigonometry: '<S328>/SinCos1'
   */
  rtb_VectorConcatenate[2] = rtb_Switch_kl_idx_2 * rtb_Sqrt_d;

  /* Product: '<S328>/Product1' */
  rtb_VectorConcatenate[3] = rtb_SinCos_o1 * rtb_SinCos1_o1;

  /* SignalConversion: '<S330>/ConcatBufferAtVector ConcatenateIn5' incorporates:
   *  Trigonometry: '<S328>/SinCos1'
   */
  rtb_VectorConcatenate[4] = rtb_Sqrt_d;

  /* Product: '<S328>/Product3' incorporates:
   *  Trigonometry: '<S328>/SinCos'
   */
  rtb_VectorConcatenate[5] = rtb_Switch_kl_idx_2 * rtb_SinCos1_o1;

  /* Gain: '<S328>/Gain' incorporates:
   *  Trigonometry: '<S328>/SinCos'
   */
  rtb_VectorConcatenate[6] = -rtb_Switch_kl_idx_2;

  /* SignalConversion: '<S330>/ConcatBufferAtVector ConcatenateIn8' incorporates:
   *  Constant: '<S328>/Constant'
   */
  rtb_VectorConcatenate[7] = 0.0;

  /* SignalConversion: '<S330>/ConcatBufferAtVector ConcatenateIn9' */
  rtb_VectorConcatenate[8] = rtb_SinCos_o1;

  /* Product: '<S278>/Product' incorporates:
   *  Gain: '<S278>/Gain'
   */
  for (i = 0; i < 3; i++) {
    rtb_MathFunction_d[i] = rtb_VectorConcatenate[i + 6] * -rtb_Switch_kl_idx_0
      + (rtb_VectorConcatenate[i + 3] * -rtb_Sum_l[1] + rtb_VectorConcatenate[i]
         * -rtb_Sum_l[0]);
  }

  /* End of Product: '<S278>/Product' */

  /* Sum: '<S327>/Sum of Elements' incorporates:
   *  Math: '<S327>/Math Function'
   */
  rtb_Sqrt_d = rtb_MathFunction_d[0] * rtb_MathFunction_d[0];
  rtb_Sqrt_d += rtb_MathFunction_d[1] * rtb_MathFunction_d[1];
  rtb_Sqrt_d += rtb_MathFunction_d[2] * rtb_MathFunction_d[2];

  /* Math: '<S327>/Math Function1'
   *
   * About '<S327>/Math Function1':
   *  Operator: sqrt
   */
  if (rtb_Sqrt_d < 0.0) {
    rtb_Sqrt_d = -sqrt(fabs(rtb_Sqrt_d));
  } else {
    rtb_Sqrt_d = sqrt(rtb_Sqrt_d);
  }

  /* End of Math: '<S327>/Math Function1' */

  /* Switch: '<S327>/Switch' incorporates:
   *  Constant: '<S327>/Constant'
   *  Product: '<S327>/Product'
   */
  if (rtb_Sqrt_d > 0.0) {
    rtb_Switch_kl_idx_0 = rtb_MathFunction_d[0];
    rtb_SinCos_o1 = rtb_MathFunction_d[1];
    rtb_Switch_kl_idx_2 = rtb_MathFunction_d[2];
    rtb_SinCos1_o1 = rtb_Sqrt_d;
  } else {
    rtb_Switch_kl_idx_0 = rtb_MathFunction_d[0] * 0.0;
    rtb_SinCos_o1 = rtb_MathFunction_d[1] * 0.0;
    rtb_Switch_kl_idx_2 = rtb_MathFunction_d[2] * 0.0;
    rtb_SinCos1_o1 = 1.0;
  }

  /* End of Switch: '<S327>/Switch' */

  /* Product: '<S327>/Divide' */
  rtb_Sum_l[0] = rtb_Switch_kl_idx_0 / rtb_SinCos1_o1;

  /* Product: '<S326>/Divide' */
  rty_sc2target_ecef_unit[0] = rtb_Switch_ja_idx_0 / rtb_Switch_ja_idx_3;

  /* Product: '<S327>/Divide' */
  rtb_Sum_l[1] = rtb_SinCos_o1 / rtb_SinCos1_o1;

  /* Product: '<S326>/Divide' */
  rty_sc2target_ecef_unit[1] = rtb_Switch_ja_idx_1 / rtb_Switch_ja_idx_3;

  /* Product: '<S327>/Divide' */
  rtb_Sum_l[2] = rtb_Switch_kl_idx_2 / rtb_SinCos1_o1;

  /* Product: '<S326>/Divide' */
  rty_sc2target_ecef_unit[2] = rtb_Switch_ja_idx_2 / rtb_Switch_ja_idx_3;

  /* Outputs for Atomic SubSystem: '<S278>/twonorm' */
  rtb_Sqrt_d = twonorm_h(&rtb_Sum_l[0]);

  /* End of Outputs for SubSystem: '<S278>/twonorm' */

  /* Trigonometry: '<S278>/Atan2' */
  *rty_elev_sez_rad = rt_atan2d_snf(rtb_Sum_l[2], rtb_Sqrt_d);

  /* RelationalOperator: '<S325>/Compare' incorporates:
   *  Constant: '<S325>/Constant'
   */
  *rty_sc_above_target = (*rty_elev_sez_rad >= 0.17453292519943295);
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
