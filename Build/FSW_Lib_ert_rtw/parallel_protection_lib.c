/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: parallel_protection_lib.c
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

#include "parallel_protection_lib.h"

/* Include model header file for global data */
#include "FSW_Lib.h"
#include "FSW_Lib_private.h"

/*
 * Output and update for atomic system:
 *    '<S115>/parallel_protection_lib'
 *    '<S124>/parallel_protection_lib'
 *    '<S124>/parallel_protection_lib1'
 */
boolean_T parallel_protection_lib(const real_T rtu_vector_1[3], const real_T
  rtu_vector_2[3], real_T rtp_min_angle_deg)
{
  /* Switch: '<S125>/Switch' incorporates:
   *  Abs: '<S125>/Abs'
   *  Constant: '<S125>/min_angle_deg'
   *  DotProduct: '<S125>/Dot Product'
   *  DotProduct: '<S125>/Dot Product1'
   *  DotProduct: '<S125>/Dot Product2'
   *  Gain: '<S125>/DEG2RAD'
   *  Product: '<S125>/Divide'
   *  Product: '<S125>/Multiply'
   *  Sqrt: '<S125>/Sqrt'
   *  Sqrt: '<S125>/Sqrt1'
   *  Sum: '<S125>/Sum'
   *  Trigonometry: '<S125>/Cos'
   */
  return !(fabs(((rtu_vector_1[0] * rtu_vector_2[0] + rtu_vector_1[1] *
                  rtu_vector_2[1]) + rtu_vector_1[2] * rtu_vector_2[2]) / (sqrt
             ((rtu_vector_1[0] * rtu_vector_1[0] + rtu_vector_1[1] *
               rtu_vector_1[1]) + rtu_vector_1[2] * rtu_vector_1[2]) * sqrt
             ((rtu_vector_2[0] * rtu_vector_2[0] + rtu_vector_2[1] *
               rtu_vector_2[1]) + rtu_vector_2[2] * rtu_vector_2[2]))) - cos
           (0.017453292519943295 * rtp_min_angle_deg) >= 0.0);
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
