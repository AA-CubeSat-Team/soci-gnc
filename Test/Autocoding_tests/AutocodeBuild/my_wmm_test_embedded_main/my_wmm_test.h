/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: my_wmm_test.h
 *
 * Code generated for Simulink model 'my_wmm_test'.
 *
 * Model version                  : 1.2
 * Simulink Coder version         : 9.0 (R2018b) 24-May-2018
 * C/C++ source code generated on : Sun May  3 14:01:54 2020
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_my_wmm_test_h_
#define RTW_HEADER_my_wmm_test_h_
#include <math.h>
#include <stddef.h>
#ifndef my_wmm_test_COMMON_INCLUDES_
# define my_wmm_test_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* my_wmm_test_COMMON_INCLUDES_ */

#include "my_wmm_test_types.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* Real-time Model Data Structure */
struct tag_RTM_my_wmm_test_T {
  const char_T * volatile errorStatus;
};

/* Model entry point functions */
extern void my_wmm_test_initialize(void);
extern void my_wmm_test_step(void);
extern void my_wmm_test_terminate(void);

/* Real-time Model object */
extern RT_MODEL_my_wmm_test_T *const my_wmm_test_M;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<Root>/To Workspace' : Unused code path elimination
 * Block '<Root>/To Workspace1' : Unused code path elimination
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
 * '<Root>' : 'my_wmm_test'
 * '<S1>'   : 'my_wmm_test/magField_custom_lib'
 * '<S2>'   : 'my_wmm_test/magField_custom_lib/MATLAB Function'
 */
#endif                                 /* RTW_HEADER_my_wmm_test_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
