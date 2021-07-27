/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: MEKF_lib.c
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

#include "MEKF_lib.h"

/* Include model header file for global data */
#include "FSW_Lib.h"
#include "FSW_Lib_private.h"
#include "mrdivide_helper_23K2DU9e.h"
#include "qr_c0VdrKOo.h"
#include "rt_powd_snf.h"
#include "xgeqrf_oLvid02n.h"

/* System initialize for atomic system: '<S1>/MEKF_lib' */
void MEKF_lib_Init(real_T rty_sc_quat[4], DW_MEKF_lib *localDW)
{
  /* InitializeConditions for UnitDelay: '<S3>/Unit Delay' */
  memcpy(&localDW->UnitDelay_DSTATE[0], &rtCP_UnitDelay_InitialConditi_e[0], 36U
         * sizeof(real_T));

  /* InitializeConditions for UnitDelay: '<S3>/Unit Delay3' */
  localDW->UnitDelay3_DSTATE[0] = 1.0;
  localDW->UnitDelay3_DSTATE[1] = 0.0;
  localDW->UnitDelay3_DSTATE[2] = 0.0;
  localDW->UnitDelay3_DSTATE[3] = 0.0;

  /* SystemInitialize for Atomic SubSystem: '<S3>/TRIADActivation_lib' */
  TRIADActivation_lib_Init(&localDW->TRIADActivation_lib_a);

  /* End of SystemInitialize for SubSystem: '<S3>/TRIADActivation_lib' */

  /* SystemInitialize for IfAction SubSystem: '<S3>/TriadEstimator_lib' */
  /* InitializeConditions for UnitDelay: '<S124>/Unit Delay' */
  localDW->UnitDelay_DSTATE_c[0] = 1.0;

  /* SystemInitialize for IfAction SubSystem: '<S124>/TriadAlgorithm' */
  /* SystemInitialize for Merge: '<S186>/Merge' */
  localDW->Merge[0] = 1.0;

  /* End of SystemInitialize for SubSystem: '<S124>/TriadAlgorithm' */
  /* End of SystemInitialize for SubSystem: '<S3>/TriadEstimator_lib' */

  /* SystemInitialize for Merge: '<S3>/q_p_merge' */
  rty_sc_quat[0] = 0.0;

  /* SystemInitialize for IfAction SubSystem: '<S3>/TriadEstimator_lib' */
  /* InitializeConditions for UnitDelay: '<S124>/Unit Delay' */
  localDW->UnitDelay_DSTATE_c[1] = 0.0;

  /* SystemInitialize for IfAction SubSystem: '<S124>/TriadAlgorithm' */
  /* SystemInitialize for Merge: '<S186>/Merge' */
  localDW->Merge[1] = 0.0;

  /* End of SystemInitialize for SubSystem: '<S124>/TriadAlgorithm' */
  /* End of SystemInitialize for SubSystem: '<S3>/TriadEstimator_lib' */

  /* SystemInitialize for Merge: '<S3>/q_p_merge' */
  rty_sc_quat[1] = 0.0;

  /* SystemInitialize for IfAction SubSystem: '<S3>/TriadEstimator_lib' */
  /* InitializeConditions for UnitDelay: '<S124>/Unit Delay' */
  localDW->UnitDelay_DSTATE_c[2] = 0.0;

  /* SystemInitialize for IfAction SubSystem: '<S124>/TriadAlgorithm' */
  /* SystemInitialize for Merge: '<S186>/Merge' */
  localDW->Merge[2] = 0.0;

  /* End of SystemInitialize for SubSystem: '<S124>/TriadAlgorithm' */
  /* End of SystemInitialize for SubSystem: '<S3>/TriadEstimator_lib' */

  /* SystemInitialize for Merge: '<S3>/q_p_merge' */
  rty_sc_quat[2] = 0.0;

  /* SystemInitialize for IfAction SubSystem: '<S3>/TriadEstimator_lib' */
  /* InitializeConditions for UnitDelay: '<S124>/Unit Delay' */
  localDW->UnitDelay_DSTATE_c[3] = 0.0;

  /* SystemInitialize for IfAction SubSystem: '<S124>/TriadAlgorithm' */
  /* SystemInitialize for Merge: '<S186>/Merge' */
  localDW->Merge[3] = 0.0;

  /* End of SystemInitialize for SubSystem: '<S124>/TriadAlgorithm' */
  /* End of SystemInitialize for SubSystem: '<S3>/TriadEstimator_lib' */

  /* SystemInitialize for Merge: '<S3>/q_p_merge' */
  rty_sc_quat[3] = 0.0;
}

/* Start for atomic system: '<S1>/MEKF_lib' */
void MEKF_lib_Start(DW_MEKF_lib *localDW)
{
  /* Start for S-Function (sdspeye): '<S163>/Id_3' */
  memset(&localDW->Id_3[0], 0, 9U * sizeof(real_T));

  /* Fill in 1's on the diagonal. */
  localDW->Id_3[0] = 1.0;
  localDW->Id_3[4] = 1.0;
  localDW->Id_3[8] = 1.0;
}

/* Output and update for atomic system: '<S1>/MEKF_lib' */
void MEKF_lib(const real_T rtu_sc2sun_eci_unit[3], const real_T rtu_mag_eci_T[3],
              const real_T rtu_sun_meas_body_unit[3], const real_T
              rtu_mag_meas_body_T[3], const real_T rtu_gyro_meas_body_radps[3],
              uint8_T rtu_sunsensor_valid, boolean_T rtu_mag_meas_valid,
              boolean_T rtu_gryo_meas_valid, boolean_T rtu_triad_activate,
              real_T rty_sc_quat[4], real_T rty_body_rates_radps[3], real_T
              rty_threeSigma_rad[6], real_T rty_bias_radps[3], uint8_T
              *rty_mekf_telem, DW_MEKF_lib *localDW)
{
  int8_T Phi_22[9];
  int8_T b_I[9];
  static const int8_T a[9] = { -1, 0, 0, 0, -1, 0, 0, 0, -1 };

  static const int8_T b_a[9] = { 1, 0, 0, 0, 1, 0, 0, 0, 1 };

  real_T C[72];
  real_T unusedU2[144];
  real_T R[144];
  boolean_T rtb_Compare_l;
  boolean_T rtb_Switch_ex;
  int8_T rtAction;
  uint8_T rtb_Sum_hy;
  real_T rtb_sigma[6];
  real_T rtb_MatrixConcatenate2_n[16];
  real_T rtb_MathFunction_k[3];
  real_T rtb_Product3_bb;
  real_T rtb_MathFunction_n[3];
  boolean_T rtb_Switch_lx;
  boolean_T rtb_Switch_a;
  real_T rtb_Product1_f1;
  real_T rtb_TmpSignalConversionAtquat_m[4];
  real_T rtb_Merge_e[4];
  real_T rtb_Product3_bj;
  real_T rtb_Product1_oy;
  real_T rtb_VectorConcatenate[12];
  real_T rtb_MatrixConcatenate3[9];
  int32_T idxStart;
  int32_T i;
  real_T rtb_MathFunction1_n[9];
  real_T rtb_Sum_k1;
  real_T rtb_P_chol_p_merge[36];
  real_T rtb_Phi[36];
  real_T rtb_MatrixMultiply1[9];
  real_T tmp[144];
  real_T rtb_P_chol_p_merge_0[36];
  real_T rtb_Product3_e[6];
  real_T rtu_sun_meas_body_unit_0[6];
  real_T rtb_Elementproduct_m_idx_5;
  real_T rtb_Elementproduct_m_idx_2;
  real_T rtb_Elementproduct_m_idx_1;
  int32_T rtb_MatrixMultiply1_tmp;
  int32_T rtb_MatrixMultiply1_tmp_0;
  real_T rtb_Product3_e_tmp;
  real_T rtb_Product3_e_tmp_0;
  real_T rtb_Product3_e_tmp_1;
  real_T unusedExpr[12];

  /* RelationalOperator: '<S117>/Compare' incorporates:
   *  Constant: '<S117>/Constant'
   */
  rtb_Compare_l = (rtu_sunsensor_valid != 0);

  /* Outputs for Atomic SubSystem: '<S115>/parallel_protection_lib' */
  rtb_Switch_ex = parallel_protection_lib(rtu_sun_meas_body_unit,
    rtu_mag_meas_body_T, 1.0E-5);

  /* End of Outputs for SubSystem: '<S115>/parallel_protection_lib' */

  /* Sum: '<S115>/Sum' incorporates:
   *  Logic: '<S115>/AND'
   */
  rtb_Sum_hy = (uint8_T)((uint32_T)(rtb_Compare_l && rtu_mag_meas_valid &&
    rtu_gryo_meas_valid) + rtb_Switch_ex);

  /* Outputs for Atomic SubSystem: '<S3>/TRIADActivation_lib' */
  rtb_Switch_ex = TRIADActivation_lib(rtu_triad_activate, rtu_gryo_meas_valid,
    rtb_Compare_l, rtu_mag_meas_valid, &localDW->TRIADActivation_lib_a);

  /* End of Outputs for SubSystem: '<S3>/TRIADActivation_lib' */

  /* If: '<S3>/TRIAD_activation' incorporates:
   *  Inport: '<S126>/In1'
   *  UnitDelay: '<S3>/Unit Delay3'
   */
  if (rtb_Switch_ex) {
    rtAction = 0;

    /* Outputs for IfAction SubSystem: '<S3>/TriadEstimator_lib' incorporates:
     *  ActionPort: '<S124>/Action Port'
     */
    /* Sum: '<S173>/Sum of Elements' incorporates:
     *  Math: '<S173>/Math Function'
     */
    rtb_Product3_bb = (rtu_mag_meas_body_T[0] * rtu_mag_meas_body_T[0] +
                       rtu_mag_meas_body_T[1] * rtu_mag_meas_body_T[1]) +
      rtu_mag_meas_body_T[2] * rtu_mag_meas_body_T[2];

    /* Math: '<S173>/Math Function1'
     *
     * About '<S173>/Math Function1':
     *  Operator: sqrt
     */
    if (rtb_Product3_bb < 0.0) {
      rtb_Product3_bb = -sqrt(fabs(rtb_Product3_bb));
    } else {
      rtb_Product3_bb = sqrt(rtb_Product3_bb);
    }

    /* End of Math: '<S173>/Math Function1' */

    /* Switch: '<S173>/Switch' incorporates:
     *  Constant: '<S173>/Constant'
     *  Product: '<S173>/Product'
     */
    if (rtb_Product3_bb > 0.0) {
      rtb_Merge_e[0] = rtu_mag_meas_body_T[0];
      rtb_Merge_e[1] = rtu_mag_meas_body_T[1];
      rtb_Merge_e[2] = rtu_mag_meas_body_T[2];
      rtb_Merge_e[3] = rtb_Product3_bb;
    } else {
      rtb_Merge_e[0] = rtu_mag_meas_body_T[0] * 0.0;
      rtb_Merge_e[1] = rtu_mag_meas_body_T[1] * 0.0;
      rtb_Merge_e[2] = rtu_mag_meas_body_T[2] * 0.0;
      rtb_Merge_e[3] = 1.0;
    }

    /* End of Switch: '<S173>/Switch' */

    /* Product: '<S173>/Divide' */
    rtb_MathFunction_k[0] = rtb_Merge_e[0] / rtb_Merge_e[3];
    rtb_MathFunction_k[1] = rtb_Merge_e[1] / rtb_Merge_e[3];
    rtb_MathFunction_k[2] = rtb_Merge_e[2] / rtb_Merge_e[3];

    /* Sum: '<S172>/Sum of Elements' incorporates:
     *  Math: '<S172>/Math Function'
     */
    rtb_Product3_bb = (rtu_mag_eci_T[0] * rtu_mag_eci_T[0] + rtu_mag_eci_T[1] *
                       rtu_mag_eci_T[1]) + rtu_mag_eci_T[2] * rtu_mag_eci_T[2];

    /* Math: '<S172>/Math Function1'
     *
     * About '<S172>/Math Function1':
     *  Operator: sqrt
     */
    if (rtb_Product3_bb < 0.0) {
      rtb_Product3_bb = -sqrt(fabs(rtb_Product3_bb));
    } else {
      rtb_Product3_bb = sqrt(rtb_Product3_bb);
    }

    /* End of Math: '<S172>/Math Function1' */

    /* Switch: '<S172>/Switch' incorporates:
     *  Constant: '<S172>/Constant'
     *  Product: '<S172>/Product'
     */
    if (rtb_Product3_bb > 0.0) {
      rtb_Merge_e[0] = rtu_mag_eci_T[0];
      rtb_Merge_e[1] = rtu_mag_eci_T[1];
      rtb_Merge_e[2] = rtu_mag_eci_T[2];
      rtb_Merge_e[3] = rtb_Product3_bb;
    } else {
      rtb_Merge_e[0] = rtu_mag_eci_T[0] * 0.0;
      rtb_Merge_e[1] = rtu_mag_eci_T[1] * 0.0;
      rtb_Merge_e[2] = rtu_mag_eci_T[2] * 0.0;
      rtb_Merge_e[3] = 1.0;
    }

    /* End of Switch: '<S172>/Switch' */

    /* Product: '<S172>/Divide' */
    rtb_MathFunction_n[0] = rtb_Merge_e[0] / rtb_Merge_e[3];
    rtb_MathFunction_n[1] = rtb_Merge_e[1] / rtb_Merge_e[3];
    rtb_MathFunction_n[2] = rtb_Merge_e[2] / rtb_Merge_e[3];

    /* Outputs for Atomic SubSystem: '<S124>/parallel_protection_lib' */
    rtb_Switch_lx = parallel_protection_lib(rtu_sun_meas_body_unit,
      rtb_MathFunction_k, 1.0E-5);

    /* End of Outputs for SubSystem: '<S124>/parallel_protection_lib' */

    /* Outputs for Atomic SubSystem: '<S124>/parallel_protection_lib1' */
    rtb_Switch_a = parallel_protection_lib(rtu_sc2sun_eci_unit,
      rtb_MathFunction_n, 1.0E-5);

    /* End of Outputs for SubSystem: '<S124>/parallel_protection_lib1' */

    /* If: '<S124>/If' incorporates:
     *  Inport: '<S176>/quat_old'
     *  Logic: '<S124>/Logical Operator'
     *  UnitDelay: '<S124>/Unit Delay'
     */
    if (rtb_Compare_l && rtu_mag_meas_valid && rtb_Switch_lx && rtb_Switch_a) {
      /* Outputs for IfAction SubSystem: '<S124>/TriadAlgorithm' incorporates:
       *  ActionPort: '<S175>/Action Port'
       */
      /* Product: '<S182>/Element product' */
      rtb_Elementproduct_m_idx_1 = rtu_sun_meas_body_unit[2] *
        rtb_MathFunction_k[0];
      rtb_Elementproduct_m_idx_2 = rtu_sun_meas_body_unit[0] *
        rtb_MathFunction_k[1];
      rtb_Elementproduct_m_idx_5 = rtu_sun_meas_body_unit[1] *
        rtb_MathFunction_k[0];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate3In1' */
      rtb_MatrixConcatenate3[0] = rtu_sc2sun_eci_unit[0];

      /* Sum: '<S182>/Add3' incorporates:
       *  Product: '<S182>/Element product'
       */
      rtb_MathFunction_k[0] = rtu_sun_meas_body_unit[1] * rtb_MathFunction_k[2]
        - rtu_sun_meas_body_unit[2] * rtb_MathFunction_k[1];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate3In1' */
      rtb_MatrixConcatenate3[1] = rtu_sc2sun_eci_unit[1];

      /* Sum: '<S182>/Add3' incorporates:
       *  Product: '<S182>/Element product'
       */
      rtb_MathFunction_k[1] = rtb_Elementproduct_m_idx_1 -
        rtu_sun_meas_body_unit[0] * rtb_MathFunction_k[2];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate3In1' */
      rtb_MatrixConcatenate3[2] = rtu_sc2sun_eci_unit[2];

      /* Sum: '<S182>/Add3' */
      rtb_MathFunction_k[2] = rtb_Elementproduct_m_idx_2 -
        rtb_Elementproduct_m_idx_5;

      /* S-Function (sdsp2norm2): '<S175>/Normalization6' */
      rtb_Product3_bb = 1.0 / (sqrt((rtb_MathFunction_k[0] * rtb_MathFunction_k
        [0] + rtb_MathFunction_k[1] * rtb_MathFunction_k[1]) +
        rtb_MathFunction_k[2] * rtb_MathFunction_k[2]) + 1.0E-10);

      /* Product: '<S184>/Element product' */
      rtb_Elementproduct_m_idx_1 = rtu_sc2sun_eci_unit[2] * rtb_MathFunction_n[0];
      rtb_Elementproduct_m_idx_2 = rtu_sc2sun_eci_unit[0] * rtb_MathFunction_n[1];
      rtb_Elementproduct_m_idx_5 = rtu_sc2sun_eci_unit[1] * rtb_MathFunction_n[0];

      /* S-Function (sdsp2norm2): '<S175>/Normalization6' */
      rtb_MathFunction_k[0] *= rtb_Product3_bb;

      /* Sum: '<S184>/Add3' incorporates:
       *  Product: '<S184>/Element product'
       */
      rtb_MathFunction_n[0] = rtu_sc2sun_eci_unit[1] * rtb_MathFunction_n[2] -
        rtu_sc2sun_eci_unit[2] * rtb_MathFunction_n[1];

      /* S-Function (sdsp2norm2): '<S175>/Normalization6' */
      rtb_MathFunction_k[1] *= rtb_Product3_bb;

      /* Sum: '<S184>/Add3' incorporates:
       *  Product: '<S184>/Element product'
       */
      rtb_MathFunction_n[1] = rtb_Elementproduct_m_idx_1 - rtu_sc2sun_eci_unit[0]
        * rtb_MathFunction_n[2];

      /* S-Function (sdsp2norm2): '<S175>/Normalization6' */
      rtb_MathFunction_k[2] *= rtb_Product3_bb;

      /* Sum: '<S184>/Add3' */
      rtb_MathFunction_n[2] = rtb_Elementproduct_m_idx_2 -
        rtb_Elementproduct_m_idx_5;

      /* S-Function (sdsp2norm2): '<S175>/Normalization7' */
      rtb_Product3_bb = 1.0 / (sqrt((rtb_MathFunction_n[0] * rtb_MathFunction_n
        [0] + rtb_MathFunction_n[1] * rtb_MathFunction_n[1]) +
        rtb_MathFunction_n[2] * rtb_MathFunction_n[2]) + 1.0E-10);
      rtb_MathFunction_n[0] *= rtb_Product3_bb;
      rtb_MathFunction_n[1] *= rtb_Product3_bb;
      rtb_MathFunction_n[2] *= rtb_Product3_bb;

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate3In2' */
      rtb_MatrixConcatenate3[3] = rtb_MathFunction_n[0];

      /* Sum: '<S185>/Add3' incorporates:
       *  Product: '<S185>/Element product'
       */
      rtb_MatrixConcatenate3[6] = rtu_sc2sun_eci_unit[1] * rtb_MathFunction_n[2]
        - rtu_sc2sun_eci_unit[2] * rtb_MathFunction_n[1];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate3In2' */
      rtb_MatrixConcatenate3[4] = rtb_MathFunction_n[1];

      /* Sum: '<S185>/Add3' incorporates:
       *  Product: '<S185>/Element product'
       */
      rtb_MatrixConcatenate3[7] = rtu_sc2sun_eci_unit[2] * rtb_MathFunction_n[0]
        - rtu_sc2sun_eci_unit[0] * rtb_MathFunction_n[2];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate3In2' */
      rtb_MatrixConcatenate3[5] = rtb_MathFunction_n[2];

      /* Sum: '<S185>/Add3' incorporates:
       *  Product: '<S185>/Element product'
       */
      rtb_MatrixConcatenate3[8] = rtu_sc2sun_eci_unit[0] * rtb_MathFunction_n[1]
        - rtu_sc2sun_eci_unit[1] * rtb_MathFunction_n[0];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate2In1' */
      rtb_MathFunction1_n[0] = rtu_sun_meas_body_unit[0];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate2In2' */
      rtb_MathFunction1_n[3] = rtb_MathFunction_k[0];

      /* Sum: '<S183>/Add3' incorporates:
       *  Product: '<S183>/Element product'
       */
      rtb_MathFunction1_n[6] = rtu_sun_meas_body_unit[1] * rtb_MathFunction_k[2]
        - rtu_sun_meas_body_unit[2] * rtb_MathFunction_k[1];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate2In1' */
      rtb_MathFunction1_n[1] = rtu_sun_meas_body_unit[1];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate2In2' */
      rtb_MathFunction1_n[4] = rtb_MathFunction_k[1];

      /* Sum: '<S183>/Add3' incorporates:
       *  Product: '<S183>/Element product'
       */
      rtb_MathFunction1_n[7] = rtu_sun_meas_body_unit[2] * rtb_MathFunction_k[0]
        - rtu_sun_meas_body_unit[0] * rtb_MathFunction_k[2];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate2In1' */
      rtb_MathFunction1_n[2] = rtu_sun_meas_body_unit[2];

      /* SignalConversion: '<S175>/ConcatBufferAtMatrix Concatenate2In2' */
      rtb_MathFunction1_n[5] = rtb_MathFunction_k[2];

      /* Sum: '<S183>/Add3' incorporates:
       *  Product: '<S183>/Element product'
       */
      rtb_MathFunction1_n[8] = rtu_sun_meas_body_unit[0] * rtb_MathFunction_k[1]
        - rtu_sun_meas_body_unit[1] * rtb_MathFunction_k[0];

      /* Product: '<S175>/Matrix Multiply1' incorporates:
       *  Math: '<S175>/Math Function1'
       */
      for (i = 0; i < 3; i++) {
        for (idxStart = 0; idxStart < 3; idxStart++) {
          rtb_MatrixMultiply1_tmp = i + 3 * idxStart;
          rtb_MatrixMultiply1[rtb_MatrixMultiply1_tmp] = 0.0;
          rtb_MatrixMultiply1_tmp_0 = 3 * idxStart + i;
          rtb_MatrixMultiply1[rtb_MatrixMultiply1_tmp] =
            rtb_MatrixMultiply1[rtb_MatrixMultiply1_tmp_0] +
            rtb_MathFunction1_n[i] * rtb_MatrixConcatenate3[idxStart];
          rtb_MatrixMultiply1[rtb_MatrixMultiply1_tmp] =
            rtb_MatrixMultiply1[rtb_MatrixMultiply1_tmp_0] +
            rtb_MathFunction1_n[i + 3] * rtb_MatrixConcatenate3[idxStart + 3];
          rtb_MatrixMultiply1[rtb_MatrixMultiply1_tmp] =
            rtb_MatrixMultiply1[rtb_MatrixMultiply1_tmp_0] +
            rtb_MathFunction1_n[i + 6] * rtb_MatrixConcatenate3[idxStart + 6];
        }
      }

      /* End of Product: '<S175>/Matrix Multiply1' */

      /* Sum: '<S190>/Add' */
      rtb_Elementproduct_m_idx_1 = (rtb_MatrixMultiply1[0] +
        rtb_MatrixMultiply1[4]) + rtb_MatrixMultiply1[8];

      /* If: '<S186>/If' */
      if (rtb_Elementproduct_m_idx_1 > 0.0) {
        /* Outputs for IfAction SubSystem: '<S186>/Positive Trace' incorporates:
         *  ActionPort: '<S188>/Action Port'
         */
        PositiveTrace(rtb_Elementproduct_m_idx_1, rtb_MatrixMultiply1,
                      &localDW->Merge[0], &localDW->Merge[1]);

        /* End of Outputs for SubSystem: '<S186>/Positive Trace' */
      } else {
        /* Outputs for IfAction SubSystem: '<S186>/Negative Trace' incorporates:
         *  ActionPort: '<S187>/Action Port'
         */
        NegativeTrace(rtb_MatrixMultiply1, localDW->Merge);

        /* End of Outputs for SubSystem: '<S186>/Negative Trace' */
      }

      /* End of If: '<S186>/If' */

      /* Signum: '<S175>/Sign' */
      if (localDW->Merge[0] < 0.0) {
        rtb_Product3_bb = -1.0;
      } else if (localDW->Merge[0] > 0.0) {
        rtb_Product3_bb = 1.0;
      } else if (localDW->Merge[0] == 0.0) {
        rtb_Product3_bb = 0.0;
      } else {
        rtb_Product3_bb = (rtNaN);
      }

      /* End of Signum: '<S175>/Sign' */

      /* Product: '<S175>/Multiply' */
      rtb_Merge_e[0] = rtb_Product3_bb * localDW->Merge[0];
      rtb_Merge_e[1] = rtb_Product3_bb * localDW->Merge[1];
      rtb_Merge_e[2] = rtb_Product3_bb * localDW->Merge[2];
      rtb_Merge_e[3] = rtb_Product3_bb * localDW->Merge[3];

      /* End of Outputs for SubSystem: '<S124>/TriadAlgorithm' */
    } else {
      /* Outputs for IfAction SubSystem: '<S124>/TriadBypass' incorporates:
       *  ActionPort: '<S176>/Action Port'
       */
      rtb_Merge_e[0] = localDW->UnitDelay_DSTATE_c[0];
      rtb_Merge_e[1] = localDW->UnitDelay_DSTATE_c[1];
      rtb_Merge_e[2] = localDW->UnitDelay_DSTATE_c[2];
      rtb_Merge_e[3] = localDW->UnitDelay_DSTATE_c[3];

      /* End of Outputs for SubSystem: '<S124>/TriadBypass' */
    }

    /* End of If: '<S124>/If' */

    /* Sqrt: '<S180>/sqrt' incorporates:
     *  Product: '<S181>/Product'
     *  Product: '<S181>/Product1'
     *  Product: '<S181>/Product2'
     *  Product: '<S181>/Product3'
     *  Sum: '<S181>/Sum'
     */
    rtb_Elementproduct_m_idx_1 = sqrt(((rtb_Merge_e[0] * rtb_Merge_e[0] +
      rtb_Merge_e[1] * rtb_Merge_e[1]) + rtb_Merge_e[2] * rtb_Merge_e[2]) +
      rtb_Merge_e[3] * rtb_Merge_e[3]);

    /* SignalConversion: '<S124>/TmpSignal ConversionAtquat_rectify_libInport1' incorporates:
     *  Product: '<S174>/Product'
     *  Product: '<S174>/Product1'
     *  Product: '<S174>/Product2'
     *  Product: '<S174>/Product3'
     *  Sqrt: '<S180>/sqrt'
     */
    rtb_TmpSignalConversionAtquat_m[0] = rtb_Merge_e[0] /
      rtb_Elementproduct_m_idx_1;
    rtb_TmpSignalConversionAtquat_m[1] = rtb_Merge_e[1] /
      rtb_Elementproduct_m_idx_1;
    rtb_TmpSignalConversionAtquat_m[2] = rtb_Merge_e[2] /
      rtb_Elementproduct_m_idx_1;
    rtb_TmpSignalConversionAtquat_m[3] = rtb_Merge_e[3] /
      rtb_Elementproduct_m_idx_1;

    /* Outputs for Atomic SubSystem: '<S124>/quat_rectify_lib' */
    quat_rectify_lib(rtb_TmpSignalConversionAtquat_m, rtb_Merge_e);

    /* End of Outputs for SubSystem: '<S124>/quat_rectify_lib' */
    /* End of Outputs for SubSystem: '<S3>/TriadEstimator_lib' */
  } else {
    rtAction = 1;

    /* Outputs for IfAction SubSystem: '<S116>/If Action Subsystem' incorporates:
     *  ActionPort: '<S126>/Action Port'
     */
    rtb_Merge_e[0] = localDW->UnitDelay3_DSTATE[0];
    rtb_Merge_e[1] = localDW->UnitDelay3_DSTATE[1];
    rtb_Merge_e[2] = localDW->UnitDelay3_DSTATE[2];
    rtb_Merge_e[3] = localDW->UnitDelay3_DSTATE[3];

    /* End of Outputs for SubSystem: '<S116>/If Action Subsystem' */
  }

  /* If: '<S3>/If' incorporates:
   *  Inport: '<S114>/P_chol_m'
   *  Inport: '<S114>/bias_m'
   *  Inport: '<S114>/q_m'
   *  UnitDelay: '<S3>/Unit Delay'
   *  UnitDelay: '<S3>/Unit Delay1'
   */
  if (rtb_Sum_hy > 1) {
    /* Outputs for IfAction SubSystem: '<S3>/MeasurementUpdate' incorporates:
     *  ActionPort: '<S119>/Action Port'
     */
    /* SignalConversion: '<S131>/ConcatBufferAtVertical Matrix ConcatenateIn2' */
    memset(&rtb_P_chol_p_merge[18], 0, 18U * sizeof(real_T));

    /* Sqrt: '<S147>/sqrt' incorporates:
     *  Product: '<S148>/Product'
     *  Product: '<S148>/Product1'
     *  Product: '<S148>/Product2'
     *  Product: '<S148>/Product3'
     *  Sum: '<S148>/Sum'
     */
    rtb_Elementproduct_m_idx_5 = sqrt(((rtb_Merge_e[0] * rtb_Merge_e[0] +
      rtb_Merge_e[1] * rtb_Merge_e[1]) + rtb_Merge_e[2] * rtb_Merge_e[2]) +
      rtb_Merge_e[3] * rtb_Merge_e[3]);

    /* Product: '<S143>/Product2' incorporates:
     *  Sqrt: '<S147>/sqrt'
     */
    rtb_Product3_bj = rtb_Merge_e[2] / rtb_Elementproduct_m_idx_5;

    /* Product: '<S143>/Product3' incorporates:
     *  Sqrt: '<S147>/sqrt'
     */
    rtb_Product1_f1 = rtb_Merge_e[3] / rtb_Elementproduct_m_idx_5;

    /* Product: '<S143>/Product1' incorporates:
     *  Sqrt: '<S147>/sqrt'
     */
    rtb_Elementproduct_m_idx_2 = rtb_Merge_e[1] / rtb_Elementproduct_m_idx_5;

    /* Product: '<S143>/Product' incorporates:
     *  Sqrt: '<S147>/sqrt'
     */
    rtb_Elementproduct_m_idx_5 = rtb_Merge_e[0] / rtb_Elementproduct_m_idx_5;

    /* Product: '<S144>/Product7' incorporates:
     *  Product: '<S145>/Product7'
     */
    rtb_Elementproduct_m_idx_1 = rtb_Product1_f1 * rtb_Product1_f1;

    /* Product: '<S144>/Product' incorporates:
     *  Product: '<S145>/Product'
     */
    rtb_Product3_e_tmp = rtb_Elementproduct_m_idx_2 * rtb_Product3_bj;

    /* Product: '<S144>/Product1' incorporates:
     *  Product: '<S145>/Product1'
     */
    rtb_Product3_e_tmp_0 = rtb_Elementproduct_m_idx_5 * rtb_Product1_f1;

    /* Product: '<S144>/Product3' incorporates:
     *  Product: '<S146>/Product'
     */
    rtb_Product3_e_tmp_1 = rtb_Elementproduct_m_idx_2 * rtb_Product1_f1;

    /* Product: '<S144>/Product2' incorporates:
     *  Product: '<S146>/Product1'
     */
    rtb_Sum_k1 = rtb_Elementproduct_m_idx_5 * rtb_Product3_bj;

    /* Product: '<S144>/Product6' incorporates:
     *  Product: '<S146>/Product7'
     */
    rtb_Product1_oy = rtb_Product3_bj * rtb_Product3_bj;

    /* Sum: '<S144>/Sum' incorporates:
     *  Constant: '<S144>/Constant'
     *  Gain: '<S144>/Gain'
     *  Gain: '<S144>/Gain1'
     *  Gain: '<S144>/Gain2'
     *  Product: '<S144>/Product'
     *  Product: '<S144>/Product1'
     *  Product: '<S144>/Product2'
     *  Product: '<S144>/Product3'
     *  Product: '<S144>/Product4'
     *  Product: '<S144>/Product5'
     *  Product: '<S144>/Product6'
     *  Product: '<S144>/Product7'
     *  Product: '<S144>/Product8'
     *  Sum: '<S144>/Sum1'
     *  Sum: '<S144>/Sum2'
     *  Sum: '<S144>/Sum3'
     */
    rtb_Product3_bb = (((0.5 - rtb_Product1_oy) - rtb_Elementproduct_m_idx_1) *
                       2.0 * rtu_sc2sun_eci_unit[0] + (rtb_Product3_e_tmp +
      rtb_Product3_e_tmp_0) * 2.0 * rtu_sc2sun_eci_unit[1]) +
      (rtb_Product3_e_tmp_1 - rtb_Sum_k1) * 2.0 * rtu_sc2sun_eci_unit[2];

    /* Product: '<S145>/Product3' incorporates:
     *  Product: '<S146>/Product3'
     */
    rtb_Product3_bj *= rtb_Product1_f1;

    /* Product: '<S145>/Product2' incorporates:
     *  Product: '<S146>/Product2'
     */
    rtb_Elementproduct_m_idx_5 *= rtb_Elementproduct_m_idx_2;

    /* Sum: '<S145>/Sum3' incorporates:
     *  Constant: '<S145>/Constant'
     *  Product: '<S145>/Product6'
     *  Sum: '<S146>/Sum3'
     */
    rtb_Elementproduct_m_idx_2 = 0.5 - rtb_Elementproduct_m_idx_2 *
      rtb_Elementproduct_m_idx_2;

    /* Sum: '<S145>/Sum' incorporates:
     *  Gain: '<S145>/Gain'
     *  Gain: '<S145>/Gain1'
     *  Gain: '<S145>/Gain2'
     *  Product: '<S145>/Product2'
     *  Product: '<S145>/Product3'
     *  Product: '<S145>/Product4'
     *  Product: '<S145>/Product5'
     *  Product: '<S145>/Product8'
     *  Sum: '<S145>/Sum1'
     *  Sum: '<S145>/Sum2'
     *  Sum: '<S145>/Sum3'
     */
    rtb_Elementproduct_m_idx_1 = ((rtb_Elementproduct_m_idx_2 -
      rtb_Elementproduct_m_idx_1) * 2.0 * rtu_sc2sun_eci_unit[1] +
      (rtb_Product3_e_tmp - rtb_Product3_e_tmp_0) * 2.0 * rtu_sc2sun_eci_unit[0])
      + (rtb_Elementproduct_m_idx_5 + rtb_Product3_bj) * 2.0 *
      rtu_sc2sun_eci_unit[2];

    /* Sum: '<S146>/Sum' incorporates:
     *  Gain: '<S146>/Gain'
     *  Gain: '<S146>/Gain1'
     *  Gain: '<S146>/Gain2'
     *  Product: '<S146>/Product4'
     *  Product: '<S146>/Product5'
     *  Product: '<S146>/Product8'
     *  Sum: '<S146>/Sum1'
     *  Sum: '<S146>/Sum2'
     *  Sum: '<S146>/Sum3'
     */
    rtb_Elementproduct_m_idx_5 = ((rtb_Product3_e_tmp_1 + rtb_Sum_k1) * 2.0 *
      rtu_sc2sun_eci_unit[0] + (rtb_Product3_bj - rtb_Elementproduct_m_idx_5) *
      2.0 * rtu_sc2sun_eci_unit[1]) + (rtb_Elementproduct_m_idx_2 -
      rtb_Product1_oy) * 2.0 * rtu_sc2sun_eci_unit[2];

    /* Outputs for Atomic SubSystem: '<S131>/CrossProdMatrix_lib' */
    CrossProdMatrix_lib(rtb_Elementproduct_m_idx_5, rtb_Product3_bb,
                        rtb_Elementproduct_m_idx_1, rtb_MatrixConcatenate3);

    /* End of Outputs for SubSystem: '<S131>/CrossProdMatrix_lib' */

    /* Sqrt: '<S153>/sqrt' incorporates:
     *  Product: '<S154>/Product'
     *  Product: '<S154>/Product1'
     *  Product: '<S154>/Product2'
     *  Product: '<S154>/Product3'
     *  Sum: '<S154>/Sum'
     */
    rtb_Product3_e_tmp_1 = sqrt(((rtb_Merge_e[0] * rtb_Merge_e[0] + rtb_Merge_e
      [1] * rtb_Merge_e[1]) + rtb_Merge_e[2] * rtb_Merge_e[2]) + rtb_Merge_e[3] *
      rtb_Merge_e[3]);

    /* Product: '<S149>/Product2' incorporates:
     *  Sqrt: '<S153>/sqrt'
     */
    rtb_Product1_oy = rtb_Merge_e[2] / rtb_Product3_e_tmp_1;

    /* Product: '<S149>/Product3' incorporates:
     *  Sqrt: '<S153>/sqrt'
     */
    rtb_Elementproduct_m_idx_2 = rtb_Merge_e[3] / rtb_Product3_e_tmp_1;

    /* Product: '<S149>/Product1' incorporates:
     *  Sqrt: '<S153>/sqrt'
     */
    rtb_Product1_f1 = rtb_Merge_e[1] / rtb_Product3_e_tmp_1;

    /* Product: '<S149>/Product' incorporates:
     *  Sqrt: '<S153>/sqrt'
     */
    rtb_Product3_e_tmp_1 = rtb_Merge_e[0] / rtb_Product3_e_tmp_1;

    /* Sum: '<S150>/Sum' incorporates:
     *  Constant: '<S150>/Constant'
     *  Gain: '<S150>/Gain'
     *  Gain: '<S150>/Gain1'
     *  Gain: '<S150>/Gain2'
     *  Product: '<S150>/Product'
     *  Product: '<S150>/Product1'
     *  Product: '<S150>/Product2'
     *  Product: '<S150>/Product3'
     *  Product: '<S150>/Product4'
     *  Product: '<S150>/Product5'
     *  Product: '<S150>/Product6'
     *  Product: '<S150>/Product7'
     *  Product: '<S150>/Product8'
     *  Sum: '<S150>/Sum1'
     *  Sum: '<S150>/Sum2'
     *  Sum: '<S150>/Sum3'
     */
    rtb_Product3_bj = (((0.5 - rtb_Product1_oy * rtb_Product1_oy) -
                        rtb_Elementproduct_m_idx_2 * rtb_Elementproduct_m_idx_2)
                       * 2.0 * rtu_mag_eci_T[0] + (rtb_Product1_f1 *
      rtb_Product1_oy + rtb_Product3_e_tmp_1 * rtb_Elementproduct_m_idx_2) * 2.0
                       * rtu_mag_eci_T[1]) + (rtb_Product1_f1 *
      rtb_Elementproduct_m_idx_2 - rtb_Product3_e_tmp_1 * rtb_Product1_oy) * 2.0
      * rtu_mag_eci_T[2];

    /* Sum: '<S151>/Sum' incorporates:
     *  Constant: '<S151>/Constant'
     *  Gain: '<S151>/Gain'
     *  Gain: '<S151>/Gain1'
     *  Gain: '<S151>/Gain2'
     *  Product: '<S151>/Product'
     *  Product: '<S151>/Product1'
     *  Product: '<S151>/Product2'
     *  Product: '<S151>/Product3'
     *  Product: '<S151>/Product4'
     *  Product: '<S151>/Product5'
     *  Product: '<S151>/Product6'
     *  Product: '<S151>/Product7'
     *  Product: '<S151>/Product8'
     *  Sum: '<S151>/Sum1'
     *  Sum: '<S151>/Sum2'
     *  Sum: '<S151>/Sum3'
     */
    rtb_Sum_k1 = (((0.5 - rtb_Product1_f1 * rtb_Product1_f1) -
                   rtb_Elementproduct_m_idx_2 * rtb_Elementproduct_m_idx_2) *
                  2.0 * rtu_mag_eci_T[1] + (rtb_Product1_f1 * rtb_Product1_oy -
      rtb_Product3_e_tmp_1 * rtb_Elementproduct_m_idx_2) * 2.0 * rtu_mag_eci_T[0])
      + (rtb_Product3_e_tmp_1 * rtb_Product1_f1 + rtb_Product1_oy *
         rtb_Elementproduct_m_idx_2) * 2.0 * rtu_mag_eci_T[2];

    /* Sum: '<S152>/Sum' incorporates:
     *  Constant: '<S152>/Constant'
     *  Gain: '<S152>/Gain'
     *  Gain: '<S152>/Gain1'
     *  Gain: '<S152>/Gain2'
     *  Product: '<S152>/Product'
     *  Product: '<S152>/Product1'
     *  Product: '<S152>/Product2'
     *  Product: '<S152>/Product3'
     *  Product: '<S152>/Product4'
     *  Product: '<S152>/Product5'
     *  Product: '<S152>/Product6'
     *  Product: '<S152>/Product7'
     *  Product: '<S152>/Product8'
     *  Sum: '<S152>/Sum1'
     *  Sum: '<S152>/Sum2'
     *  Sum: '<S152>/Sum3'
     */
    rtb_Product1_f1 = ((rtb_Product1_f1 * rtb_Elementproduct_m_idx_2 +
                        rtb_Product3_e_tmp_1 * rtb_Product1_oy) * 2.0 *
                       rtu_mag_eci_T[0] + (rtb_Product1_oy *
      rtb_Elementproduct_m_idx_2 - rtb_Product3_e_tmp_1 * rtb_Product1_f1) * 2.0
                       * rtu_mag_eci_T[1]) + ((0.5 - rtb_Product1_f1 *
      rtb_Product1_f1) - rtb_Product1_oy * rtb_Product1_oy) * 2.0 *
      rtu_mag_eci_T[2];

    /* Outputs for Atomic SubSystem: '<S131>/CrossProdMatrix_lib1' */
    CrossProdMatrix_lib(rtb_Product1_f1, rtb_Product3_bj, rtb_Sum_k1,
                        rtb_MathFunction1_n);

    /* End of Outputs for SubSystem: '<S131>/CrossProdMatrix_lib1' */

    /* Concatenate: '<S131>/Horizontal Matrix Concatenate' */
    for (i = 0; i < 3; i++) {
      rtb_P_chol_p_merge[6 * i] = rtb_MatrixConcatenate3[3 * i];
      rtb_P_chol_p_merge[3 + 6 * i] = rtb_MathFunction1_n[3 * i];
      rtb_MatrixMultiply1_tmp_0 = 3 * i + 1;
      rtb_P_chol_p_merge[1 + 6 * i] =
        rtb_MatrixConcatenate3[rtb_MatrixMultiply1_tmp_0];
      rtb_P_chol_p_merge[4 + 6 * i] =
        rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp_0];
      rtb_MatrixMultiply1_tmp_0 = 3 * i + 2;
      rtb_P_chol_p_merge[2 + 6 * i] =
        rtb_MatrixConcatenate3[rtb_MatrixMultiply1_tmp_0];
      rtb_P_chol_p_merge[5 + 6 * i] =
        rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp_0];
    }

    /* End of Concatenate: '<S131>/Horizontal Matrix Concatenate' */

    /* MATLAB Function: '<S119>/QR_factorization' incorporates:
     *  Constant: '<S119>/Constant'
     *  UnitDelay: '<S3>/Unit Delay'
     */
    for (i = 0; i < 6; i++) {
      for (idxStart = 0; idxStart < 6; idxStart++) {
        rtb_MatrixMultiply1_tmp = i + 6 * idxStart;
        rtb_Phi[rtb_MatrixMultiply1_tmp] = 0.0;
        for (rtb_MatrixMultiply1_tmp_0 = 0; rtb_MatrixMultiply1_tmp_0 < 6;
             rtb_MatrixMultiply1_tmp_0++) {
          rtb_Phi[rtb_MatrixMultiply1_tmp] = localDW->UnitDelay_DSTATE[6 * i +
            rtb_MatrixMultiply1_tmp_0] * rtb_P_chol_p_merge[6 *
            rtb_MatrixMultiply1_tmp_0 + idxStart] + rtb_Phi[6 * idxStart + i];
        }

        tmp[idxStart + 12 * i] = rtCP_Constant_Value_gu[6 * idxStart + i];
        tmp[idxStart + 12 * (i + 6)] = 0.0;
      }
    }

    for (i = 0; i < 6; i++) {
      for (idxStart = 0; idxStart < 6; idxStart++) {
        tmp[(idxStart + 12 * i) + 6] = rtb_Phi[6 * i + idxStart];
        tmp[(idxStart + 12 * (i + 6)) + 6] = localDW->UnitDelay_DSTATE[6 *
          idxStart + i];
      }
    }

    qr_c0VdrKOo(tmp, unusedU2, R);
    for (i = 0; i < 6; i++) {
      for (idxStart = 0; idxStart < 6; idxStart++) {
        rtb_MatrixMultiply1_tmp = idxStart + 6 * i;
        rtb_Phi[rtb_MatrixMultiply1_tmp] = R[(6 + idxStart) * 12 + i];
        rtb_P_chol_p_merge[rtb_MatrixMultiply1_tmp] = R[12 * idxStart + i];
      }
    }

    mrdivide_helper_23K2DU9e(rtb_Phi, rtb_P_chol_p_merge);
    if (!rtu_gryo_meas_valid) {
      for (i = 0; i < 6; i++) {
        rtb_Phi[3 + 6 * i] = 0.0;
        rtb_Phi[4 + 6 * i] = 0.0;
        rtb_Phi[5 + 6 * i] = 0.0;
      }
    }

    /* Gain: '<S136>/Gain' */
    rtb_VectorConcatenate[0] = -rtb_Merge_e[1];

    /* SignalConversion: '<S136>/ConcatBufferAtVector ConcatenateIn2' */
    rtb_VectorConcatenate[1] = rtb_Merge_e[0];

    /* SignalConversion: '<S136>/ConcatBufferAtVector ConcatenateIn3' */
    rtb_VectorConcatenate[2] = rtb_Merge_e[3];

    /* Gain: '<S136>/Gain1' */
    rtb_VectorConcatenate[3] = -rtb_Merge_e[2];

    /* Gain: '<S136>/Gain2' */
    rtb_VectorConcatenate[4] = -rtb_Merge_e[2];

    /* Gain: '<S136>/Gain3' */
    rtb_VectorConcatenate[5] = -rtb_Merge_e[3];

    /* SignalConversion: '<S136>/ConcatBufferAtVector ConcatenateIn7' */
    rtb_VectorConcatenate[6] = rtb_Merge_e[0];

    /* SignalConversion: '<S136>/ConcatBufferAtVector ConcatenateIn8' */
    rtb_VectorConcatenate[7] = rtb_Merge_e[1];

    /* Gain: '<S136>/Gain4' */
    rtb_VectorConcatenate[8] = -rtb_Merge_e[3];

    /* SignalConversion: '<S136>/ConcatBufferAtVector ConcatenateIn10' */
    rtb_VectorConcatenate[9] = rtb_Merge_e[2];

    /* Gain: '<S136>/Gain5' */
    rtb_VectorConcatenate[10] = -rtb_Merge_e[1];

    /* SignalConversion: '<S136>/ConcatBufferAtVector ConcatenateIn12' */
    rtb_VectorConcatenate[11] = rtb_Merge_e[0];

    /* Sum: '<S119>/CreateMeasResidual' */
    rtb_sigma[0] = rtu_sun_meas_body_unit[0];
    rtb_sigma[3] = rtu_mag_meas_body_T[0];
    rtb_sigma[1] = rtu_sun_meas_body_unit[1];
    rtb_sigma[4] = rtu_mag_meas_body_T[1];
    rtb_sigma[2] = rtu_sun_meas_body_unit[2];
    rtb_sigma[5] = rtu_mag_meas_body_T[2];
    rtb_Product3_e[0] = rtb_Product3_bb;
    rtb_Product3_e[1] = rtb_Elementproduct_m_idx_1;
    rtb_Product3_e[2] = rtb_Elementproduct_m_idx_5;
    rtb_Product3_e[3] = rtb_Product3_bj;
    rtb_Product3_e[4] = rtb_Sum_k1;
    rtb_Product3_e[5] = rtb_Product1_f1;
    for (i = 0; i < 6; i++) {
      /* SignalConversion: '<S119>/OutportBufferForP_chol_plus' incorporates:
       *  MATLAB Function: '<S119>/QR_factorization'
       */
      for (idxStart = 0; idxStart < 6; idxStart++) {
        rtb_P_chol_p_merge[idxStart + 6 * i] = R[((6 + idxStart) * 12 + i) + 6];
      }

      /* Sum: '<S119>/CreateMeasResidual' */
      rtu_sun_meas_body_unit_0[i] = rtb_sigma[i] - rtb_Product3_e[i];
    }

    /* Product: '<S119>/Product1' incorporates:
     *  MATLAB Function: '<S119>/QR_factorization'
     */
    for (i = 0; i < 6; i++) {
      rtb_MathFunction1_n[i] = 0.0;
      for (idxStart = 0; idxStart < 6; idxStart++) {
        rtb_MathFunction1_n[i] += rtb_Phi[6 * idxStart + i] *
          rtu_sun_meas_body_unit_0[idxStart];
      }
    }

    /* End of Product: '<S119>/Product1' */

    /* Sum: '<S119>/UpdatingBetaBias ' incorporates:
     *  UnitDelay: '<S3>/Unit Delay1'
     */
    rty_bias_radps[0] = rtb_MathFunction1_n[3] + localDW->UnitDelay1_DSTATE[0];
    rty_bias_radps[1] = rtb_MathFunction1_n[4] + localDW->UnitDelay1_DSTATE[1];
    rty_bias_radps[2] = rtb_MathFunction1_n[5] + localDW->UnitDelay1_DSTATE[2];

    /* Sum: '<S119>/Sum' incorporates:
     *  Gain: '<S136>/Gain6'
     *  Product: '<S119>/Product'
     */
    for (i = 0; i < 4; i++) {
      rtb_TmpSignalConversionAtquat_m[i] = ((rtb_VectorConcatenate[i + 4] * 0.5 *
        rtb_MathFunction1_n[1] + 0.5 * rtb_VectorConcatenate[i] *
        rtb_MathFunction1_n[0]) + rtb_VectorConcatenate[i + 8] * 0.5 *
        rtb_MathFunction1_n[2]) + rtb_Merge_e[i];
    }

    /* End of Sum: '<S119>/Sum' */

    /* Sqrt: '<S141>/sqrt' incorporates:
     *  Product: '<S142>/Product'
     *  Product: '<S142>/Product1'
     *  Product: '<S142>/Product2'
     *  Product: '<S142>/Product3'
     *  Sum: '<S142>/Sum'
     */
    rtb_Product3_e_tmp_1 = sqrt(((rtb_TmpSignalConversionAtquat_m[0] *
      rtb_TmpSignalConversionAtquat_m[0] + rtb_TmpSignalConversionAtquat_m[1] *
      rtb_TmpSignalConversionAtquat_m[1]) + rtb_TmpSignalConversionAtquat_m[2] *
      rtb_TmpSignalConversionAtquat_m[2]) + rtb_TmpSignalConversionAtquat_m[3] *
      rtb_TmpSignalConversionAtquat_m[3]);

    /* Product: '<S133>/Product' */
    rty_sc_quat[0] = rtb_TmpSignalConversionAtquat_m[0] / rtb_Product3_e_tmp_1;

    /* Product: '<S133>/Product1' */
    rty_sc_quat[1] = rtb_TmpSignalConversionAtquat_m[1] / rtb_Product3_e_tmp_1;

    /* Product: '<S133>/Product2' */
    rty_sc_quat[2] = rtb_TmpSignalConversionAtquat_m[2] / rtb_Product3_e_tmp_1;

    /* Product: '<S133>/Product3' */
    rty_sc_quat[3] = rtb_TmpSignalConversionAtquat_m[3] / rtb_Product3_e_tmp_1;

    /* End of Outputs for SubSystem: '<S3>/MeasurementUpdate' */
  } else {
    /* Outputs for IfAction SubSystem: '<S3>/BypassMeasUpdate' incorporates:
     *  ActionPort: '<S114>/Action Port'
     */
    memcpy(&rtb_P_chol_p_merge[0], &localDW->UnitDelay_DSTATE[0], 36U * sizeof
           (real_T));
    rty_bias_radps[0] = localDW->UnitDelay1_DSTATE[0];
    rty_bias_radps[1] = localDW->UnitDelay1_DSTATE[1];
    rty_bias_radps[2] = localDW->UnitDelay1_DSTATE[2];
    rty_sc_quat[0] = rtb_Merge_e[0];
    rty_sc_quat[1] = rtb_Merge_e[1];
    rty_sc_quat[2] = rtb_Merge_e[2];
    rty_sc_quat[3] = rtb_Merge_e[3];

    /* End of Outputs for SubSystem: '<S3>/BypassMeasUpdate' */
  }

  /* End of If: '<S3>/If' */

  /* RelationalOperator: '<S155>/FixPt Relational Operator' incorporates:
   *  UnitDelay: '<S155>/Delay Input1'
   *
   * Block description for '<S155>/Delay Input1':
   *
   *  Store in Global RAM
   */
  rtb_Switch_lx = ((int32_T)rtb_Compare_l > (int32_T)localDW->DelayInput1_DSTATE);

  /* Switch: '<S3>/NullRatesIfGyroInvalid ' */
  if (rtu_gryo_meas_valid) {
    rtb_Product3_bb = rtu_gyro_meas_body_radps[0];
  } else {
    rtb_Product3_bb = 0.0;
  }

  /* Sum: '<S123>/Sum' */
  rty_body_rates_radps[0] = rtb_Product3_bb - rty_bias_radps[0];

  /* Product: '<S123>/Matrix Multiply' incorporates:
   *  Math: '<S123>/Transpose'
   */
  rtb_Elementproduct_m_idx_1 = rty_body_rates_radps[0] * rty_body_rates_radps[0];

  /* Switch: '<S3>/NullRatesIfGyroInvalid ' */
  if (rtu_gryo_meas_valid) {
    rtb_Product3_bb = rtu_gyro_meas_body_radps[1];
  } else {
    rtb_Product3_bb = 0.0;
  }

  /* Sum: '<S123>/Sum' */
  rty_body_rates_radps[1] = rtb_Product3_bb - rty_bias_radps[1];

  /* Product: '<S123>/Matrix Multiply' incorporates:
   *  Math: '<S123>/Transpose'
   */
  rtb_Elementproduct_m_idx_1 += rty_body_rates_radps[1] * rty_body_rates_radps[1];

  /* Switch: '<S3>/NullRatesIfGyroInvalid ' */
  if (rtu_gryo_meas_valid) {
    rtb_Product3_bb = rtu_gyro_meas_body_radps[2];
  } else {
    rtb_Product3_bb = 0.0;
  }

  /* Sum: '<S123>/Sum' */
  rty_body_rates_radps[2] = rtb_Product3_bb - rty_bias_radps[2];

  /* Product: '<S123>/Matrix Multiply' incorporates:
   *  Math: '<S123>/Transpose'
   */
  rtb_Elementproduct_m_idx_1 += rty_body_rates_radps[2] * rty_body_rates_radps[2];

  /* Sqrt: '<S123>/Sqrt' incorporates:
   *  Product: '<S123>/Matrix Multiply'
   */
  rtb_Product3_bb = sqrt(rtb_Elementproduct_m_idx_1);

  /* Outputs for Atomic SubSystem: '<S123>/CrossProdMatrix_lib1' */
  CrossProdMatrix_lib_d(rty_body_rates_radps, rtb_MatrixConcatenate3);

  /* End of Outputs for SubSystem: '<S123>/CrossProdMatrix_lib1' */

  /* MATLAB Function: '<S123>/CreateStateTransitionMatrix' incorporates:
   *  Constant: '<S123>/Constant'
   */
  if (rtb_Product3_bb < 1.0E-10) {
    for (i = 0; i < 9; i++) {
      b_I[i] = 0;
      Phi_22[i] = 0;
    }

    b_I[0] = 1;
    b_I[4] = 1;
    b_I[8] = 1;
    for (idxStart = 0; idxStart < 3; idxStart++) {
      Phi_22[idxStart + 3 * idxStart] = 1;
      rtb_Phi[6 * idxStart] = b_I[3 * idxStart];
      rtb_MatrixMultiply1_tmp = 6 * (idxStart + 3);
      rtb_Phi[rtb_MatrixMultiply1_tmp] = (real_T)a[3 * idxStart] * 0.25;
      rtb_Phi[3 + 6 * idxStart] = 0.0;
      i = 3 * idxStart + 1;
      rtb_Phi[1 + 6 * idxStart] = b_I[i];
      rtb_Phi[1 + rtb_MatrixMultiply1_tmp] = (real_T)a[i] * 0.25;
      rtb_Phi[4 + 6 * idxStart] = 0.0;
      i = 3 * idxStart + 2;
      rtb_Phi[2 + 6 * idxStart] = b_I[i];
      rtb_Phi[2 + rtb_MatrixMultiply1_tmp] = (real_T)a[i] * 0.25;
      rtb_Phi[5 + 6 * idxStart] = 0.0;
    }

    for (i = 0; i < 3; i++) {
      rtb_MatrixMultiply1_tmp = 6 * (i + 3);
      rtb_Phi[3 + rtb_MatrixMultiply1_tmp] = Phi_22[3 * i];
      rtb_Phi[4 + rtb_MatrixMultiply1_tmp] = Phi_22[3 * i + 1];
      rtb_Phi[5 + rtb_MatrixMultiply1_tmp] = Phi_22[3 * i + 2];
    }
  } else {
    for (i = 0; i < 9; i++) {
      b_I[i] = 0;
      Phi_22[i] = 0;
    }

    b_I[0] = 1;
    b_I[4] = 1;
    b_I[8] = 1;
    rtb_Product3_bj = sin(rtb_Product3_bb * 0.25);
    rtb_Elementproduct_m_idx_1 = rtb_Product3_bj / rtb_Product3_bb;
    rtb_Elementproduct_m_idx_2 = cos(rtb_Product3_bb * 0.25);
    rtb_Elementproduct_m_idx_5 = rtb_Product3_bb * rtb_Product3_bb;
    rtb_Sum_k1 = rtb_Product3_bb * 0.25 - rtb_Product3_bj;
    rtb_Product3_e_tmp_1 = rt_powd_snf(rtb_Product3_bb, 3.0);
    for (idxStart = 0; idxStart < 3; idxStart++) {
      Phi_22[idxStart + 3 * idxStart] = 1;
      for (i = 0; i < 3; i++) {
        rtb_MatrixMultiply1_tmp_0 = idxStart + 3 * i;
        rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp_0] = 0.0;
        rtb_MatrixMultiply1_tmp = 3 * i + idxStart;
        rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp_0] =
          rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp] + rtb_MatrixConcatenate3
          [3 * i] * rtb_MatrixConcatenate3[idxStart];
        rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp_0] = rtb_MatrixConcatenate3
          [3 * i + 1] * rtb_MatrixConcatenate3[idxStart + 3] +
          rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp];
        rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp_0] = rtb_MatrixConcatenate3
          [3 * i + 2] * rtb_MatrixConcatenate3[idxStart + 6] +
          rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp];
      }
    }

    for (i = 0; i < 3; i++) {
      rtb_Product3_bj = rtb_MathFunction1_n[3 * i];
      rtb_Product1_f1 = rtb_MatrixConcatenate3[3 * i];
      rtb_Phi[6 * i] = (1.0 - rtb_Elementproduct_m_idx_2) * rtb_Product3_bj /
        rtb_Elementproduct_m_idx_5 + ((real_T)b_I[3 * i] - rtb_Product1_f1 *
        rtb_Elementproduct_m_idx_1);
      rtb_MatrixMultiply1_tmp = 6 * (i + 3);
      rtb_Phi[rtb_MatrixMultiply1_tmp] = ((1.0 - rtb_Elementproduct_m_idx_2) *
        rtb_Product1_f1 / rtb_Elementproduct_m_idx_5 - (real_T)b_a[3 * i] * 0.25)
        - rtb_Product3_bj * rtb_Sum_k1 / rtb_Product3_e_tmp_1;
      rtb_Phi[3 + 6 * i] = 0.0;
      rtb_Phi[3 + rtb_MatrixMultiply1_tmp] = Phi_22[3 * i];
      rtb_MatrixMultiply1_tmp_0 = 3 * i + 1;
      rtb_Phi[1 + 6 * i] = ((real_T)b_I[rtb_MatrixMultiply1_tmp_0] -
                            rtb_MatrixConcatenate3[rtb_MatrixMultiply1_tmp_0] *
                            rtb_Elementproduct_m_idx_1) + (1.0 -
        rtb_Elementproduct_m_idx_2) *
        rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp_0] /
        rtb_Elementproduct_m_idx_5;
      rtb_Phi[1 + rtb_MatrixMultiply1_tmp] = ((1.0 - rtb_Elementproduct_m_idx_2)
        * rtb_MatrixConcatenate3[rtb_MatrixMultiply1_tmp_0] /
        rtb_Elementproduct_m_idx_5 - (real_T)b_a[rtb_MatrixMultiply1_tmp_0] *
        0.25) - rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp_0] * rtb_Sum_k1 /
        rtb_Product3_e_tmp_1;
      rtb_Phi[4 + 6 * i] = 0.0;
      rtb_Phi[4 + rtb_MatrixMultiply1_tmp] = Phi_22[rtb_MatrixMultiply1_tmp_0];
      rtb_MatrixMultiply1_tmp_0 = 3 * i + 2;
      rtb_Phi[2 + 6 * i] = ((real_T)b_I[rtb_MatrixMultiply1_tmp_0] -
                            rtb_MatrixConcatenate3[rtb_MatrixMultiply1_tmp_0] *
                            rtb_Elementproduct_m_idx_1) + (1.0 -
        rtb_Elementproduct_m_idx_2) *
        rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp_0] /
        rtb_Elementproduct_m_idx_5;
      rtb_Phi[2 + rtb_MatrixMultiply1_tmp] = ((1.0 - rtb_Elementproduct_m_idx_2)
        * rtb_MatrixConcatenate3[rtb_MatrixMultiply1_tmp_0] /
        rtb_Elementproduct_m_idx_5 - (real_T)b_a[rtb_MatrixMultiply1_tmp_0] *
        0.25) - rtb_MathFunction1_n[rtb_MatrixMultiply1_tmp_0] * rtb_Sum_k1 /
        rtb_Product3_e_tmp_1;
      rtb_Phi[5 + 6 * i] = 0.0;
      rtb_Phi[5 + rtb_MatrixMultiply1_tmp] = Phi_22[rtb_MatrixMultiply1_tmp_0];
    }
  }

  /* End of MATLAB Function: '<S123>/CreateStateTransitionMatrix' */

  /* MATLAB Function: '<S123>/MATLAB Function' incorporates:
   *  Constant: '<S123>/Constant13'
   */
  for (i = 0; i < 6; i++) {
    for (idxStart = 0; idxStart < 6; idxStart++) {
      rtb_MatrixMultiply1_tmp_0 = i + 6 * idxStart;
      rtb_P_chol_p_merge_0[rtb_MatrixMultiply1_tmp_0] = 0.0;
      for (rtb_MatrixMultiply1_tmp = 0; rtb_MatrixMultiply1_tmp < 6;
           rtb_MatrixMultiply1_tmp++) {
        rtb_P_chol_p_merge_0[rtb_MatrixMultiply1_tmp_0] = rtb_P_chol_p_merge[6 *
          i + rtb_MatrixMultiply1_tmp] * rtb_Phi[6 * rtb_MatrixMultiply1_tmp +
          idxStart] + rtb_P_chol_p_merge_0[6 * idxStart + i];
      }
    }
  }

  for (idxStart = 0; idxStart < 6; idxStart++) {
    for (i = 0; i < 6; i++) {
      rtb_MatrixMultiply1_tmp = i + 12 * idxStart;
      C[rtb_MatrixMultiply1_tmp] = rtb_P_chol_p_merge_0[6 * idxStart + i];
      C[rtb_MatrixMultiply1_tmp + 6] = rtCP_Constant13_Value[6 * i + idxStart];
    }

    for (i = 0; i < 12; i++) {
      unusedU2[i + 12 * idxStart] = C[12 * idxStart + i];
      unusedU2[i + 12 * (idxStart + 6)] = 0.0;
    }
  }

  xgeqrf_oLvid02n(unusedU2, unusedExpr);
  for (idxStart = 0; idxStart < 6; idxStart++) {
    for (i = 0; i <= idxStart; i++) {
      C[i + 12 * idxStart] = unusedU2[12 * idxStart + i];
    }

    for (i = idxStart; i + 2 < 13; i++) {
      C[(i + 12 * idxStart) + 1] = 0.0;
    }
  }

  /* Trigonometry: '<S163>/Cos' incorporates:
   *  Constant: '<S123>/Constant'
   *  Constant: '<S163>/Constant'
   *  Product: '<S163>/Multiply'
   */
  rtb_Elementproduct_m_idx_1 = cos(0.125 * rtb_Product3_bb);

  /* SignalConversion: '<S163>/ConcatBufferAtMatrix ConcatenateIn1' */
  rtb_Merge_e[0] = rtb_Elementproduct_m_idx_1;

  /* If: '<S162>/If' */
  if (rtb_Product3_bb < 1.0E-10) {
    /* Outputs for IfAction SubSystem: '<S162>/If Action Subsystem1' incorporates:
     *  ActionPort: '<S169>/Action Port'
     */
    /* SignalConversion: '<S169>/OutportBuffer_InsertedFor_Psi_zero_at_inport_0' */
    rtb_MathFunction_k[0] = 0.0;
    rtb_MathFunction_k[1] = 0.0;
    rtb_MathFunction_k[2] = 0.0;

    /* End of Outputs for SubSystem: '<S162>/If Action Subsystem1' */
  } else {
    /* Outputs for IfAction SubSystem: '<S162>/If Action Subsystem' incorporates:
     *  ActionPort: '<S168>/Action Port'
     */
    /* Trigonometry: '<S168>/Sin' incorporates:
     *  Constant: '<S123>/Constant'
     *  Constant: '<S168>/Constant'
     *  Product: '<S168>/Divide'
     */
    rtb_Product1_f1 = sin(0.125 * rtb_Product3_bb);

    /* Product: '<S168>/Divide1' */
    rtb_MathFunction_k[0] = rtb_Product1_f1 * rty_body_rates_radps[0] /
      rtb_Product3_bb;
    rtb_MathFunction_k[1] = rtb_Product1_f1 * rty_body_rates_radps[1] /
      rtb_Product3_bb;
    rtb_MathFunction_k[2] = rtb_Product1_f1 * rty_body_rates_radps[2] /
      rtb_Product3_bb;

    /* End of Outputs for SubSystem: '<S162>/If Action Subsystem' */
  }

  /* End of If: '<S162>/If' */

  /* Math: '<S163>/Transpose2' incorporates:
   *  Gain: '<S163>/Gain'
   */
  rtb_Merge_e[1] = -rtb_MathFunction_k[0];
  rtb_Merge_e[2] = -rtb_MathFunction_k[1];
  rtb_Merge_e[3] = -rtb_MathFunction_k[2];

  /* Outputs for Atomic SubSystem: '<S123>/CrossProdMatrix_lib' */
  CrossProdMatrix_lib_d(rtb_MathFunction_k, &rtb_MatrixConcatenate2_n[0]);

  /* End of Outputs for SubSystem: '<S123>/CrossProdMatrix_lib' */

  /* S-Function (sdspdiag2): '<S122>/Extract Diagonal' */
  for (i = 0; i < 6; i++) {
    rtb_sigma[i] = rtb_P_chol_p_merge[i * 7];
  }

  /* End of S-Function (sdspdiag2): '<S122>/Extract Diagonal' */

  /* Sum: '<S163>/Add1' incorporates:
   *  Product: '<S163>/Matrix Multiply2'
   */
  for (i = 0; i < 9; i++) {
    rtb_VectorConcatenate[i + 3] = rtb_Elementproduct_m_idx_1 * localDW->Id_3[i]
      - rtb_MatrixConcatenate2_n[i];
  }

  /* End of Sum: '<S163>/Add1' */

  /* SignalConversion: '<S163>/ConcatBufferAtMatrix Concatenate1In1' */
  rtb_VectorConcatenate[0] = rtb_MathFunction_k[0];
  rtb_VectorConcatenate[1] = rtb_MathFunction_k[1];
  rtb_VectorConcatenate[2] = rtb_MathFunction_k[2];
  for (i = 0; i < 6; i++) {
    /* Sqrt: '<S122>/Sqrt' incorporates:
     *  Abs: '<S122>/Abs'
     */
    rtb_Product3_bb = sqrt(fabs(rtb_sigma[i]));

    /* Gain: '<S122>/multiply' */
    rty_threeSigma_rad[i] = 3.0 * rtb_Product3_bb;

    /* Abs: '<S122>/Abs' */
    rtb_sigma[i] = rtb_Product3_bb;
  }

  /* Concatenate: '<S163>/Matrix Concatenate2' */
  for (i = 0; i < 4; i++) {
    idxStart = i << 2;
    rtb_MatrixConcatenate2_n[idxStart] = rtb_Merge_e[i];
    rtb_MatrixConcatenate2_n[1 + idxStart] = rtb_VectorConcatenate[3 * i];
    rtb_MatrixConcatenate2_n[2 + idxStart] = rtb_VectorConcatenate[3 * i + 1];
    rtb_MatrixConcatenate2_n[3 + idxStart] = rtb_VectorConcatenate[3 * i + 2];
  }

  /* End of Concatenate: '<S163>/Matrix Concatenate2' */

  /* Product: '<S123>/Product' */
  for (i = 0; i < 4; i++) {
    rtb_Product3_bb = rtb_MatrixConcatenate2_n[i + 12] * rty_sc_quat[3] +
      (rtb_MatrixConcatenate2_n[i + 8] * rty_sc_quat[2] +
       (rtb_MatrixConcatenate2_n[i + 4] * rty_sc_quat[1] +
        rtb_MatrixConcatenate2_n[i] * rty_sc_quat[0]));
    rtb_Merge_e[i] = rtb_Product3_bb;
  }

  /* End of Product: '<S123>/Product' */

  /* Sqrt: '<S170>/sqrt' incorporates:
   *  Product: '<S171>/Product'
   *  Product: '<S171>/Product1'
   *  Product: '<S171>/Product2'
   *  Product: '<S171>/Product3'
   *  Sum: '<S171>/Sum'
   */
  rtb_Elementproduct_m_idx_1 = sqrt(((rtb_Merge_e[0] * rtb_Merge_e[0] +
    rtb_Merge_e[1] * rtb_Merge_e[1]) + rtb_Merge_e[2] * rtb_Merge_e[2]) +
    rtb_Merge_e[3] * rtb_Merge_e[3]);

  /* SignalConversion: '<S123>/TmpSignal ConversionAtquat_rectify_libInport1' incorporates:
   *  Product: '<S164>/Product'
   *  Product: '<S164>/Product1'
   *  Product: '<S164>/Product2'
   *  Product: '<S164>/Product3'
   */
  rtb_Merge_e[3] /= rtb_Elementproduct_m_idx_1;
  rtb_Merge_e[0] /= rtb_Elementproduct_m_idx_1;
  rtb_Merge_e[1] /= rtb_Elementproduct_m_idx_1;
  rtb_Merge_e[2] /= rtb_Elementproduct_m_idx_1;

  /* Outputs for Atomic SubSystem: '<S123>/quat_rectify_lib' */
  quat_rectify_lib(rtb_Merge_e, rtb_TmpSignalConversionAtquat_m);

  /* End of Outputs for SubSystem: '<S123>/quat_rectify_lib' */

  /* If: '<S118>/If' incorporates:
   *  Constant: '<S127>/Constant'
   *  Inport: '<S129>/mekf_mode'
   *  RelationalOperator: '<S127>/Compare'
   */
  if (rtb_Switch_ex) {
    /* Outputs for IfAction SubSystem: '<S118>/If Action Subsystem' incorporates:
     *  ActionPort: '<S128>/Action Port'
     */
    /* SignalConversion: '<S128>/OutportBuffer_InsertedFor_mekf_triad_at_inport_0' incorporates:
     *  Constant: '<S128>/Constant'
     */
    *rty_mekf_telem = 3U;

    /* End of Outputs for SubSystem: '<S118>/If Action Subsystem' */
  } else if (rtb_Sum_hy < 2) {
    /* Outputs for IfAction SubSystem: '<S118>/If Action Subsystem1' incorporates:
     *  ActionPort: '<S129>/Action Port'
     */
    *rty_mekf_telem = rtb_Sum_hy;

    /* End of Outputs for SubSystem: '<S118>/If Action Subsystem1' */
  } else {
    /* Outputs for IfAction SubSystem: '<S118>/If Action Subsystem2' incorporates:
     *  ActionPort: '<S130>/Action Port'
     */
    /* SignalConversion: '<S130>/OutportBuffer_InsertedFor_mekf_nom_at_inport_0' incorporates:
     *  Constant: '<S130>/cnst'
     */
    *rty_mekf_telem = 0U;

    /* End of Outputs for SubSystem: '<S118>/If Action Subsystem2' */
  }

  /* End of If: '<S118>/If' */

  /* Update for UnitDelay: '<S3>/Unit Delay' */
  for (i = 0; i < 6; i++) {
    for (idxStart = 0; idxStart < 6; idxStart++) {
      /* Switch: '<S120>/Switch' incorporates:
       *  Constant: '<S120>/Constant'
       *  MATLAB Function: '<S123>/MATLAB Function'
       */
      if (rtb_Switch_lx) {
        localDW->UnitDelay_DSTATE[idxStart + 6 * i] = rtCP_Constant_Value_p3s[6 *
          i + idxStart];
      } else {
        localDW->UnitDelay_DSTATE[idxStart + 6 * i] = C[12 * idxStart + i];
      }

      /* End of Switch: '<S120>/Switch' */
    }
  }

  /* End of Update for UnitDelay: '<S3>/Unit Delay' */

  /* Update for UnitDelay: '<S3>/Unit Delay1' */
  localDW->UnitDelay1_DSTATE[0] = rty_bias_radps[0];
  localDW->UnitDelay1_DSTATE[1] = rty_bias_radps[1];
  localDW->UnitDelay1_DSTATE[2] = rty_bias_radps[2];

  /* Update for UnitDelay: '<S3>/Unit Delay3' */
  localDW->UnitDelay3_DSTATE[0] = rtb_TmpSignalConversionAtquat_m[0];
  localDW->UnitDelay3_DSTATE[1] = rtb_TmpSignalConversionAtquat_m[1];
  localDW->UnitDelay3_DSTATE[2] = rtb_TmpSignalConversionAtquat_m[2];
  localDW->UnitDelay3_DSTATE[3] = rtb_TmpSignalConversionAtquat_m[3];

  /* If: '<S3>/TRIAD_activation' */
  if (rtAction == 0) {
    /* Update for IfAction SubSystem: '<S3>/TriadEstimator_lib' incorporates:
     *  ActionPort: '<S124>/Action Port'
     */
    /* Update for UnitDelay: '<S124>/Unit Delay' */
    localDW->UnitDelay_DSTATE_c[0] = rtb_TmpSignalConversionAtquat_m[0];
    localDW->UnitDelay_DSTATE_c[1] = rtb_TmpSignalConversionAtquat_m[1];
    localDW->UnitDelay_DSTATE_c[2] = rtb_TmpSignalConversionAtquat_m[2];
    localDW->UnitDelay_DSTATE_c[3] = rtb_TmpSignalConversionAtquat_m[3];

    /* End of Update for SubSystem: '<S3>/TriadEstimator_lib' */
  }

  /* Update for UnitDelay: '<S155>/Delay Input1'
   *
   * Block description for '<S155>/Delay Input1':
   *
   *  Store in Global RAM
   */
  localDW->DelayInput1_DSTATE = rtb_Compare_l;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
