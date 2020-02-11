

    
  
    /*
    * sunVector_test.c
    * 
      * Academic License - for use in teaching, academic research, and meeting
* course requirements at degree granting institutions only.  Not for
* government, commercial, or other organizational use. 
  * 
  * Code generation for model "sunVector_test".
  *
  * Model version              : 1.7
  * Simulink Coder version : 9.0 (R2018b) 24-May-2018
  * C source code generated on : Tue Feb 11 12:28:37 2020
 * 
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
    */



    

          #include "sunVector_test.h"

        #include "sunVector_test_private.h"



  

  

  

  

  

  

  

  

  

  

    
    

  

  
      
    
    
    
    
    
    

  
        /* Real-time model */
          


  RT_MODEL_sunVector_test_T sunVector_test_M_;

        


  RT_MODEL_sunVector_test_T *const sunVector_test_M = &sunVector_test_M_;



  

  

  /* Forward declaration for local functions */
    
    
        
        

             static void sunVector_test_jseconds2ymdhms(real_T j_seconds, real_T *Year, real_T *Month, real_T *Day, real_T *h, real_T *b_min, real_T *s, real_T *JC, real_T *JD);
              


 
    
    
        
        

             static real_T sunVector_test_mod(real_T x);
              


 
    
    
        
        

             static void sunVector_test_sind(real_T *x);
              


 
    
    
        
        

             static void sunVector_test_cosd(real_T *x);
              


 


  

    
  
  
        
    
    
    
    
    

          
                
    
        
    /* Function for MATLAB Function: '<S2>/MATLAB Function3' */

      
          
      
    static void sunVector_test_jseconds2ymdhms(real_T j_seconds, real_T *Year, real_T *Month, real_T *Day, real_T *h, real_T *b_min, real_T *s, real_T *JC, real_T *JD)
    {
          int8_T LMonth[12];
real_T T_1900;
real_T DayofYr;
real_T sum;
static const int8_T b[12] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
int32_T i;
for (i = 0; i < 12; i++) {
    LMonth[i] = b[i];
}
*Month = 0.0;
*JD = j_seconds / 86400.0 + 2.451545E+6;
*JC = (*JD - 2.451545E+6) / 36525.0;
DayofYr = floor((*JD - 2.4150195E+6) / 365.25);
*Year = 1900.0 + DayofYr;
T_1900 = (*JD - 2.4150195E+6) - (floor((((1900.0 + DayofYr) - 1900.0) - 1.0) * 0.25) + ((1900.0 + DayofYr) - 1900.0) * 365.0);
if (T_1900 < 1.0) {
    *Year = (1900.0 + DayofYr) - 1.0;
    T_1900 = (*JD - 2.4150195E+6) - (floor(((((1900.0 + DayofYr) - 1.0) - 1900.0) - 1.0) * 0.25) + (((1900.0 + DayofYr) - 1.0) - 1900.0) * 365.0);
}
if ((!rtIsInf(*Year)) && (!rtIsNaN(*Year))) {
    if (*Year == 0.0) {
        DayofYr = 0.0;
    } else {
        DayofYr = fmod(*Year, 4.0);
        if (DayofYr == 0.0) {
            DayofYr = 0.0;
        } else {
            if (*Year < 0.0) {
                DayofYr += 4.0;
            }
        }
    }
} else {
    DayofYr = (rtNaN);
}
if (DayofYr == 0.0) {
    LMonth[1] = 29;
}
DayofYr = floor(T_1900);
for (sum = 0.0; sum < DayofYr; sum += (real_T)LMonth[(int32_T)*Month - 1]) {
    (*Month)++;
}
*Day = DayofYr - (sum - (real_T)LMonth[(int32_T)*Month - 1]);
T_1900 = (T_1900 - DayofYr) * 24.0;
*h = floor(T_1900);
T_1900 -= *h;
*b_min = floor(T_1900 * 60.0);
*s = (T_1900 - *b_min / 60.0) * 3600.0;


    }
      
      

      

        
                
    
        
    /* Function for MATLAB Function: '<S1>/MATLAB Function' */

      
          
      
    static real_T sunVector_test_mod(real_T x)
    {
          real_T r;
if ((!rtIsInf(x)) && (!rtIsNaN(x))) {
    if (x == 0.0) {
        r = 0.0;
    } else {
        r = fmod(x, 360.0);
        if (r == 0.0) {
            r = 0.0;
        } else {
            if (x < 0.0) {
                r += 360.0;
            }
        }
    }
} else {
    r = (rtNaN);
}
return r;


    }
      
      

      

      
        
                
    
        
        
     

      
         real_T rt_remd_snf(real_T u0, real_T u1)
    {
          real_T y;
real_T q;
if (rtIsNaN(u0) || rtIsInf(u0) || (rtIsNaN(u1) || rtIsInf(u1))) {
    y = (rtNaN);
} else if ((u1 != 0.0) && (u1 != trunc(u1))) {
    q = fabs(u0 / u1);
    if (fabs(q - floor(q + 0.5)) <= DBL_EPSILON * q) {
        y = 0.0 * u0;
    } else {
        y = fmod(u0, u1);
    }
} else {
    y = fmod(u0, u1);
}
return y;


    }
      

      

        
                
    
        
    /* Function for MATLAB Function: '<S1>/MATLAB Function' */

      
          
      
    static void sunVector_test_sind(real_T *x)
    {
          int8_T n;
real_T c_x;
real_T absx;



if (rtIsInf(*x) || rtIsNaN(*x)) {
    c_x = (rtNaN);
} else {
    c_x = rt_remd_snf(*x, 360.0);
    absx = fabs(c_x);
    if (absx > 180.0) {
        if (c_x > 0.0) {
            c_x -= 360.0;
        } else {
            c_x += 360.0;
        }
        absx = fabs(c_x);
    }
    if (absx <= 45.0) {
        c_x *= 0.017453292519943295;
        c_x = sin(c_x);
    } else {
        if (absx <= 135.0) {
            if (c_x > 0.0) {
                c_x = (c_x - 90.0) * 0.017453292519943295;
                n = 1;
            } else {
                c_x = (c_x + 90.0) * 0.017453292519943295;
                n = -1;
            }
        } else if (c_x > 0.0) {
            c_x = (c_x - 180.0) * 0.017453292519943295;
            n = 2;
        } else {
            c_x = (c_x + 180.0) * 0.017453292519943295;
            n = -2;
        }
        if (n == 1) {
            c_x = cos(c_x);
        } else if (n == -1) {
            c_x = -cos(c_x);
        } else {
            c_x = -sin(c_x);
        }
    }
}
*x = c_x;


    }
      
      

      

        
                
    
        
    /* Function for MATLAB Function: '<S1>/MATLAB Function' */

      
          
      
    static void sunVector_test_cosd(real_T *x)
    {
          int8_T n;
real_T b_x;
real_T absx;



if (rtIsInf(*x) || rtIsNaN(*x)) {
    *x = (rtNaN);
} else {
    b_x = rt_remd_snf(*x, 360.0);
    absx = fabs(b_x);
    if (absx > 180.0) {
        if (b_x > 0.0) {
            b_x -= 360.0;
        } else {
            b_x += 360.0;
        }
        absx = fabs(b_x);
    }
    if (absx <= 45.0) {
        b_x *= 0.017453292519943295;
        *x = cos(b_x);
    } else {
        if (absx <= 135.0) {
            if (b_x > 0.0) {
                b_x = (b_x - 90.0) * 0.017453292519943295;
                n = 1;
            } else {
                b_x = (b_x + 90.0) * 0.017453292519943295;
                n = -1;
            }
        } else if (b_x > 0.0) {
            b_x = (b_x - 180.0) * 0.017453292519943295;
            n = 2;
        } else {
            b_x = (b_x + 180.0) * 0.017453292519943295;
            n = -2;
        }
        if (n == 1) {
            *x = -sin(b_x);
        } else if (n == -1) {
            *x = sin(b_x);
        } else {
            *x = -cos(b_x);
        }
    }
}


    }
      
      

      


  
        
    
    
    
    /* Model step function */
    
          
    void sunVector_test_step(void)   
    {
            


      
      
      
            
      
        
real_T d;
real_T b_min;
real_T s;
real_T jd;
real_T M_s;
real_T phi_e;
real_T eps;
real_T JC_idx_1;

        

      

        
  



          
        
  



                                  /* MATLAB Function: '<S2>/MATLAB Function3' incorporates:
 *  Constant: '<Root>/Constant'
 */
sunVector_test_jseconds2ymdhms(sunVector_test_P.utc_test + -0.0361535, &phi_e, &eps, &d, &M_s, &b_min, &s, &JC_idx_1, &jd);
/* MATLAB Function: '<S1>/MATLAB Function' incorporates:
 *  MATLAB Function: '<S2>/MATLAB Function3'
 */
M_s = sunVector_test_mod(35999.05034 * JC_idx_1 + 357.5291092);
d = M_s;
sunVector_test_sind(&d);
phi_e = 2.0 * M_s;
sunVector_test_sind(&phi_e);
phi_e = (sunVector_test_mod(36000.771 * JC_idx_1 + 280.46) + 1.914666471 * d) + 0.019994643 * phi_e;
eps = 23.439291 - 0.0130042 * JC_idx_1;
d = M_s;
sunVector_test_cosd(&d);
d = 2.0 * M_s;
sunVector_test_cosd(&d);
d = phi_e;
sunVector_test_cosd(&d);
d = eps;
sunVector_test_cosd(&d);
M_s = phi_e;
sunVector_test_sind(&M_s);
sunVector_test_sind(&eps);
sunVector_test_sind(&phi_e);






        
  


    
	      /* Matfile logging */
        rt_UpdateTXYLogVars(sunVector_test_M->rtwLogInfo, (&sunVector_test_M->Timing.taskTime0));

        
      
      
      
      
            
  
  
    
    
      /* signal main to stop simulation */
      { /* Sample time: [0.2s, 0.0s] */
      if ( (rtmGetTFinal(sunVector_test_M)!=-1) &&
      !((rtmGetTFinal(sunVector_test_M)-sunVector_test_M->Timing.taskTime0) > sunVector_test_M->Timing.taskTime0 * (DBL_EPSILON))) {
        rtmSetErrorStatus(sunVector_test_M, "Simulation finished");
      }
      }


            /* Update absolute time for base rate */
            /* The "clockTick0" counts the number of times the code of this task has 
    * been executed. The absolute time is the multiplication of "clockTick0" 
    * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not 
    * overflow during the application lifespan selected.
      * Timer of this task consists of two 32 bit unsigned integers. 
      * The two integers represent the low bits Timing.clockTick0 and the high bits 
      * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment. 
    */

    if(!(++sunVector_test_M->Timing.clockTick0)) {
 ++sunVector_test_M->Timing.clockTickH0; 
} sunVector_test_M->Timing.taskTime0 = sunVector_test_M->Timing.clockTick0 * sunVector_test_M->Timing.stepSize0 + sunVector_test_M->Timing.clockTickH0 * sunVector_test_M->Timing.stepSize0 * 4294967296.0;


        

    


    
    
  
  

        

      
      
      


      
          
  

    } 
    
      




  







  /* Model initialize function */
  
      void sunVector_test_initialize(void)
  { 
      


    
    
    
    
        
    
    
        /* Registration code */
              
  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));
      
      
  


      
            
            /* initialize real-time model */
            (void) memset((void *)sunVector_test_M, 0,
sizeof(RT_MODEL_sunVector_test_T));
            
            
  
  
  

  
  
  
      
        
        
          
              rtmSetTFinal(sunVector_test_M, 0.0);
                sunVector_test_M->Timing.stepSize0  = 0.2;
        
        
            
  

        
      
          
            
  /* Setup for data logging */
  {
      static RTWLogInfo rt_DataLoggingInfo;
      rt_DataLoggingInfo.loggingInterval = NULL;

          sunVector_test_M->rtwLogInfo = &rt_DataLoggingInfo;

  }


  /* Setup for data logging */
  {

          rtliSetLogXSignalInfo(sunVector_test_M->rtwLogInfo, (NULL));

          rtliSetLogXSignalPtrs(sunVector_test_M->rtwLogInfo, (NULL));


        rtliSetLogT(sunVector_test_M->rtwLogInfo, "tout");

        rtliSetLogX(sunVector_test_M->rtwLogInfo, "");

        rtliSetLogXFinal(sunVector_test_M->rtwLogInfo, "");

        rtliSetLogVarNameModifier(sunVector_test_M->rtwLogInfo, "rt_");

        rtliSetLogFormat(sunVector_test_M->rtwLogInfo, 4);

        rtliSetLogMaxRows(sunVector_test_M->rtwLogInfo, 0);

        rtliSetLogDecimation(sunVector_test_M->rtwLogInfo, 1);


    
      

             rtliSetLogY(sunVector_test_M->rtwLogInfo, "");


          rtliSetLogYSignalInfo(sunVector_test_M->rtwLogInfo, (NULL));

          rtliSetLogYSignalPtrs(sunVector_test_M->rtwLogInfo, (NULL));

  }


      
      
  
  

  
  
  


  







    


  

          

  
      
      

    
    
      
      /* Matfile logging */
        
  rt_StartDataLoggingWithStartTime(sunVector_test_M->rtwLogInfo, 0.0, rtmGetTFinal(sunVector_test_M), sunVector_test_M->Timing.stepSize0, (&rtmGetErrorStatus(sunVector_test_M)));

    
        






      
    
    
        

  


      
  


  }    




      
  


  
    
    /* Model terminate function */
          void sunVector_test_terminate(void)

    {
      
      /* (no terminate code required) */



      
          
  

    }
      
  




  
  
   



  

  

  

  
