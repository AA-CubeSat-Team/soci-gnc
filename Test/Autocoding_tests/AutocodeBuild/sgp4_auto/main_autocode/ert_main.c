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

  //Open The File

  FILE *fp = fopen("input.txt", "r");

  if (!fp) {
      printf("Can't open file\n");
      return 0;
  }

  // We will need to pull these from the python parse
  int num_var = 3;
  int var_length[3] = {1,9,9};

  //This is all fairly generic
  char buf[1024];
  int row_count = 0;
  int value_count = 0;
  int var_count = 0;
  while (fgets(buf, 1024, fp)) {
      value_count = 0;
      row_count++;
      if (row_count > 3) {
          var_count = row_count-4;
          printf("We are on Var %d\n", var_count);
          char *values = strtok(buf, ",");
          while(values){
              if (value_count < var_length[row_count-4]){
                  printf("%s\n", values);
                  switch (var_count){
                    case 0:
                      // printf("var 1");
                      rtU.JD_utc_J2000 = atof(values);
                    case 1:
                      // printf("var 2");
                      rtU.orbit_tle[value_count] = values;
                    case 2:
                      // printf("var 3");
                      rtU.teme_to_gcrf[value_count] = values;
                  }

              }
              values = strtok(NULL, ",");
              value_count++;
          }
          printf("Value Count: %d \n",value_count - 1);
          printf("\n");
      }
      

  }

  fclose(fp);

  char line[1024];
  while (fgets(line, 1024, fp))
  {
      char* tmp = strdup(line);
      // printf("%s\n", tmp);
      // // NOTE strtok clobbers tmp
      free(tmp);
  }

  rt_OneStep();
  for (int i = 0; i < 3; ++i) {
    printf("rtY.pos_eci_m[%d] = %20.12f\n",i,rtY.pos_eci_m[i]);
  }
  for (int i = 0; i < 3; ++i) {
    printf("rtY.vel_eci_mps[%d] = %20.12f\n",i,rtY.vel_eci_mps[i]);
  }
  printf("rtY.SGP4_FLAG = %f\n",rtY.SGP4_FLAG);

  return 0;
}



