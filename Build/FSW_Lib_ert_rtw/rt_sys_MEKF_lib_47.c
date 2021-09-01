/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: rt_sys_MEKF_lib_47.c
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

#include "rt_sys_MEKF_lib_47.h"

/* Include model header file for global data */
#include "FSW_Lib.h"
#include "FSW_Lib_private.h"

/*
 * Output and update for action system:
 *    '<S189>/If Warning//Error'
 *    '<S384>/If Warning//Error'
 */
void IfWarningError(const real_T rtu_dcm[9], real_T rtp_action, real_T
                    rtp_tolerance)
{
  boolean_T tmp;
  boolean_T rtb_Compare_fu[9];
  real_T rtu_dcm_0[9];
  int32_T i;
  int32_T i_0;

  /* Bias: '<S216>/Bias1' incorporates:
   *  Math: '<S216>/Math Function'
   *  Product: '<S216>/Product'
   */
  for (i = 0; i < 3; i++) {
    for (i_0 = 0; i_0 < 3; i_0++) {
      rtu_dcm_0[i + 3 * i_0] = ((rtu_dcm[3 * i + 1] * rtu_dcm[3 * i_0 + 1] +
        rtu_dcm[3 * i] * rtu_dcm[3 * i_0]) + rtu_dcm[3 * i + 2] * rtu_dcm[3 *
        i_0 + 2]) + rtCP_Bias1_Bias[3 * i_0 + i];
    }
  }

  for (i = 0; i < 9; i++) {
    /* RelationalOperator: '<S222>/Compare' incorporates:
     *  Abs: '<S216>/Abs2'
     *  Bias: '<S216>/Bias1'
     *  Constant: '<S222>/Constant'
     */
    rtb_Compare_fu[i] = (fabs(rtu_dcm_0[i]) > rtp_tolerance);
  }

  /* Logic: '<S216>/Logical Operator1' */
  tmp = rtb_Compare_fu[0];
  for (i = 0; i < 8; i++) {
    tmp = (tmp || rtb_Compare_fu[i + 1]);
  }

  /* If: '<S213>/If' incorporates:
   *  Abs: '<S217>/Abs1'
   *  Bias: '<S217>/Bias'
   *  Constant: '<S224>/Constant'
   *  Logic: '<S216>/Logical Operator1'
   *  Product: '<S223>/Product'
   *  Product: '<S223>/Product1'
   *  Product: '<S223>/Product2'
   *  Product: '<S223>/Product3'
   *  Product: '<S223>/Product4'
   *  Product: '<S223>/Product5'
   *  RelationalOperator: '<S224>/Compare'
   *  Sum: '<S223>/Sum'
   */
  if (fabs((((((rtu_dcm[0] * rtu_dcm[4] * rtu_dcm[8] - rtu_dcm[0] * rtu_dcm[5] *
                rtu_dcm[7]) - rtu_dcm[1] * rtu_dcm[3] * rtu_dcm[8]) + rtu_dcm[2]
              * rtu_dcm[3] * rtu_dcm[7]) + rtu_dcm[1] * rtu_dcm[5] * rtu_dcm[6])
            - rtu_dcm[2] * rtu_dcm[4] * rtu_dcm[6]) + -1.0) > rtp_tolerance) {
    /* Outputs for IfAction SubSystem: '<S213>/If Not Proper' incorporates:
     *  ActionPort: '<S215>/Action Port'
     */
    /* If: '<S215>/If' incorporates:
     *  Constant: '<S215>/Constant'
     */
    if (rtp_action == 2.0) {
      /* Outputs for IfAction SubSystem: '<S215>/Warning' incorporates:
       *  ActionPort: '<S221>/Action Port'
       */
      /* Assertion: '<S221>/Assertion' incorporates:
       *  Constant: '<S215>/Constant1'
       */
      utAssert(false);

      /* End of Outputs for SubSystem: '<S215>/Warning' */
    } else {
      if (rtp_action == 3.0) {
        /* Outputs for IfAction SubSystem: '<S215>/Error' incorporates:
         *  ActionPort: '<S220>/Action Port'
         */
        /* Assertion: '<S220>/Assertion' incorporates:
         *  Constant: '<S215>/Constant1'
         */
        utAssert(false);

        /* End of Outputs for SubSystem: '<S215>/Error' */
      }
    }

    /* End of If: '<S215>/If' */
    /* End of Outputs for SubSystem: '<S213>/If Not Proper' */
  } else {
    if (tmp) {
      /* Outputs for IfAction SubSystem: '<S213>/Else If Not Orthogonal' incorporates:
       *  ActionPort: '<S214>/Action Port'
       */
      /* If: '<S214>/If' incorporates:
       *  Constant: '<S214>/Constant'
       */
      if (rtp_action == 2.0) {
        /* Outputs for IfAction SubSystem: '<S214>/Warning' incorporates:
         *  ActionPort: '<S219>/Action Port'
         */
        /* Assertion: '<S219>/Assertion' incorporates:
         *  Constant: '<S214>/Constant1'
         */
        utAssert(false);

        /* End of Outputs for SubSystem: '<S214>/Warning' */
      } else {
        if (rtp_action == 3.0) {
          /* Outputs for IfAction SubSystem: '<S214>/Error' incorporates:
           *  ActionPort: '<S218>/Action Port'
           */
          /* Assertion: '<S218>/Assertion' incorporates:
           *  Constant: '<S214>/Constant1'
           */
          utAssert(false);

          /* End of Outputs for SubSystem: '<S214>/Error' */
        }
      }

      /* End of If: '<S214>/If' */
      /* End of Outputs for SubSystem: '<S213>/Else If Not Orthogonal' */
    }
  }

  /* End of If: '<S213>/If' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
