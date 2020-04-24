/*
 * soac_unit_test_private.h
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

#ifndef RTW_HEADER_soac_unit_test_private_h_
#define RTW_HEADER_soac_unit_test_private_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#include "soac_unit_test.h"

/* Private macros used by the generated code to access rtModel */
#ifndef rtmIsMajorTimeStep
# define rtmIsMajorTimeStep(rtm)       (((rtm)->Timing.simTimeStep) == MAJOR_TIME_STEP)
#endif

#ifndef rtmIsMinorTimeStep
# define rtmIsMinorTimeStep(rtm)       (((rtm)->Timing.simTimeStep) == MINOR_TIME_STEP)
#endif

#ifndef rtmSetTFinal
# define rtmSetTFinal(rtm, val)        ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmSetTPtr
# define rtmSetTPtr(rtm, val)          ((rtm)->Timing.t = (val))
#endif

extern const real_T rtCP_pooled_W21ON5I2QS7t[4];
extern const real_T rtCP_pooled_ys6omznX6h5o[4];
extern const real_T rtCP_pooled_N6aD1OScWuWR[3];

#define rtCP_Constant_Value_c          rtCP_pooled_W21ON5I2QS7t  /* Expression: q0
                                                                  * Referenced by: '<Root>/Constant'
                                                                  */
#define rtCP_Constant2_Value           rtCP_pooled_ys6omznX6h5o  /* Expression: qf
                                                                  * Referenced by: '<Root>/Constant2'
                                                                  */
#define rtCP_Constant4_Value           rtCP_pooled_N6aD1OScWuWR  /* Expression: sI
                                                                  * Referenced by: '<Root>/Constant4'
                                                                  */

extern void soac_unit_test_run_ecos(real_T rtu_n, real_T rtu_m, real_T rtu_p,
  real_T rtu_l, real_T rtu_ncones, const real_T rtu_c[332], const real_T
  rtu_Gjc[333], const real_T rtu_Gir[834], const real_T rtu_Gpr[834], const
  real_T rtu_h[474], const real_T rtu_q[21], const real_T rtu_Ajc[333], const
  real_T rtu_Air[1278], const real_T rtu_Apr[1278], const real_T rtu_b[117],
  real_T rty_y[334]);

#endif                                 /* RTW_HEADER_soac_unit_test_private_h_ */
