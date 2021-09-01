/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: quat_err_lib.c
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

#include "quat_err_lib.h"

/* Include model header file for global data */
#include "FSW_Lib.h"
#include "FSW_Lib_private.h"

/* Output and update for atomic system: '<S5>/quat_err_lib' */
void quat_err_lib(const real_T rtu_quat_cmd[4], const real_T rtu_quat_sc[4],
                  real_T rty_quat_err[4])
{
  real_T rtb_TmpSignalConversionAtquat_j[4];

  /* SignalConversion: '<S228>/TmpSignal ConversionAtquat_rectify_libInport1' incorporates:
   *  Product: '<S253>/Product'
   *  Product: '<S253>/Product1'
   *  Product: '<S253>/Product2'
   *  Product: '<S253>/Product3'
   *  Product: '<S254>/Product'
   *  Product: '<S254>/Product1'
   *  Product: '<S254>/Product2'
   *  Product: '<S254>/Product3'
   *  Product: '<S255>/Product'
   *  Product: '<S255>/Product1'
   *  Product: '<S255>/Product2'
   *  Product: '<S255>/Product3'
   *  Product: '<S256>/Product'
   *  Product: '<S256>/Product1'
   *  Product: '<S256>/Product2'
   *  Product: '<S256>/Product3'
   *  Sum: '<S253>/Sum'
   *  Sum: '<S254>/Sum'
   *  Sum: '<S255>/Sum'
   *  Sum: '<S256>/Sum'
   *  UnaryMinus: '<S250>/Unary Minus'
   *  UnaryMinus: '<S250>/Unary Minus1'
   *  UnaryMinus: '<S250>/Unary Minus2'
   */
  rtb_TmpSignalConversionAtquat_j[0] = ((rtu_quat_cmd[0] * rtu_quat_sc[0] -
    -rtu_quat_cmd[1] * rtu_quat_sc[1]) - -rtu_quat_cmd[2] * rtu_quat_sc[2]) -
    -rtu_quat_cmd[3] * rtu_quat_sc[3];
  rtb_TmpSignalConversionAtquat_j[1] = ((rtu_quat_cmd[0] * rtu_quat_sc[1] +
    -rtu_quat_cmd[1] * rtu_quat_sc[0]) + -rtu_quat_cmd[2] * rtu_quat_sc[3]) -
    -rtu_quat_cmd[3] * rtu_quat_sc[2];
  rtb_TmpSignalConversionAtquat_j[2] = ((rtu_quat_cmd[0] * rtu_quat_sc[2] -
    -rtu_quat_cmd[1] * rtu_quat_sc[3]) + -rtu_quat_cmd[2] * rtu_quat_sc[0]) +
    -rtu_quat_cmd[3] * rtu_quat_sc[1];
  rtb_TmpSignalConversionAtquat_j[3] = ((rtu_quat_cmd[0] * rtu_quat_sc[3] +
    -rtu_quat_cmd[1] * rtu_quat_sc[2]) - -rtu_quat_cmd[2] * rtu_quat_sc[1]) +
    -rtu_quat_cmd[3] * rtu_quat_sc[0];

  /* Outputs for Atomic SubSystem: '<S228>/quat_rectify_lib' */
  quat_rectify_lib(rtb_TmpSignalConversionAtquat_j, rty_quat_err);

  /* End of Outputs for SubSystem: '<S228>/quat_rectify_lib' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
