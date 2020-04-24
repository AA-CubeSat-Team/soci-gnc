/*
 * soac_unit_test.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "soac_unit_test".
 *
 * Model version              : 1.95
 * Simulink Coder versi
 * "?"
 * {} 0 n89bvc 6x¸1 ` on : 9.0 (R2018b) 24-May-2018
 * C source code generated on : Tue Apr 21 17:06:42 2020
 ??
\q1 `2*
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: ARM Compatible->ARM 7
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_soac_unit_test_h_
#define RTW_HEADER_soac_unit_test_h_
#include <stddef.h>
#include <math.h>
#include <string.h>
#include <float.h>
#ifndef soac_unit_test_COMMON_INCLUDES_
# define soac_unit_test_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "rt_logging.h"
#include "ecos.h"
#endif                                 /* soac_unit_test_COMMON_INCLUDES_ */

#include "soac_unit_test_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWLogInfo
# define rtmGetRTWLogInfo(rtm)         ((rtm)->rtwLogInfo)
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
# define rtmGetTPtr(rtm)               ((rtm)->Timing.t)
#endif

/* Block signals (default storage) */
typedef struct {
  real_T G[157368];
  real_T Gquad__[50464];
  real_T A[38844];
  real_T Hv[33200];
  real_T Hev[33200];
  real_T Gquad_[30544];
  real_T EH[10000];
  real_T Hv_tmp[10000];
  real_T dv0[10000];
  real_T Hw[9960];
  real_T Hu[9960];
  real_T BE[3000];
  real_T dv1[3000];
  real_T MI[1328];
  real_T TmpSignalConversionAtAprOut[1278];/* '<S7>/Apr' */
  real_T Air[1278];
  real_T Apr[1278];
  real_T dv2[900];
  real_T TmpSignalConversionAtGprOut[834];/* '<S7>/Gpr' */
  real_T Gir[834];
  real_T Gpr[834];
  int32_T DataTypeConversion9[1278];   /* '<S7>/Data Type Conversion9' */
  real_T X[100];                       /* '<S3>/SOLVE' */
  real_T U[30];                        /* '<S3>/SOLVE' */
  real_T s;                            /* '<S3>/SOLVE' */
  real_T exitcode[17];                 /* '<S3>/SOLVE' */
  real_T time[15];                     /* '<S3>/SOLVE' */
  boolean_T Compare;                   /* '<S4>/Compare' */
  boolean_T Uk1;                       /* '<S2>/Delay Input1' */
  boolean_T FixPtRelationalOperator;   /* '<S2>/FixPt Relational Operator' */
} B_soac_unit_test_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  struct {
    void *LoggedData;
  } Scope_PWORK;                       /* '<Root>/Scope' */

  struct {
    void *LoggedData;
  } ToWorkspace_PWORK;                 /* '<Root>/To Workspace' */

  struct {
    void *LoggedData;
  } ToWorkspace1_PWORK;                /* '<Root>/To Workspace1' */

  struct {
    void *LoggedData;
  } ToWorkspace2_PWORK;                /* '<Root>/To Workspace2' */

  struct {
    void *LoggedData;
  } ToWorkspace3_PWORK;                /* '<Root>/To Workspace3' */

  struct {
    void *LoggedData;
  } ToWorkspace4_PWORK;                /* '<Root>/To Workspace4' */

  boolean_T DelayInput1_DSTATE;        /* '<S2>/Delay Input1' */
} DW_soac_unit_test_T;

/* Zero-crossing (trigger) state */
typedef struct {
  ZCSigState soac_lib_Trig_ZCE;        /* '<Root>/soac_lib' */
} PrevZCX_soac_unit_test_T;

/* Real-time Model Data Structure */
struct tag_RTM_soac_unit_test_T {
  const char_T *errorStatus;
  RTWLogInfo *rtwLogInfo;
  RTWSolverInfo solverInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    time_T tFinal;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

/* Block signals (default storage) */
extern B_soac_unit_test_T soac_unit_test_B;

/* Block states (default storage) */
extern DW_soac_unit_test_T soac_unit_test_DW;

/* Model entry point functions */
extern void soac_unit_test_initialize(void);
extern void soac_unit_test_step(void);
extern void soac_unit_test_terminate(void);

/* Real-time Model object */
extern RT_MODEL_soac_unit_test_T *const soac_unit_test_M;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<S7>/Data Type Conversion10' : Eliminate redundant data type conversion
 * Block '<S7>/Data Type Conversion11' : Eliminate redundant data type conversion
 * Block '<S7>/Data Type Conversion12' : Eliminate redundant data type conversion
 * Block '<S7>/Data Type Conversion13' : Eliminate redundant data type conversion
 * Block '<S7>/Data Type Conversion14' : Eliminate redundant data type conversion
 */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'soac_unit_test'
 * '<S1>'   : 'soac_unit_test/Compare To Constant'
 * '<S2>'   : 'soac_unit_test/Detect Rise Positive'
 * '<S3>'   : 'soac_unit_test/soac_lib'
 * '<S4>'   : 'soac_unit_test/Detect Rise Positive/Positive'
 * '<S5>'   : 'soac_unit_test/soac_lib/INITIALIZE'
 * '<S6>'   : 'soac_unit_test/soac_lib/SOLVE'
 * '<S7>'   : 'soac_unit_test/soac_lib/call to ECOS SOCP solver (compiled C function)'
 */
#endif                                 /* RTW_HEADER_soac_unit_test_h_ */
