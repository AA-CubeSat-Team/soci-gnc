

    /*
  * sunVector_test_types.h
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


  #ifndef RTW_HEADER_sunVector_test_types_h_
  #define RTW_HEADER_sunVector_test_types_h_
  

    

  
#include "rtwtypes.h"

#include "builtin_typeid_types.h"

#include "multiword_types.h"


  

  

  

  

  

  

  

  

    
  

/* Custom Type definition for MATLAB Function: '<S2>/MATLAB Function3' */
#ifndef struct_tag_swJB8fTkF7wwrO8Zwm7vPlC
#define struct_tag_swJB8fTkF7wwrO8Zwm7vPlC
struct tag_swJB8fTkF7wwrO8Zwm7vPlC
{
    real_T SP_ON;
    real_T GG_ON;
    real_T ATMO_ON;
};
#endif /*struct_tag_swJB8fTkF7wwrO8Zwm7vPlC*/
#ifndef typedef_swJB8fTkF7wwrO8Zwm7vPlC_sunVe_T
#define typedef_swJB8fTkF7wwrO8Zwm7vPlC_sunVe_T
typedef struct tag_swJB8fTkF7wwrO8Zwm7vPlC swJB8fTkF7wwrO8Zwm7vPlC_sunVe_T;
#endif /*typedef_swJB8fTkF7wwrO8Zwm7vPlC_sunVe_T*/
#ifndef struct_tag_sLzKJ90OEFWVMlbJOGyLlnC
#define struct_tag_sLzKJ90OEFWVMlbJOGyLlnC
struct tag_sLzKJ90OEFWVMlbJOGyLlnC
{
    real_T M2KM;
    real_T KM2M;
    real_T DEG2RAD;
    real_T RAD2DEG;
    real_T DAY2SEC;
    real_T SEC2DAY;
    real_T RPS2RPM;
    real_T RPM2RPS;
    real_T AU2KM;
    real_T nT2T;
    real_T HR2SEC;
    real_T SEC2HR;
};
#endif /*struct_tag_sLzKJ90OEFWVMlbJOGyLlnC*/
#ifndef typedef_sLzKJ90OEFWVMlbJOGyLlnC_sunVe_T
#define typedef_sLzKJ90OEFWVMlbJOGyLlnC_sunVe_T
typedef struct tag_sLzKJ90OEFWVMlbJOGyLlnC sLzKJ90OEFWVMlbJOGyLlnC_sunVe_T;
#endif /*typedef_sLzKJ90OEFWVMlbJOGyLlnC_sunVe_T*/
#ifndef struct_tag_s5PQwUmWHJ7buFPYC2ug8qD
#define struct_tag_s5PQwUmWHJ7buFPYC2ug8qD
struct tag_s5PQwUmWHJ7buFPYC2ug8qD
{
    real_T q0[4];
    real_T w0[3];
    real_T r0[3];
    real_T v0[3];
    real_T all[13];
};
#endif /*struct_tag_s5PQwUmWHJ7buFPYC2ug8qD*/
#ifndef typedef_s5PQwUmWHJ7buFPYC2ug8qD_sunVe_T
#define typedef_s5PQwUmWHJ7buFPYC2ug8qD_sunVe_T
typedef struct tag_s5PQwUmWHJ7buFPYC2ug8qD s5PQwUmWHJ7buFPYC2ug8qD_sunVe_T;
#endif /*typedef_s5PQwUmWHJ7buFPYC2ug8qD_sunVe_T*/
#ifndef struct_tag_s41Zm7keKZPaALhK3GA9CgF
#define struct_tag_s41Zm7keKZPaALhK3GA9CgF
struct tag_s41Zm7keKZPaALhK3GA9CgF
{
    real_T y_epoch;
    real_T DUT1;
    real_T TAI_offset;
    real_T DTT_TAI;
    real_T epoch_utc_s;
    real_T res;
};
#endif /*struct_tag_s41Zm7keKZPaALhK3GA9CgF*/
#ifndef typedef_s41Zm7keKZPaALhK3GA9CgF_sunVe_T
#define typedef_s41Zm7keKZPaALhK3GA9CgF_sunVe_T
typedef struct tag_s41Zm7keKZPaALhK3GA9CgF s41Zm7keKZPaALhK3GA9CgF_sunVe_T;
#endif /*typedef_s41Zm7keKZPaALhK3GA9CgF_sunVe_T*/
#ifndef struct_tag_sB337z0fL6GYO7sKWdgRIbD
#define struct_tag_sB337z0fL6GYO7sKWdgRIbD
struct tag_sB337z0fL6GYO7sKWdgRIbD
{
    real_T psrp;
};
#endif /*struct_tag_sB337z0fL6GYO7sKWdgRIbD*/
#ifndef typedef_sB337z0fL6GYO7sKWdgRIbD_sunVe_T
#define typedef_sB337z0fL6GYO7sKWdgRIbD_sunVe_T
typedef struct tag_sB337z0fL6GYO7sKWdgRIbD sB337z0fL6GYO7sKWdgRIbD_sunVe_T;
#endif /*typedef_sB337z0fL6GYO7sKWdgRIbD_sunVe_T*/
#ifndef struct_tag_sc3KIpYdgg88P9u61qch0BG
#define struct_tag_sc3KIpYdgg88P9u61qch0BG
struct tag_sc3KIpYdgg88P9u61qch0BG
{
    real_T sample_time_s;
};
#endif /*struct_tag_sc3KIpYdgg88P9u61qch0BG*/
#ifndef typedef_sc3KIpYdgg88P9u61qch0BG_sunVe_T
#define typedef_sc3KIpYdgg88P9u61qch0BG_sunVe_T
typedef struct tag_sc3KIpYdgg88P9u61qch0BG sc3KIpYdgg88P9u61qch0BG_sunVe_T;
#endif /*typedef_sc3KIpYdgg88P9u61qch0BG_sunVe_T*/
#ifndef struct_tag_seFP5HnOMUI7kgTJ7EKZdHC
#define struct_tag_seFP5HnOMUI7kgTJ7EKZdHC
struct tag_seFP5HnOMUI7kgTJ7EKZdHC
{
    real_T rpm[4];
    real_T radps[4];
    real_T momentum[4];
    real_T body_momentum[3];
    real_T power_W[4];
    real_T torque_Nm[4];
    real_T body_torque_Nm[3];
    real_T rt1;
    real_T deriv1;
};
#endif /*struct_tag_seFP5HnOMUI7kgTJ7EKZdHC*/
#ifndef typedef_seFP5HnOMUI7kgTJ7EKZdHC_sunVe_T
#define typedef_seFP5HnOMUI7kgTJ7EKZdHC_sunVe_T
typedef struct tag_seFP5HnOMUI7kgTJ7EKZdHC seFP5HnOMUI7kgTJ7EKZdHC_sunVe_T;
#endif /*typedef_seFP5HnOMUI7kgTJ7EKZdHC_sunVe_T*/
#ifndef struct_tag_sPlirOq7zE6BnsbUaorrKU
#define struct_tag_sPlirOq7zE6BnsbUaorrKU
struct tag_sPlirOq7zE6BnsbUaorrKU
{
    real_T B_eci_T[3];
};
#endif /*struct_tag_sPlirOq7zE6BnsbUaorrKU*/
#ifndef typedef_sPlirOq7zE6BnsbUaorrKU_sunVec_T
#define typedef_sPlirOq7zE6BnsbUaorrKU_sunVec_T
typedef struct tag_sPlirOq7zE6BnsbUaorrKU sPlirOq7zE6BnsbUaorrKU_sunVec_T;
#endif /*typedef_sPlirOq7zE6BnsbUaorrKU_sunVec_T*/
#ifndef struct_tag_sceQFFiSPmohIdeDgtFqdpE
#define struct_tag_sceQFFiSPmohIdeDgtFqdpE
struct tag_sceQFFiSPmohIdeDgtFqdpE
{
    real_T I_out_ApW;
    real_T I_cutoff_A[6];
};
#endif /*struct_tag_sceQFFiSPmohIdeDgtFqdpE*/
#ifndef typedef_sceQFFiSPmohIdeDgtFqdpE_sunVe_T
#define typedef_sceQFFiSPmohIdeDgtFqdpE_sunVe_T
typedef struct tag_sceQFFiSPmohIdeDgtFqdpE sceQFFiSPmohIdeDgtFqdpE_sunVe_T;
#endif /*typedef_sceQFFiSPmohIdeDgtFqdpE_sunVe_T*/
#ifndef struct_tag_spGmOAiwOS7vBp2xejF5T2G
#define struct_tag_spGmOAiwOS7vBp2xejF5T2G
struct tag_spGmOAiwOS7vBp2xejF5T2G
{
    real_T w_earth_rads[3];
    real_T mu_earth_km3s2;
    real_T r_earth_km;
    real_T JDJ2000;
    real_T c_reorientation_controller_thre;
    real_T d_reorientation_controller_thre;
    real_T small;
};
#endif /*struct_tag_spGmOAiwOS7vBp2xejF5T2G*/
#ifndef typedef_spGmOAiwOS7vBp2xejF5T2G_sunVe_T
#define typedef_spGmOAiwOS7vBp2xejF5T2G_sunVe_T
typedef struct tag_spGmOAiwOS7vBp2xejF5T2G spGmOAiwOS7vBp2xejF5T2G_sunVe_T;
#endif /*typedef_spGmOAiwOS7vBp2xejF5T2G_sunVe_T*/
#ifndef struct_tag_sYlGz1I8ACl8ul2Hkf7vUqG
#define struct_tag_sYlGz1I8ACl8ul2Hkf7vUqG
struct tag_sYlGz1I8ACl8ul2Hkf7vUqG
{
    real_T z_len;
    real_T x_len;
    real_T y_len;
    real_T m_2u;
    real_T xB_dir[3];
    real_T yB_dir[3];
    real_T zB_dir[3];
    real_T J[9];
    real_T point_of_pressure[3];
    real_T CD;
    real_T Ax;
    real_T Ay;
    real_T Az;
};
#endif /*struct_tag_sYlGz1I8ACl8ul2Hkf7vUqG*/
#ifndef typedef_sYlGz1I8ACl8ul2Hkf7vUqG_sunVe_T
#define typedef_sYlGz1I8ACl8ul2Hkf7vUqG_sunVe_T
typedef struct tag_sYlGz1I8ACl8ul2Hkf7vUqG sYlGz1I8ACl8ul2Hkf7vUqG_sunVe_T;
#endif /*typedef_sYlGz1I8ACl8ul2Hkf7vUqG_sunVe_T*/
#ifndef struct_tag_sHt7J2apU8I035bRJYuXhBF
#define struct_tag_sHt7J2apU8I035bRJYuXhBF
struct tag_sHt7J2apU8I035bRJYuXhBF
{
    real_T num_wheels;
    real_T sample_time_s;
    real_T inertia[4];
    real_T time_cnst[4];
    real_T max_RPM;
    real_T max_RADPS;
    real_T visc_fric;
    real_T torque_cnst;
    real_T delay;
    real_T resistance;
    real_T inductance;
    real_T inertia_matrix[16];
    real_T inv_inertia_matrix[16];
    real_T dc_voltage;
    real_T cant_angle;
    real_T max_torque_Nm;
    real_T Aw[16];
    real_T iAw[16];
    seFP5HnOMUI7kgTJ7EKZdHC_sunVe_T ic;
};
#endif /*struct_tag_sHt7J2apU8I035bRJYuXhBF*/
#ifndef typedef_sHt7J2apU8I035bRJYuXhBF_sunVe_T
#define typedef_sHt7J2apU8I035bRJYuXhBF_sunVe_T
typedef struct tag_sHt7J2apU8I035bRJYuXhBF sHt7J2apU8I035bRJYuXhBF_sunVe_T;
#endif /*typedef_sHt7J2apU8I035bRJYuXhBF_sunVe_T*/
#ifndef struct_tag_siwzHGtSLAHG8A7CquD1J6G
#define struct_tag_siwzHGtSLAHG8A7CquD1J6G
struct tag_siwzHGtSLAHG8A7CquD1J6G
{
    real_T normals[15];
    real_T n_coils[3];
    real_T tot_coils;
    real_T id_x[2];
    real_T id_y[2];
    real_T id_z;
    real_T dipoles_Am2[3];
    real_T dipole_max_Am2[3];
    real_T voltage[3];
    real_T max_current[3];
    real_T P_max_W[3];
    real_T dc_max;
    real_T m_2_dc[3];
    real_T dc_2_m[3];
    real_T dipole_to_power[3];
};
#endif /*struct_tag_siwzHGtSLAHG8A7CquD1J6G*/
#ifndef typedef_siwzHGtSLAHG8A7CquD1J6G_sunVe_T
#define typedef_siwzHGtSLAHG8A7CquD1J6G_sunVe_T
typedef struct tag_siwzHGtSLAHG8A7CquD1J6G siwzHGtSLAHG8A7CquD1J6G_sunVe_T;
#endif /*typedef_siwzHGtSLAHG8A7CquD1J6G_sunVe_T*/
#ifndef struct_tag_s0DJgMNRecIhB2XPdiSPjmF
#define struct_tag_s0DJgMNRecIhB2XPdiSPjmF
struct tag_s0DJgMNRecIhB2XPdiSPjmF
{
    real_T sample_time_s;
    sHt7J2apU8I035bRJYuXhBF_sunVe_T rwa;
    siwzHGtSLAHG8A7CquD1J6G_sunVe_T mtq;
};
#endif /*struct_tag_s0DJgMNRecIhB2XPdiSPjmF*/
#ifndef typedef_s0DJgMNRecIhB2XPdiSPjmF_sunVe_T
#define typedef_s0DJgMNRecIhB2XPdiSPjmF_sunVe_T
typedef struct tag_s0DJgMNRecIhB2XPdiSPjmF s0DJgMNRecIhB2XPdiSPjmF_sunVe_T;
#endif /*typedef_s0DJgMNRecIhB2XPdiSPjmF_sunVe_T*/
#ifndef struct_tag_sIBTDDhuBYfNAeo79QDCmwD
#define struct_tag_sIBTDDhuBYfNAeo79QDCmwD
struct tag_sIBTDDhuBYfNAeo79QDCmwD
{
    real_T N_mag;
    real_T sample_time_s;
    sPlirOq7zE6BnsbUaorrKU_sunVec_T ic;
    boolean_T noise[3];
    real_T seed[3];
    real_T err[9];
    real_T resolution[3];
    real_T B_min[3];
    real_T B_max[3];
};
#endif /*struct_tag_sIBTDDhuBYfNAeo79QDCmwD*/
#ifndef typedef_sIBTDDhuBYfNAeo79QDCmwD_sunVe_T
#define typedef_sIBTDDhuBYfNAeo79QDCmwD_sunVe_T
typedef struct tag_sIBTDDhuBYfNAeo79QDCmwD sIBTDDhuBYfNAeo79QDCmwD_sunVe_T;
#endif /*typedef_sIBTDDhuBYfNAeo79QDCmwD_sunVe_T*/
#ifndef struct_tag_s9rNe35jkRRfWm7JjlywTFE
#define struct_tag_s9rNe35jkRRfWm7JjlywTFE
struct tag_s9rNe35jkRRfWm7JjlywTFE
{
    real_T N_gyro;
    real_T sample_time_s;
    real_T seed_arw[9];
    real_T seed_rrw[9];
    real_T arw[3];
    real_T rrw[3];
    real_T resolution[3];
    real_T bias_init[9];
    real_T w_min[3];
    real_T w_max[3];
};
#endif /*struct_tag_s9rNe35jkRRfWm7JjlywTFE*/
#ifndef typedef_s9rNe35jkRRfWm7JjlywTFE_sunVe_T
#define typedef_s9rNe35jkRRfWm7JjlywTFE_sunVe_T
typedef struct tag_s9rNe35jkRRfWm7JjlywTFE s9rNe35jkRRfWm7JjlywTFE_sunVe_T;
#endif /*typedef_s9rNe35jkRRfWm7JjlywTFE_sunVe_T*/
#ifndef struct_tag_sj19ixjie7IaXwfmTGGqueG
#define struct_tag_sj19ixjie7IaXwfmTGGqueG
struct tag_sj19ixjie7IaXwfmTGGqueG
{
    real_T sample_time_s;
    real_T body2sensor[9];
    boolean_T noise;
    real_T deg_var;
    real_T seed[2];
    real_T range_deg;
    real_T resolution;
};
#endif /*struct_tag_sj19ixjie7IaXwfmTGGqueG*/
#ifndef typedef_sj19ixjie7IaXwfmTGGqueG_sunVe_T
#define typedef_sj19ixjie7IaXwfmTGGqueG_sunVe_T
typedef struct tag_sj19ixjie7IaXwfmTGGqueG sj19ixjie7IaXwfmTGGqueG_sunVe_T;
#endif /*typedef_sj19ixjie7IaXwfmTGGqueG_sunVe_T*/
#ifndef struct_tag_sA20pgyLLIq8SfspJg8FOE
#define struct_tag_sA20pgyLLIq8SfspJg8FOE
struct tag_sA20pgyLLIq8SfspJg8FOE
{
    real_T normals[18];
    real_T eff;
    real_T maxPower[6];
    real_T num;
};
#endif /*struct_tag_sA20pgyLLIq8SfspJg8FOE*/
#ifndef typedef_sA20pgyLLIq8SfspJg8FOE_sunVec_T
#define typedef_sA20pgyLLIq8SfspJg8FOE_sunVec_T
typedef struct tag_sA20pgyLLIq8SfspJg8FOE sA20pgyLLIq8SfspJg8FOE_sunVec_T;
#endif /*typedef_sA20pgyLLIq8SfspJg8FOE_sunVec_T*/
#ifndef struct_tag_szbjUbCytG2KulfT5U95QlH
#define struct_tag_szbjUbCytG2KulfT5U95QlH
struct tag_szbjUbCytG2KulfT5U95QlH
{
    real_T sample_time_s;
    sIBTDDhuBYfNAeo79QDCmwD_sunVe_T mag;
    s9rNe35jkRRfWm7JjlywTFE_sunVe_T gyro;
    sj19ixjie7IaXwfmTGGqueG_sunVe_T sun_sensor;
    sA20pgyLLIq8SfspJg8FOE_sunVec_T solar_panels;
    sceQFFiSPmohIdeDgtFqdpE_sunVe_T photodiodes;
};
#endif /*struct_tag_szbjUbCytG2KulfT5U95QlH*/
#ifndef typedef_szbjUbCytG2KulfT5U95QlH_sunVe_T
#define typedef_szbjUbCytG2KulfT5U95QlH_sunVe_T
typedef struct tag_szbjUbCytG2KulfT5U95QlH szbjUbCytG2KulfT5U95QlH_sunVe_T;
#endif /*typedef_szbjUbCytG2KulfT5U95QlH_sunVe_T*/
#ifndef struct_tag_ssK5aX4zO0nmmhVDh4dPLIF
#define struct_tag_ssK5aX4zO0nmmhVDh4dPLIF
struct tag_ssK5aX4zO0nmmhVDh4dPLIF
{
    sLzKJ90OEFWVMlbJOGyLlnC_sunVe_T convert;
    spGmOAiwOS7vBp2xejF5T2G_sunVe_T global;
    real_T id_r[3];
    real_T id_v[3];
    real_T id_q[4];
    real_T id_w[3];
};
#endif /*struct_tag_ssK5aX4zO0nmmhVDh4dPLIF*/
#ifndef typedef_ssK5aX4zO0nmmhVDh4dPLIF_sunVe_T
#define typedef_ssK5aX4zO0nmmhVDh4dPLIF_sunVe_T
typedef struct tag_ssK5aX4zO0nmmhVDh4dPLIF ssK5aX4zO0nmmhVDh4dPLIF_sunVe_T;
#endif /*typedef_ssK5aX4zO0nmmhVDh4dPLIF_sunVe_T*/
#ifndef struct_tag_sEAO8bRtW33jf3fQYqcxfRF
#define struct_tag_sEAO8bRtW33jf3fQYqcxfRF
struct tag_sEAO8bRtW33jf3fQYqcxfRF
{
    swJB8fTkF7wwrO8Zwm7vPlC_sunVe_T opts;
    real_T sample_time_s;
    ssK5aX4zO0nmmhVDh4dPLIF_sunVe_T constants;
    sYlGz1I8ACl8ul2Hkf7vUqG_sunVe_T scParams;
    s5PQwUmWHJ7buFPYC2ug8qD_sunVe_T initialConditions;
    real_T orbit_tle[9];
    s41Zm7keKZPaALhK3GA9CgF_sunVe_T time;
    sB337z0fL6GYO7sKWdgRIbD_sunVe_T solarPressure;
    sc3KIpYdgg88P9u61qch0BG_sunVe_T magField;
    s0DJgMNRecIhB2XPdiSPjmF_sunVe_T actuators;
    szbjUbCytG2KulfT5U95QlH_sunVe_T sensors;
};
#endif /*struct_tag_sEAO8bRtW33jf3fQYqcxfRF*/
#ifndef typedef_sEAO8bRtW33jf3fQYqcxfRF_sunVe_T
#define typedef_sEAO8bRtW33jf3fQYqcxfRF_sunVe_T
typedef struct tag_sEAO8bRtW33jf3fQYqcxfRF sEAO8bRtW33jf3fQYqcxfRF_sunVe_T;
#endif /*typedef_sEAO8bRtW33jf3fQYqcxfRF_sunVe_T*/

      
            /* Parameters (default storage) */
       typedef struct P_sunVector_test_T_ P_sunVector_test_T;
          /* Forward declaration for rtModel */
        typedef struct tag_RTM_sunVector_test_T RT_MODEL_sunVector_test_T;


  

  

  

  

  

  

  

  

  

  

  

    #endif /* RTW_HEADER_sunVector_test_types_h_ */
