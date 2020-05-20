/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: ert_main.c
 *
 * Code generated for Simulink model 'sgp4_lib_fsw0'.
 *
 * Model version                  : 1.52
 * Simulink Coder version         : 9.0 (R2018b) 24-May-2018
 * C/C++ source code generated on : Sun Mar 29 15:15:33 2020
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Atmel->AVR (8-bit)
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 * Validation result: Not run
 */

#include <stddef.h>
#include <stdio.h>                     /* This ert_main.c example uses printf/fflush */
#include "sgp4_lib_fsw0.h"             /* Model's header file */
#include "rtwtypes.h"

/*
 * Associating rt_OneStep with a real-time clock or interrupt service routine
 * is what makes the generated code "real-time".  The function rt_OneStep is
 * always associated with the base rate of the model.  Subrates are managed
 * by the base rate from inside the generated code.  Enabling/disabling
 * interrupts and floating point context switches are target specific.  This
 * example code indicates where these should take place relative to executing
 * the generated code step function.  Overrun behavior should be tailored to
 * your application needs.  This example simply sets an error status in the
 * real-time model and returns from rt_OneStep.
 */
void rt_OneStep(void);
void rt_OneStep(void)
{
  static boolean_T OverrunFlag = false;

  /* Disable interrupts here */

  /* Check for overrun */
  if (OverrunFlag) {
    rtmSetErrorStatus(rtM, "Overrun");
    return;
  }

  OverrunFlag = true;

  /* Save FPU context here (if necessary) */
  /* Re-enable timer or interrupt here */
  /* Set model inputs here */

  /* Step the model */
  sgp4_lib_fsw0_step();

  /* Get model outputs here */

  /* Indicate task complete */
  OverrunFlag = false;

  /* Disable interrupts here */
  /* Restore FPU context here (if necessary) */
  /* Enable interrupts here */
}

/*
 * The example "main" function illustrates what is required by your
 * application code to initialize, execute, and terminate the generated code.
 * Attaching rt_OneStep to a real-time clock is target specific.  This example
 * illustrates how you do this relative to initializing the model.
 */
int_T main(int_T argc, const char *argv[])
{
  /* Unused arguments */
  (void)(argc);
  (void)(argv);

  /* Initialize model */
  sgp4_lib_fsw0_initialize();

	char buffer[1024];
	int num_trials = 1;
	FILE * fp; 
	fp = fopen ("input.txt", "r");
	fscanf(fp, "%s", buffer);
	fscanf(fp, "%s", buffer);
	fscanf(fp, "%s", buffer);
	fscanf(fp, "%s", buffer);
	// This Line will pull in variables from text file 
	fscanf(fp,"%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf", &rtU.JD_utc_J2000, &rtU.orbit_tle[0], &rtU.orbit_tle[1], &rtU.orbit_tle[2], &rtU.orbit_tle[3], &rtU.orbit_tle[4], &rtU.orbit_tle[5], &rtU.orbit_tle[6], &rtU.orbit_tle[7], &rtU.orbit_tle[8], &rtU.teme_to_gcrf[0], &rtU.teme_to_gcrf[1], &rtU.teme_to_gcrf[2], &rtU.teme_to_gcrf[3], &rtU.teme_to_gcrf[4], &rtU.teme_to_gcrf[5], &rtU.teme_to_gcrf[6], &rtU.teme_to_gcrf[7], &rtU.teme_to_gcrf[8]);

// This will Step through your model,
rt_OneStep();

	for(int i=0; i<3; i++) {
		printf(" pos_eci_m[%d]: %lf \n", i,rtY.pos_eci_m[i]);
	}	for(int i=0; i<3; i++) {
		printf(" vel_eci_mps[%d]: %lf \n", i,rtY.vel_eci_mps[i]);
	}		printf(" SGP4_FLAG %lf \n", rtY.SGP4_FLAG);


  /* Disable rt_OneStep() here */
  
  return 0;
}

