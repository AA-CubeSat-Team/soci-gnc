/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: sunSeek_lib.c
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

#include "sunSeek_lib.h"

/* Include model header file for global data */
#include "FSW_Lib.h"
#include "FSW_Lib_private.h"

/* Output and update for atomic system: '<S235>/sunSeek_lib' */
void sunSeek_lib(uint8_T rtu_ss_valid, const real_T rtu_sc2sun_pd_body_unit[3],
                 const real_T rtu_sc2sun_ss_body_unit[3], const real_T
                 rtu_w_err_radps[3], real_T rty_torque_cmd_body_Nm[3])
{
  real_T rtb_Sin;
  real_T u0;
  int32_T i;
  real_T rtb_Kp_idx_1;
  real_T rtb_Kp_idx_2;
  real_T rtb_Kp_idx_0;

  /* Switch: '<S247>/Switch' */
  if (rtu_ss_valid != 0) {
    rtb_Kp_idx_0 = rtu_sc2sun_ss_body_unit[0];
    rtb_Kp_idx_1 = rtu_sc2sun_ss_body_unit[1];
    rtb_Kp_idx_2 = rtu_sc2sun_ss_body_unit[2];
  } else {
    rtb_Kp_idx_0 = rtu_sc2sun_pd_body_unit[0];
    rtb_Kp_idx_1 = rtu_sc2sun_pd_body_unit[1];
    rtb_Kp_idx_2 = rtu_sc2sun_pd_body_unit[2];
  }

  /* End of Switch: '<S247>/Switch' */

  /* DotProduct: '<S248>/Dot Product' */
  u0 = (0.0 * rtb_Kp_idx_0 + rtb_Kp_idx_1) + 0.0 * rtb_Kp_idx_2;

  /* Saturate: '<S248>/sat_pm1' incorporates:
   *  DotProduct: '<S248>/Dot Product'
   */
  if (u0 > 1.0) {
    u0 = 1.0;
  } else {
    if (u0 < -1.0) {
      u0 = -1.0;
    }
  }

  /* End of Saturate: '<S248>/sat_pm1' */

  /* Trigonometry: '<S248>/Sin' incorporates:
   *  Gain: '<S248>/Gain'
   *  Trigonometry: '<S248>/Acos'
   */
  rtb_Sin = sin(0.5 * acos(u0));

  /* Product: '<S248>/Product' incorporates:
   *  Product: '<S249>/Element product'
   *  Sum: '<S249>/Add3'
   */
  u0 = (rtb_Kp_idx_1 * 0.0 - rtb_Kp_idx_2) * rtb_Sin;
  rtb_Kp_idx_2 = (rtb_Kp_idx_2 * 0.0 - rtb_Kp_idx_0 * 0.0) * rtb_Sin;
  rtb_Kp_idx_0 = (rtb_Kp_idx_0 - rtb_Kp_idx_1 * 0.0) * rtb_Sin;
  for (i = 0; i < 3; i++) {
    /* Sum: '<S247>/Sum' incorporates:
     *  Gain: '<S247>/Kd'
     *  Gain: '<S247>/Kp'
     */
    rty_torque_cmd_body_Nm[i] = (rtCP_Kp_Gain[i + 6] * rtb_Kp_idx_0 +
      (rtCP_Kp_Gain[i + 3] * rtb_Kp_idx_2 + rtCP_Kp_Gain[i] * u0)) -
      (rtCP_Kd_Gain[i + 6] * rtu_w_err_radps[2] + (rtCP_Kd_Gain[i + 3] *
        rtu_w_err_radps[1] + rtCP_Kd_Gain[i] * rtu_w_err_radps[0]));
  }
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
