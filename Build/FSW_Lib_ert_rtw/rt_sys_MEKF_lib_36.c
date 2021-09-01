/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: rt_sys_MEKF_lib_36.c
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

#include "rt_sys_MEKF_lib_36.h"

/* Include model header file for global data */
#include "FSW_Lib.h"
#include "FSW_Lib_private.h"

/*
 * Output and update for action system:
 *    '<S186>/Positive Trace'
 *    '<S375>/Positive Trace'
 */
void PositiveTrace(real_T rtu_traceDCM, const real_T rtu_DCM[9], real_T
                   *rty_qwqxqyqz, real_T rty_qwqxqyqz_c[3])
{
  real_T rtb_Gain1_b;

  /* Sqrt: '<S188>/sqrt' incorporates:
   *  Constant: '<S188>/Constant'
   *  Sum: '<S188>/Sum'
   */
  rtb_Gain1_b = sqrt(rtu_traceDCM + 1.0);

  /* Gain: '<S188>/Gain' */
  *rty_qwqxqyqz = 0.5 * rtb_Gain1_b;

  /* Gain: '<S188>/Gain1' */
  rtb_Gain1_b *= 2.0;

  /* Product: '<S188>/Product' incorporates:
   *  Sum: '<S210>/Add'
   *  Sum: '<S211>/Add'
   *  Sum: '<S212>/Add'
   */
  rty_qwqxqyqz_c[0] = (rtu_DCM[7] - rtu_DCM[5]) / rtb_Gain1_b;
  rty_qwqxqyqz_c[1] = (rtu_DCM[2] - rtu_DCM[6]) / rtb_Gain1_b;
  rty_qwqxqyqz_c[2] = (rtu_DCM[3] - rtu_DCM[1]) / rtb_Gain1_b;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
