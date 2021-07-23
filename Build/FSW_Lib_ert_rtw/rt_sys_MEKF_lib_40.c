/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: rt_sys_MEKF_lib_40.c
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

#include "rt_sys_MEKF_lib_40.h"

/* Include model header file for global data */
#include "FSW_Lib.h"
#include "FSW_Lib_private.h"

/*
 * Output and update for action system:
 *    '<S186>/Negative Trace'
 *    '<S375>/Negative Trace'
 */
void NegativeTrace(const real_T rtu_DCM[9], real_T rty_qwqxqyqz[4])
{
  real_T rtb_sqrt_cb;
  real_T rtb_Switch_p_idx_0;
  real_T rtb_Switch_p_idx_1;

  /* If: '<S187>/Find Maximum Diagonal Value' */
  if ((rtu_DCM[4] > rtu_DCM[0]) && (rtu_DCM[4] > rtu_DCM[8])) {
    /* Outputs for IfAction SubSystem: '<S187>/Maximum Value at DCM(2,2)' incorporates:
     *  ActionPort: '<S192>/Action Port'
     */
    /* Sqrt: '<S192>/sqrt' incorporates:
     *  Constant: '<S204>/Constant'
     *  Sum: '<S204>/Add'
     */
    rtb_sqrt_cb = sqrt(((rtu_DCM[4] - rtu_DCM[0]) - rtu_DCM[8]) + 1.0);

    /* Switch: '<S203>/Switch' incorporates:
     *  Constant: '<S203>/Constant1'
     */
    if (rtb_sqrt_cb != 0.0) {
      rtb_Switch_p_idx_0 = 0.5;
      rtb_Switch_p_idx_1 = rtb_sqrt_cb;
    } else {
      rtb_Switch_p_idx_0 = 0.0;
      rtb_Switch_p_idx_1 = 1.0;
    }

    /* End of Switch: '<S203>/Switch' */

    /* Product: '<S203>/Product' */
    rtb_Switch_p_idx_0 /= rtb_Switch_p_idx_1;

    /* Gain: '<S192>/Gain1' incorporates:
     *  Product: '<S192>/Product'
     *  Sum: '<S202>/Add'
     */
    rty_qwqxqyqz[1] = (rtu_DCM[1] + rtu_DCM[3]) * rtb_Switch_p_idx_0;

    /* Gain: '<S192>/Gain3' incorporates:
     *  Product: '<S192>/Product'
     *  Sum: '<S201>/Add'
     */
    rty_qwqxqyqz[3] = (rtu_DCM[5] + rtu_DCM[7]) * rtb_Switch_p_idx_0;

    /* Gain: '<S192>/Gain4' incorporates:
     *  Product: '<S192>/Product'
     *  Sum: '<S200>/Add'
     */
    rty_qwqxqyqz[0] = (rtu_DCM[2] - rtu_DCM[6]) * rtb_Switch_p_idx_0;

    /* Gain: '<S192>/Gain' */
    rty_qwqxqyqz[2] = 0.5 * rtb_sqrt_cb;

    /* End of Outputs for SubSystem: '<S187>/Maximum Value at DCM(2,2)' */
  } else if (rtu_DCM[8] > rtu_DCM[0]) {
    /* Outputs for IfAction SubSystem: '<S187>/Maximum Value at DCM(3,3)' incorporates:
     *  ActionPort: '<S193>/Action Port'
     */
    /* Sqrt: '<S193>/sqrt' incorporates:
     *  Constant: '<S209>/Constant'
     *  Sum: '<S209>/Add'
     */
    rtb_sqrt_cb = sqrt(((rtu_DCM[8] - rtu_DCM[0]) - rtu_DCM[4]) + 1.0);

    /* Switch: '<S208>/Switch' incorporates:
     *  Constant: '<S208>/Constant1'
     */
    if (rtb_sqrt_cb != 0.0) {
      rtb_Switch_p_idx_0 = 0.5;
      rtb_Switch_p_idx_1 = rtb_sqrt_cb;
    } else {
      rtb_Switch_p_idx_0 = 0.0;
      rtb_Switch_p_idx_1 = 1.0;
    }

    /* End of Switch: '<S208>/Switch' */

    /* Product: '<S208>/Product' */
    rtb_Switch_p_idx_0 /= rtb_Switch_p_idx_1;

    /* Gain: '<S193>/Gain1' incorporates:
     *  Product: '<S193>/Product'
     *  Sum: '<S205>/Add'
     */
    rty_qwqxqyqz[1] = (rtu_DCM[2] + rtu_DCM[6]) * rtb_Switch_p_idx_0;

    /* Gain: '<S193>/Gain2' incorporates:
     *  Product: '<S193>/Product'
     *  Sum: '<S206>/Add'
     */
    rty_qwqxqyqz[2] = (rtu_DCM[5] + rtu_DCM[7]) * rtb_Switch_p_idx_0;

    /* Gain: '<S193>/Gain3' incorporates:
     *  Product: '<S193>/Product'
     *  Sum: '<S207>/Add'
     */
    rty_qwqxqyqz[0] = (rtu_DCM[3] - rtu_DCM[1]) * rtb_Switch_p_idx_0;

    /* Gain: '<S193>/Gain' */
    rty_qwqxqyqz[3] = 0.5 * rtb_sqrt_cb;

    /* End of Outputs for SubSystem: '<S187>/Maximum Value at DCM(3,3)' */
  } else {
    /* Outputs for IfAction SubSystem: '<S187>/Maximum Value at DCM(1,1)' incorporates:
     *  ActionPort: '<S191>/Action Port'
     */
    /* Sqrt: '<S191>/sqrt' incorporates:
     *  Constant: '<S199>/Constant'
     *  Sum: '<S199>/Add'
     */
    rtb_sqrt_cb = sqrt(((rtu_DCM[0] - rtu_DCM[4]) - rtu_DCM[8]) + 1.0);

    /* Switch: '<S198>/Switch' incorporates:
     *  Constant: '<S198>/Constant1'
     */
    if (rtb_sqrt_cb != 0.0) {
      rtb_Switch_p_idx_0 = 0.5;
      rtb_Switch_p_idx_1 = rtb_sqrt_cb;
    } else {
      rtb_Switch_p_idx_0 = 0.0;
      rtb_Switch_p_idx_1 = 1.0;
    }

    /* End of Switch: '<S198>/Switch' */

    /* Product: '<S198>/Product' */
    rtb_Switch_p_idx_0 /= rtb_Switch_p_idx_1;

    /* Gain: '<S191>/Gain1' incorporates:
     *  Product: '<S191>/Product'
     *  Sum: '<S197>/Add'
     */
    rty_qwqxqyqz[2] = (rtu_DCM[1] + rtu_DCM[3]) * rtb_Switch_p_idx_0;

    /* Gain: '<S191>/Gain2' incorporates:
     *  Product: '<S191>/Product'
     *  Sum: '<S195>/Add'
     */
    rty_qwqxqyqz[3] = (rtu_DCM[2] + rtu_DCM[6]) * rtb_Switch_p_idx_0;

    /* Gain: '<S191>/Gain3' incorporates:
     *  Product: '<S191>/Product'
     *  Sum: '<S196>/Add'
     */
    rty_qwqxqyqz[0] = (rtu_DCM[7] - rtu_DCM[5]) * rtb_Switch_p_idx_0;

    /* Gain: '<S191>/Gain' */
    rty_qwqxqyqz[1] = 0.5 * rtb_sqrt_cb;

    /* End of Outputs for SubSystem: '<S187>/Maximum Value at DCM(1,1)' */
  }

  /* End of If: '<S187>/Find Maximum Diagonal Value' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
