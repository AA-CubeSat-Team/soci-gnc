#include "__cf_UnitTestDebug.h"
#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "UnitTestDebug_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "UnitTestDebug.h"
#include "UnitTestDebug_capi.h"
#include "UnitTestDebug_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 12 , TARGET_STRING
( "UnitTestDebug/MEKF_lib" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , {
1 , 12 , TARGET_STRING ( "UnitTestDebug/MEKF_lib" ) , TARGET_STRING ( "" ) ,
1 , 0 , 1 , 0 , 0 } , { 2 , 12 , TARGET_STRING ( "UnitTestDebug/MEKF_lib" ) ,
TARGET_STRING ( "" ) , 2 , 0 , 2 , 0 , 0 } , { 3 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib" ) , TARGET_STRING ( "" ) , 3 , 0 , 1 , 0 , 0 } , { 4
, 12 , TARGET_STRING ( "UnitTestDebug/MEKF_lib" ) , TARGET_STRING ( "" ) , 4
, 0 , 3 , 0 , 0 } , { 5 , 0 , TARGET_STRING ( "UnitTestDebug/Constant4" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 1 } , { 6 , 0 , TARGET_STRING (
"UnitTestDebug/Gain" ) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 7 , 0
, TARGET_STRING ( "UnitTestDebug/Gain1" ) , TARGET_STRING ( "" ) , 0 , 0 , 3
, 0 , 0 } , { 8 , 0 , TARGET_STRING ( "UnitTestDebug/Gain2" ) , TARGET_STRING
( "" ) , 0 , 0 , 3 , 0 , 0 } , { 9 , 0 , TARGET_STRING (
"UnitTestDebug/Gain3" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 10 ,
0 , TARGET_STRING ( "UnitTestDebug/Add" ) , TARGET_STRING ( "" ) , 0 , 0 , 1
, 0 , 0 } , { 11 , 0 , TARGET_STRING ( "UnitTestDebug/Sqrt" ) , TARGET_STRING
( "" ) , 0 , 0 , 3 , 0 , 0 } , { 12 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/flag_in" ) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0
} , { 13 , 12 , TARGET_STRING ( "UnitTestDebug/MEKF_lib/If Action Subsystem"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 14 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem1" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 0 } , { 15 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem1" ) , TARGET_STRING ( "" ) , 1 ,
0 , 2 , 0 , 0 } , { 16 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem1" ) , TARGET_STRING ( "" ) , 2 ,
0 , 1 , 0 , 0 } , { 17 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem2" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 0 } , { 18 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update" ) , TARGET_STRING ( "" ) , 0 , 0
, 3 , 0 , 0 } , { 19 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update" ) , TARGET_STRING ( "" ) , 0 , 0
, 3 , 0 , 0 } , { 20 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update" ) , TARGET_STRING ( "" ) , 0 , 0
, 3 , 0 , 0 } , { 21 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update" ) , TARGET_STRING ( "" ) , 0 , 0
, 3 , 0 , 0 } , { 22 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update" ) , TARGET_STRING ( "" ) , 1 , 0
, 2 , 0 , 0 } , { 23 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update" ) , TARGET_STRING ( "" ) , 2 , 0
, 1 , 0 , 0 } , { 24 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Bias Merge" ) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0
, 0 } , { 25 , 12 , TARGET_STRING ( "UnitTestDebug/MEKF_lib/P_plus merge" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 , 0 } , { 26 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/q_init Merge" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 ,
0 , 0 } , { 27 , 12 , TARGET_STRING ( "UnitTestDebug/MEKF_lib/q_plus merge" )
, TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 28 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Switches depending on if Gyro is offline " ) ,
TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 1 } , { 29 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Unit Delay2" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0
, 0 } , { 30 , 0 , TARGET_STRING ( "UnitTestDebug/Subsystem/OR" ) ,
TARGET_STRING ( "" ) , 0 , 1 , 3 , 0 , 0 } , { 31 , 0 , TARGET_STRING (
"UnitTestDebug/quat_propagation/Product" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 32 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem1/P_minus" ) , TARGET_STRING ( ""
) , 0 , 0 , 2 , 0 , 0 } , { 33 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem1/Bias_minus" ) , TARGET_STRING (
"" ) , 0 , 0 , 1 , 0 , 0 } , { 34 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem1/q_minus" ) , TARGET_STRING ( ""
) , 0 , 0 , 0 , 0 , 0 } , { 35 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem2/In1" ) , TARGET_STRING ( "" ) ,
0 , 0 , 0 , 0 , 0 } , { 36 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Updating Beta Bias " ) ,
TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 0 } , { 37 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Add" ) , TARGET_STRING ( "" )
, 0 , 0 , 2 , 0 , 0 } , { 38 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Sum" ) , TARGET_STRING (
"omega_estimate" ) , 0 , 0 , 1 , 0 , 0 } , { 39 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Multiplication/q0/Sum" ) , TARGET_STRING ( "" ) , 0
, 0 , 3 , 0 , 0 } , { 40 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Multiplication/q1/Sum" ) , TARGET_STRING ( "" ) , 0
, 0 , 3 , 0 , 0 } , { 41 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Multiplication/q2/Sum" ) , TARGET_STRING ( "" ) , 0
, 0 , 3 , 0 , 0 } , { 42 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Multiplication/q3/Sum" ) , TARGET_STRING ( "" ) , 0
, 0 , 3 , 0 , 0 } , { 43 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V1/Sum" ) , TARGET_STRING ( "" ) , 0 , 0 ,
3 , 0 , 0 } , { 44 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V2/Sum" ) , TARGET_STRING ( "" ) , 0 , 0 ,
3 , 0 , 0 } , { 45 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V3/Sum" ) , TARGET_STRING ( "" ) , 0 , 0 ,
3 , 0 , 0 } , { 46 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V1/Sum" ) , TARGET_STRING ( "" ) , 0 , 0
, 3 , 0 , 0 } , { 47 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V2/Sum" ) , TARGET_STRING ( "" ) , 0 , 0
, 3 , 0 , 0 } , { 48 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V3/Sum" ) , TARGET_STRING ( "" ) , 0 , 0
, 3 , 0 , 0 } , { 49 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V1/Sum" ) , TARGET_STRING ( "" ) , 0 , 0
, 3 , 0 , 0 } , { 50 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V2/Sum" ) , TARGET_STRING ( "" ) , 0 , 0
, 3 , 0 , 0 } , { 51 , 0 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V3/Sum" ) , TARGET_STRING ( "" ) , 0 , 0
, 3 , 0 , 0 } , { 52 , 0 , TARGET_STRING (
"UnitTestDebug/Subsystem/Compare To Constant/Compare" ) , TARGET_STRING ( ""
) , 0 , 1 , 3 , 0 , 1 } , { 53 , 0 , TARGET_STRING (
"UnitTestDebug/quat_propagation/Quaternion Normalize/Product" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 54 , 0 , TARGET_STRING (
"UnitTestDebug/quat_propagation/Quaternion Normalize/Product1" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 55 , 0 , TARGET_STRING (
"UnitTestDebug/quat_propagation/Quaternion Normalize/Product2" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 56 , 0 , TARGET_STRING (
"UnitTestDebug/quat_propagation/Quaternion Normalize/Product3" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 57 , 4 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/Passthrough"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 58 , 4 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/TRIAD " )
, TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 59 , 4 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/Logical Operator"
) , TARGET_STRING ( "" ) , 0 , 1 , 3 , 0 , 1 } , { 60 , 4 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/Merge" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 61 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Normalize/Product" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 62 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Normalize/Product1" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 63 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Normalize/Product2" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 64 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Normalize/Product3" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 65 , 8 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Horizontal Matrix Concatenate1"
) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 1 } , { 66 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Quaternion Normalize/Product"
) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 67 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Quaternion Normalize/Product1"
) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 68 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Quaternion Normalize/Product2"
) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 69 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Quaternion Normalize/Product3"
) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 } , { 70 , 12 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Subsystem/Identity Matrix" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 5 , 0 , 2 } , { 71 , 4 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/Passthrough/quat_old"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 72 , 3 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/TRIAD /Matrix Concatenate"
) , TARGET_STRING ( "" ) , 0 , 0 , 5 , 0 , 1 } , { 0 , 0 , ( NULL ) , ( NULL
) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_BlockParameters
rtBlockParameters [ ] = { { 73 , TARGET_STRING ( "UnitTestDebug/Constant" ) ,
TARGET_STRING ( "Value" ) , 0 , 6 , 0 } , { 74 , TARGET_STRING (
"UnitTestDebug/Constant1" ) , TARGET_STRING ( "Value" ) , 0 , 6 , 0 } , { 75
, TARGET_STRING ( "UnitTestDebug/Constant10" ) , TARGET_STRING ( "Value" ) ,
0 , 3 , 0 } , { 76 , TARGET_STRING ( "UnitTestDebug/Constant2" ) ,
TARGET_STRING ( "Value" ) , 0 , 6 , 0 } , { 77 , TARGET_STRING (
"UnitTestDebug/Constant3" ) , TARGET_STRING ( "Value" ) , 0 , 6 , 0 } , { 78
, TARGET_STRING ( "UnitTestDebug/Constant4" ) , TARGET_STRING ( "Value" ) , 0
, 6 , 0 } , { 79 , TARGET_STRING ( "UnitTestDebug/Constant5" ) ,
TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 80 , TARGET_STRING (
"UnitTestDebug/Constant6" ) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 81
, TARGET_STRING ( "UnitTestDebug/Constant7" ) , TARGET_STRING ( "Value" ) , 0
, 3 , 0 } , { 82 , TARGET_STRING ( "UnitTestDebug/Constant8" ) ,
TARGET_STRING ( "Value" ) , 0 , 6 , 0 } , { 83 , TARGET_STRING (
"UnitTestDebug/Constant9" ) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 84
, TARGET_STRING ( "UnitTestDebug/Gain" ) , TARGET_STRING ( "Gain" ) , 0 , 3 ,
0 } , { 85 , TARGET_STRING ( "UnitTestDebug/Gain1" ) , TARGET_STRING ( "Gain"
) , 0 , 3 , 0 } , { 86 , TARGET_STRING ( "UnitTestDebug/Gain2" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 87 , TARGET_STRING (
"UnitTestDebug/Gain3" ) , TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 88 ,
TARGET_STRING ( "UnitTestDebug/Random Number" ) , TARGET_STRING ( "Mean" ) ,
0 , 3 , 0 } , { 89 , TARGET_STRING ( "UnitTestDebug/Random Number" ) ,
TARGET_STRING ( "StdDev" ) , 0 , 6 , 0 } , { 90 , TARGET_STRING (
"UnitTestDebug/Random Number" ) , TARGET_STRING ( "Seed" ) , 0 , 3 , 0 } , {
91 , TARGET_STRING ( "UnitTestDebug/Random Number1" ) , TARGET_STRING (
"Mean" ) , 0 , 3 , 0 } , { 92 , TARGET_STRING (
"UnitTestDebug/Random Number1" ) , TARGET_STRING ( "StdDev" ) , 0 , 6 , 0 } ,
{ 93 , TARGET_STRING ( "UnitTestDebug/Random Number1" ) , TARGET_STRING (
"Seed" ) , 0 , 3 , 0 } , { 94 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Angular Velo " ) , TARGET_STRING ( "InitialOutput" )
, 0 , 3 , 0 } , { 95 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/3Sigma Bounds " ) , TARGET_STRING ( "InitialOutput" )
, 0 , 3 , 0 } , { 96 , TARGET_STRING ( "UnitTestDebug/MEKF_lib/flag_out" ) ,
TARGET_STRING ( "InitialOutput" ) , 0 , 3 , 0 } , { 97 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Constant" ) , TARGET_STRING ( "Value" ) , 0 , 6 , 0 }
, { 98 , TARGET_STRING ( "UnitTestDebug/MEKF_lib/Bias Merge" ) ,
TARGET_STRING ( "InitialOutput" ) , 0 , 3 , 0 } , { 99 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/P_plus merge" ) , TARGET_STRING ( "InitialOutput" ) ,
0 , 3 , 0 } , { 100 , TARGET_STRING ( "UnitTestDebug/MEKF_lib/q_plus merge" )
, TARGET_STRING ( "InitialOutput" ) , 0 , 3 , 0 } , { 101 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Switches depending on if Gyro is offline " ) ,
TARGET_STRING ( "Threshold" ) , 0 , 3 , 0 } , { 102 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Unit Delay2" ) , TARGET_STRING ( "InitialCondition" )
, 0 , 0 , 0 } , { 103 , TARGET_STRING (
"UnitTestDebug/Subsystem/Compare To Constant" ) , TARGET_STRING ( "const" ) ,
1 , 3 , 0 } , { 104 , TARGET_STRING ( "UnitTestDebug/Subsystem/Memory" ) ,
TARGET_STRING ( "InitialCondition" ) , 1 , 3 , 0 } , { 105 , TARGET_STRING (
"UnitTestDebug/quat_propagation/Discrete-Time Integrator" ) , TARGET_STRING (
"gainval" ) , 0 , 3 , 0 } , { 106 , TARGET_STRING (
"UnitTestDebug/quat_propagation/Discrete-Time Integrator" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 107 , TARGET_STRING (
"UnitTestDebug/quat_propagation/Gain1" ) , TARGET_STRING ( "Gain" ) , 0 , 3 ,
0 } , { 108 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/ Decides q_est init Requirement /Constant1" ) ,
TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 109 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/ Decides q_est init Requirement /Unit Delay2" ) ,
TARGET_STRING ( "InitialCondition" ) , 0 , 3 , 0 } , { 110 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V1/Constant" ) , TARGET_STRING ( "Value" )
, 0 , 3 , 0 } , { 111 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V1/Gain" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 112 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V1/Gain1" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 113 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V1/Gain2" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 114 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V2/Constant" ) , TARGET_STRING ( "Value" )
, 0 , 3 , 0 } , { 115 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V2/Gain" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 116 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V2/Gain1" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 117 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V2/Gain2" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 118 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V3/Constant" ) , TARGET_STRING ( "Value" )
, 0 , 3 , 0 } , { 119 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V3/Gain" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 120 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V3/Gain1" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 121 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation/V3/Gain2" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 122 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V1/Constant" ) , TARGET_STRING ( "Value"
) , 0 , 3 , 0 } , { 123 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V1/Gain" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 124 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V1/Gain1" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 125 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V1/Gain2" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 126 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V2/Constant" ) , TARGET_STRING ( "Value"
) , 0 , 3 , 0 } , { 127 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V2/Gain" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 128 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V2/Gain1" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 129 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V2/Gain2" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 130 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V3/Constant" ) , TARGET_STRING ( "Value"
) , 0 , 3 , 0 } , { 131 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V3/Gain" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 132 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V3/Gain1" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 133 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation1/V3/Gain2" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 134 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V1/Constant" ) , TARGET_STRING ( "Value"
) , 0 , 3 , 0 } , { 135 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V1/Gain" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 136 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V1/Gain1" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 137 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V1/Gain2" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 138 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V2/Constant" ) , TARGET_STRING ( "Value"
) , 0 , 3 , 0 } , { 139 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V2/Gain" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 140 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V2/Gain1" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 141 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V2/Gain2" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 142 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V3/Constant" ) , TARGET_STRING ( "Value"
) , 0 , 3 , 0 } , { 143 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V3/Gain" ) , TARGET_STRING ( "Gain" ) , 0
, 3 , 0 } , { 144 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V3/Gain1" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 145 , TARGET_STRING (
"UnitTestDebug/Quaternion Rotation2/V3/Gain2" ) , TARGET_STRING ( "Gain" ) ,
0 , 3 , 0 } , { 146 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/Merge" ) ,
TARGET_STRING ( "InitialOutput" ) , 0 , 3 , 0 } , { 147 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Constant1" ) ,
TARGET_STRING ( "Value" ) , 0 , 5 , 0 } , { 148 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Constant2" ) ,
TARGET_STRING ( "Value" ) , 0 , 5 , 0 } , { 149 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/make Xi(q)/Gain" ) , TARGET_STRING
( "Gain" ) , 0 , 3 , 0 } , { 150 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/make Xi(q)/Gain1" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 151 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/make Xi(q)/Gain2" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 152 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/make Xi(q)/Gain3" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 153 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/make Xi(q)/Gain4" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 154 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/make Xi(q)/Gain5" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 155 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/make Xi(q)/Gain6" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 156 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_Product_matrix/Constant1"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 157 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_Product_matrix/Constant2"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 158 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_Product_matrix/Constant3"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 159 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_Product_matrix/Gain" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 160 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_Product_matrix/Gain1" )
, TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 161 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_Product_matrix/Gain3" )
, TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 162 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_product_matrix/Constant1"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 163 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_product_matrix/Constant2"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 164 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_product_matrix/Constant3"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 165 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_product_matrix/Gain" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 166 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_product_matrix/Gain1" )
, TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 167 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Cross_product_matrix/Gain3" )
, TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 168 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Subsystem/Constant" ) ,
TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 169 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Subsystem/Gain" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 170 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/TRIAD /Normalization"
) , TARGET_STRING ( "Bias" ) , 0 , 3 , 0 } , { 171 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/TRIAD /Normalization1"
) , TARGET_STRING ( "Bias" ) , 0 , 3 , 0 } , { 172 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/TRIAD /Normalization2"
) , TARGET_STRING ( "Bias" ) , 0 , 3 , 0 } , { 173 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/TRIAD /Normalization3"
) , TARGET_STRING ( "Bias" ) , 0 , 3 , 0 } , { 174 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/TRIAD /Normalization4"
) , TARGET_STRING ( "Bias" ) , 0 , 3 , 0 } , { 175 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/If Action Subsystem/TRIAD_coarse_estimator/TRIAD /Normalization5"
) , TARGET_STRING ( "Bias" ) , 0 , 3 , 0 } , { 176 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V1/Constant" )
, TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 177 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V1/Gain" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 178 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V1/Gain1" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 179 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V1/Gain2" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 180 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V2/Constant" )
, TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 181 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V2/Gain" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 182 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V2/Gain1" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 183 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V2/Gain2" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 184 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V3/Constant" )
, TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 185 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V3/Gain" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 186 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V3/Gain1" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 187 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation/V3/Gain2" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 188 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V1/Constant"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 189 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V1/Gain" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 190 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V1/Gain1" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 191 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V1/Gain2" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 192 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V2/Constant"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 193 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V2/Gain" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 194 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V2/Gain1" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 195 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V2/Gain2" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 196 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V3/Constant"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 197 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V3/Gain" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 198 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V3/Gain1" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 199 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Measurement Update/Quaternion Rotation1/V3/Gain2" ) ,
TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 200 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix2/Constant1"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 201 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix2/Constant2"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 202 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix2/Constant3"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 203 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix2/Gain1"
) , TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 204 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix2/Gain3"
) , TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 205 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix2/Gain4"
) , TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 206 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix3/Constant1"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 207 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix3/Constant2"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 208 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix3/Constant3"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 209 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix3/Gain1"
) , TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 210 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix3/Gain3"
) , TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 211 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Measurement Update/Subsystem/Cross_product_matrix3/Gain4"
) , TARGET_STRING ( "Gain" ) , 0 , 3 , 0 } , { 212 , TARGET_STRING (
"UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Psi/If Action Subsystem/Constant"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 213 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Psi/If Action Subsystem1/Constant"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 214 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Psi/If Action Subsystem1/Constant1"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 215 , TARGET_STRING (
 "UnitTestDebug/MEKF_lib/Time Propagation (q,P)/Psi/If Action Subsystem1/Constant2"
) , TARGET_STRING ( "Value" ) , 0 , 3 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 ,
0 , 0 } } ; static const rtwCAPI_ModelParameters rtModelParameters [ ] = { {
216 , TARGET_STRING ( "fswParams" ) , 18 , 3 , 0 } , { 0 , ( NULL ) , 0 , 0 ,
0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . obpruepjlb [ 0 ] , & rtB .
chwubaiywm [ 0 ] , & rtB . mqrllrhknp [ 0 ] , & rtB . nt5aet3d3s [ 0 ] , &
rtB . c1klcpas2f , & rtB . lhspd1b5b3 [ 0 ] , & rtB . cuhw0sczh3 , & rtB .
ifm2ensjiv , & rtB . gz2mbgxqth , & rtB . dgj40kd3c4 [ 0 ] , & rtB .
jzkvyvyuee [ 0 ] , & rtB . ps1qixq3zf , & rtB . c1klcpas2f , & rtB .
k3ljcleoid [ 0 ] , & rtB . obpruepjlb [ 0 ] , & rtB . mqrllrhknp [ 0 ] , &
rtB . nt5aet3d3s [ 0 ] , & rtB . k3ljcleoid [ 0 ] , & rtB . obpruepjlb [ 0 ]
, ( ( & rtB . obpruepjlb [ 0 ] ) + 1 ) , ( ( & rtB . obpruepjlb [ 0 ] ) + 2 )
, ( ( & rtB . obpruepjlb [ 0 ] ) + 3 ) , & rtB . mqrllrhknp [ 0 ] , & rtB .
nt5aet3d3s [ 0 ] , & rtB . nt5aet3d3s [ 0 ] , & rtB . mqrllrhknp [ 0 ] , &
rtB . k3ljcleoid [ 0 ] , & rtB . obpruepjlb [ 0 ] , & rtB . es152orfgm [ 0 ]
, & rtB . mxfdp2ltan [ 0 ] , & rtB . dlusutdiez , & rtB . gbtlnwgalm [ 0 ] ,
& rtB . mqrllrhknp [ 0 ] , & rtB . nt5aet3d3s [ 0 ] , & rtB . obpruepjlb [ 0
] , & rtB . k3ljcleoid [ 0 ] , & rtB . nt5aet3d3s [ 0 ] , & rtB . ida2tctgp2
[ 0 ] , & rtB . chwubaiywm [ 0 ] , & rtB . b3z40kptxq , & rtB . hlzyk2zeiu ,
& rtB . jnsdiecjvo , & rtB . dmo32unafg , & rtB . h1pvfyoead , & rtB .
k3ubjuj4xo , & rtB . bwa10aik04 , & rtB . ohsor4jyhe , & rtB . fd5wmraa51 , &
rtB . kehzuzhs35 , & rtB . fj45fplo2h , & rtB . i0j31orab3 , & rtB .
fzubazngl3 , & rtB . p0unimm1k0 , & rtB . l33vh4jdca , & rtB . dejmsjiytm , &
rtB . evb2ami2f5 , & rtB . bzlumtv1jw , & rtB . loo5xvtgsh [ 0 ] , & rtB .
loo5xvtgsh [ 0 ] , & rtB . of1r505p3n , & rtB . loo5xvtgsh [ 0 ] , & rtB .
obpruepjlb [ 0 ] , ( ( & rtB . obpruepjlb [ 0 ] ) + 1 ) , ( ( & rtB .
obpruepjlb [ 0 ] ) + 2 ) , ( ( & rtB . obpruepjlb [ 0 ] ) + 3 ) , & rtB .
edjk3wh4gd [ 0 ] , & rtB . ee30l0u33u , & rtB . i1fwhqeosf , & rtB .
fzvlmbe2x0 , & rtB . mh2krcrgw3 , & rtB . epk34rzqnu [ 0 ] , & rtB .
loo5xvtgsh [ 0 ] , & rtB . igtrb0xxov [ 0 ] , & rtP .
Constant_Value_gxmqunm0u0 [ 0 ] , & rtP . Constant1_Value_kpkyenjwdq [ 0 ] ,
& rtP . Constant10_Value , & rtP . Constant2_Value_chs5tmnkek [ 0 ] , & rtP .
Constant3_Value_b1f4zjlmmk [ 0 ] , & rtP . Constant4_Value [ 0 ] , & rtP .
Constant5_Value , & rtP . Constant6_Value , & rtP . Constant7_Value , & rtP .
Constant8_Value [ 0 ] , & rtP . Constant9_Value , & rtP .
Gain_Gain_efmbe4yoj3 , & rtP . Gain1_Gain_dwko2h5myg , & rtP .
Gain2_Gain_dndn2znysv , & rtP . Gain3_Gain_g31whpxaxh , & rtP .
RandomNumber_Mean , & rtP . RandomNumber_StdDev [ 0 ] , & rtP .
RandomNumber_Seed , & rtP . RandomNumber1_Mean , & rtP . RandomNumber1_StdDev
[ 0 ] , & rtP . RandomNumber1_Seed , & rtP . AngularVelo_Y0 , & rtP .
uSigmaBounds_Y0 , & rtP . flag_out_Y0 , & rtP . Constant_Value_jdndcrmtkc [ 0
] , & rtP . BiasMerge_InitialOutput , & rtP . P_plusmerge_InitialOutput , &
rtP . q_plusmerge_InitialOutput , & rtP .
SwitchesdependingonifGyroisoffline_Threshold , & rtP .
UnitDelay2_InitialCondition_e5yh3e2aq2 [ 0 ] , & rtP .
CompareToConstant_const , & rtP . Memory_InitialCondition , & rtP .
DiscreteTimeIntegrator_gainval , & rtP . DiscreteTimeIntegrator_IC [ 0 ] , &
rtP . Gain1_Gain_mgka3jhv0b , & rtP . Constant1_Value_jmutz103sv , & rtP .
UnitDelay2_InitialCondition , & rtP . Constant_Value_otz3nmwoqv , & rtP .
Gain_Gain_klyu41lrfn , & rtP . Gain1_Gain_diuflnffrx , & rtP .
Gain2_Gain_cnsd3b5ouu , & rtP . Constant_Value_gztnxshksk , & rtP .
Gain_Gain_jhze2kqkab , & rtP . Gain1_Gain_mcq3nfgl5y , & rtP .
Gain2_Gain_no1j2ourve , & rtP . Constant_Value_jc32hza5ok , & rtP .
Gain_Gain_d3m0eipbk4 , & rtP . Gain1_Gain_eukkukzdsc , & rtP .
Gain2_Gain_aqxl3lkkkb , & rtP . Constant_Value_ong43hwtad , & rtP .
Gain_Gain_chibgsrp3r , & rtP . Gain1_Gain_iwfebhm2do , & rtP .
Gain2_Gain_eugrs2j5w1 , & rtP . Constant_Value_hf4lqdwccu , & rtP .
Gain_Gain_ag0mpz4kyf , & rtP . Gain1_Gain_denqfwp1iw , & rtP .
Gain2_Gain_pdua0qf4rh , & rtP . Constant_Value_imftmnjmib , & rtP .
Gain_Gain_iiknapd0gg , & rtP . Gain1_Gain_hi2t442oxb , & rtP .
Gain2_Gain_k4jcurr4zm , & rtP . Constant_Value_e04ikljkmv , & rtP .
Gain_Gain_bhwu5bylct , & rtP . Gain1_Gain_ppz2nua2un , & rtP .
Gain2_Gain_op03fmkcim , & rtP . Constant_Value_b41hk0kxkh , & rtP .
Gain_Gain_ovw33ojfgh , & rtP . Gain1_Gain_dsq2lkmbcs , & rtP .
Gain2_Gain_flvppo5uo3 , & rtP . Constant_Value_oc2s014i34 , & rtP .
Gain_Gain_irsqnwliiv , & rtP . Gain1_Gain_jwm5cb1c12 , & rtP .
Gain2_Gain_if0kcnigpw , & rtP . Merge_InitialOutput , & rtP .
Constant1_Value_c2dxafuacz [ 0 ] , & rtP . Constant2_Value_i4dkrdfott [ 0 ] ,
& rtP . Gain_Gain_d2ee5bjups , & rtP . Gain1_Gain_gukw2z34vg , & rtP .
Gain2_Gain_fd1hdrny0i , & rtP . Gain3_Gain_df4fissmij , & rtP .
Gain4_Gain_jqdgqgtsq5 , & rtP . Gain5_Gain , & rtP . Gain6_Gain , & rtP .
Constant1_Value_h0nyb23dyo , & rtP . Constant2_Value_enlht0un1m , & rtP .
Constant3_Value_guvepryqpw , & rtP . Gain_Gain_izh1wtguao , & rtP .
Gain1_Gain_nitzlnqw2a , & rtP . Gain3_Gain_l235frcyp2 , & rtP .
Constant1_Value_f35hg154j0 , & rtP . Constant2_Value_e5s0xhvsmx , & rtP .
Constant3_Value_b5l2r3ghc5 , & rtP . Gain_Gain_ddqwqhx5tx , & rtP .
Gain1_Gain_ly5pvjnqag , & rtP . Gain3_Gain_enevc5eimy , & rtP .
Constant_Value_ib2ewpsxpl , & rtP . Gain_Gain_mumivssi3t , & rtP .
Normalization_Bias , & rtP . Normalization1_Bias , & rtP .
Normalization2_Bias , & rtP . Normalization3_Bias , & rtP .
Normalization4_Bias , & rtP . Normalization5_Bias , & rtP . Constant_Value ,
& rtP . Gain_Gain , & rtP . Gain1_Gain , & rtP . Gain2_Gain , & rtP .
Constant_Value_l5mn50z5cq , & rtP . Gain_Gain_pi5uhcql0z , & rtP .
Gain1_Gain_fhzwrqpxwn , & rtP . Gain2_Gain_a5r1lslwra , & rtP .
Constant_Value_lrvooetugt , & rtP . Gain_Gain_lliryqv0lr , & rtP .
Gain1_Gain_jqcyn3sr2w , & rtP . Gain2_Gain_gplc4ydenu , & rtP .
Constant_Value_c5k4awpww5 , & rtP . Gain_Gain_igquidva0x , & rtP .
Gain1_Gain_gutlcr5n0l , & rtP . Gain2_Gain_lxqqvcp1dv , & rtP .
Constant_Value_ecblqlsacg , & rtP . Gain_Gain_ivgqmscmom , & rtP .
Gain1_Gain_erhzz1d1jc , & rtP . Gain2_Gain_a5mzwuqcxa , & rtP .
Constant_Value_iqmtoqh2vp , & rtP . Gain_Gain_m4fytnehbd , & rtP .
Gain1_Gain_nlppff24em , & rtP . Gain2_Gain_dnlg4rbf3l , & rtP .
Constant1_Value , & rtP . Constant2_Value , & rtP . Constant3_Value , & rtP .
Gain1_Gain_eay2spzcgy , & rtP . Gain3_Gain , & rtP . Gain4_Gain , & rtP .
Constant1_Value_gywsazy05k , & rtP . Constant2_Value_ht5ssv34ga , & rtP .
Constant3_Value_ftknmtr0cr , & rtP . Gain1_Gain_hinlh1vqa3 , & rtP .
Gain3_Gain_ebexp5cpru , & rtP . Gain4_Gain_jsw1usbw51 , & rtP .
Constant_Value_adgfdn1zan , & rtP . Constant_Value_hteor4a5kn , & rtP .
Constant1_Value_buy3qqwwhi , & rtP . Constant2_Value_lzwp0qxwab , & rtP .
fswParams , } ; static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 } , {
"unsigned char" , "boolean_T" , 0 , 0 , sizeof ( boolean_T ) , SS_BOOLEAN , 0
, 0 } , { "struct" , "struct_ty10kkX2qfxaFZ5ZM3ZHyG" , 12 , 1 , sizeof (
struct_ty10kkX2qfxaFZ5ZM3ZHyG ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_E5m6pVGpMUCQICNWvvJYVD" , 5 , 13 , sizeof (
struct_E5m6pVGpMUCQICNWvvJYVD ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_TOo86xfEEzLUMQL1cJ6i4F" , 6 , 18 , sizeof (
struct_TOo86xfEEzLUMQL1cJ6i4F ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_aWpGGhIuows0R6KCHlyCw" , 13 , 24 , sizeof (
struct_aWpGGhIuows0R6KCHlyCw ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_9Y7NpmKix1IG4oH8KKEfiF" , 9 , 37 , sizeof (
struct_9Y7NpmKix1IG4oH8KKEfiF ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_Sy3TE4WEbvVfR4tJReRWfD" , 19 , 46 , sizeof (
struct_Sy3TE4WEbvVfR4tJReRWfD ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_bAwhF0jhe8CAuqzSl58dcD" , 15 , 65 , sizeof (
struct_bAwhF0jhe8CAuqzSl58dcD ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_w7aMc9U4emvM2kACBtRHPE" , 3 , 80 , sizeof (
struct_w7aMc9U4emvM2kACBtRHPE ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_9OHKL3KkhSMVqS2TKD32KD" , 11 , 83 , sizeof (
struct_9OHKL3KkhSMVqS2TKD32KD ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_J2UklKDOwboHskfNE7JQOD" , 1 , 94 , sizeof (
struct_J2UklKDOwboHskfNE7JQOD ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_4mAysgmjVCepNgQ3iGFExC" , 18 , 95 , sizeof (
struct_4mAysgmjVCepNgQ3iGFExC ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_U12upH4rVNUTnf5woIw8YH" , 3 , 113 , sizeof (
struct_U12upH4rVNUTnf5woIw8YH ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_RVC8XrLuWshpvAM0OkFvt" , 6 , 116 , sizeof (
struct_RVC8XrLuWshpvAM0OkFvt ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_lvNRa0gCEJ8LerTxVHRCcF" , 4 , 122 , sizeof (
struct_lvNRa0gCEJ8LerTxVHRCcF ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_z5tOVs4XZJ8tZ1LnGwJNlH" , 14 , 126 , sizeof (
struct_z5tOVs4XZJ8tZ1LnGwJNlH ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_ICucPnOOJJLn3xbs96EvuF" , 7 , 140 , sizeof (
struct_ICucPnOOJJLn3xbs96EvuF ) , SS_STRUCT , 0 , 0 } , { "struct" ,
"struct_3DKGR4n2ovZKiw3p2jOVcH" , 7 , 147 , sizeof (
struct_3DKGR4n2ovZKiw3p2jOVcH ) , SS_STRUCT , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , { "M2KM" , rt_offsetof ( struct_ty10kkX2qfxaFZ5ZM3ZHyG , M2KM )
, 0 , 7 , 0 } , { "KM2M" , rt_offsetof ( struct_ty10kkX2qfxaFZ5ZM3ZHyG , KM2M
) , 0 , 7 , 0 } , { "DEG2RAD" , rt_offsetof ( struct_ty10kkX2qfxaFZ5ZM3ZHyG ,
DEG2RAD ) , 0 , 7 , 0 } , { "RAD2DEG" , rt_offsetof (
struct_ty10kkX2qfxaFZ5ZM3ZHyG , RAD2DEG ) , 0 , 7 , 0 } , { "DAY2SEC" ,
rt_offsetof ( struct_ty10kkX2qfxaFZ5ZM3ZHyG , DAY2SEC ) , 0 , 7 , 0 } , {
"SEC2DAY" , rt_offsetof ( struct_ty10kkX2qfxaFZ5ZM3ZHyG , SEC2DAY ) , 0 , 7 ,
0 } , { "RPS2RPM" , rt_offsetof ( struct_ty10kkX2qfxaFZ5ZM3ZHyG , RPS2RPM ) ,
0 , 7 , 0 } , { "RPM2RPS" , rt_offsetof ( struct_ty10kkX2qfxaFZ5ZM3ZHyG ,
RPM2RPS ) , 0 , 7 , 0 } , { "AU2KM" , rt_offsetof (
struct_ty10kkX2qfxaFZ5ZM3ZHyG , AU2KM ) , 0 , 7 , 0 } , { "nT2T" ,
rt_offsetof ( struct_ty10kkX2qfxaFZ5ZM3ZHyG , nT2T ) , 0 , 7 , 0 } , {
"HR2SEC" , rt_offsetof ( struct_ty10kkX2qfxaFZ5ZM3ZHyG , HR2SEC ) , 0 , 7 , 0
} , { "SEC2HR" , rt_offsetof ( struct_ty10kkX2qfxaFZ5ZM3ZHyG , SEC2HR ) , 0 ,
7 , 0 } , { "w_earth_rads" , rt_offsetof ( struct_E5m6pVGpMUCQICNWvvJYVD ,
w_earth_rads ) , 0 , 1 , 0 } , { "mu_earth_km3s2" , rt_offsetof (
struct_E5m6pVGpMUCQICNWvvJYVD , mu_earth_km3s2 ) , 0 , 7 , 0 } , {
"r_earth_km" , rt_offsetof ( struct_E5m6pVGpMUCQICNWvvJYVD , r_earth_km ) , 0
, 7 , 0 } , { "JDJ2000" , rt_offsetof ( struct_E5m6pVGpMUCQICNWvvJYVD ,
JDJ2000 ) , 0 , 7 , 0 } , { "reorientation_controller_threshold" ,
rt_offsetof ( struct_E5m6pVGpMUCQICNWvvJYVD ,
reorientation_controller_threshold ) , 0 , 7 , 0 } , { "convert" ,
rt_offsetof ( struct_TOo86xfEEzLUMQL1cJ6i4F , convert ) , 2 , 7 , 0 } , {
"global" , rt_offsetof ( struct_TOo86xfEEzLUMQL1cJ6i4F , global ) , 3 , 7 , 0
} , { "id_r" , rt_offsetof ( struct_TOo86xfEEzLUMQL1cJ6i4F , id_r ) , 0 , 8 ,
0 } , { "id_v" , rt_offsetof ( struct_TOo86xfEEzLUMQL1cJ6i4F , id_v ) , 0 , 8
, 0 } , { "id_q" , rt_offsetof ( struct_TOo86xfEEzLUMQL1cJ6i4F , id_q ) , 0 ,
9 , 0 } , { "id_w" , rt_offsetof ( struct_TOo86xfEEzLUMQL1cJ6i4F , id_w ) , 0
, 8 , 0 } , { "z_len" , rt_offsetof ( struct_aWpGGhIuows0R6KCHlyCw , z_len )
, 0 , 7 , 0 } , { "x_len" , rt_offsetof ( struct_aWpGGhIuows0R6KCHlyCw ,
x_len ) , 0 , 7 , 0 } , { "y_len" , rt_offsetof (
struct_aWpGGhIuows0R6KCHlyCw , y_len ) , 0 , 7 , 0 } , { "m_3u" , rt_offsetof
( struct_aWpGGhIuows0R6KCHlyCw , m_3u ) , 0 , 7 , 0 } , { "xB_dir" ,
rt_offsetof ( struct_aWpGGhIuows0R6KCHlyCw , xB_dir ) , 0 , 8 , 0 } , {
"yB_dir" , rt_offsetof ( struct_aWpGGhIuows0R6KCHlyCw , yB_dir ) , 0 , 8 , 0
} , { "zB_dir" , rt_offsetof ( struct_aWpGGhIuows0R6KCHlyCw , zB_dir ) , 0 ,
8 , 0 } , { "J" , rt_offsetof ( struct_aWpGGhIuows0R6KCHlyCw , J ) , 0 , 5 ,
0 } , { "point_of_pressure" , rt_offsetof ( struct_aWpGGhIuows0R6KCHlyCw ,
point_of_pressure ) , 0 , 1 , 0 } , { "CD" , rt_offsetof (
struct_aWpGGhIuows0R6KCHlyCw , CD ) , 0 , 7 , 0 } , { "Ax" , rt_offsetof (
struct_aWpGGhIuows0R6KCHlyCw , Ax ) , 0 , 7 , 0 } , { "Ay" , rt_offsetof (
struct_aWpGGhIuows0R6KCHlyCw , Ay ) , 0 , 7 , 0 } , { "Az" , rt_offsetof (
struct_aWpGGhIuows0R6KCHlyCw , Az ) , 0 , 7 , 0 } , { "rpm" , rt_offsetof (
struct_9Y7NpmKix1IG4oH8KKEfiF , rpm ) , 0 , 10 , 0 } , { "radps" ,
rt_offsetof ( struct_9Y7NpmKix1IG4oH8KKEfiF , radps ) , 0 , 10 , 0 } , {
"momentum" , rt_offsetof ( struct_9Y7NpmKix1IG4oH8KKEfiF , momentum ) , 0 ,
10 , 0 } , { "body_momentum" , rt_offsetof ( struct_9Y7NpmKix1IG4oH8KKEfiF ,
body_momentum ) , 0 , 1 , 0 } , { "power_W" , rt_offsetof (
struct_9Y7NpmKix1IG4oH8KKEfiF , power_W ) , 0 , 10 , 0 } , { "torque_Nm" ,
rt_offsetof ( struct_9Y7NpmKix1IG4oH8KKEfiF , torque_Nm ) , 0 , 10 , 0 } , {
"body_torque_Nm" , rt_offsetof ( struct_9Y7NpmKix1IG4oH8KKEfiF ,
body_torque_Nm ) , 0 , 1 , 0 } , { "rt1" , rt_offsetof (
struct_9Y7NpmKix1IG4oH8KKEfiF , rt1 ) , 0 , 7 , 0 } , { "deriv1" ,
rt_offsetof ( struct_9Y7NpmKix1IG4oH8KKEfiF , deriv1 ) , 0 , 7 , 0 } , {
"num_wheels" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , num_wheels ) , 0
, 7 , 0 } , { "sample_time_s" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD ,
sample_time_s ) , 0 , 7 , 0 } , { "inertia" , rt_offsetof (
struct_Sy3TE4WEbvVfR4tJReRWfD , inertia ) , 0 , 10 , 0 } , { "time_cnst" ,
rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , time_cnst ) , 0 , 10 , 0 } , {
"max_RPM" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , max_RPM ) , 0 , 7 ,
0 } , { "max_RADPS" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , max_RADPS
) , 0 , 7 , 0 } , { "visc_fric" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD
, visc_fric ) , 0 , 7 , 0 } , { "torque_cnst" , rt_offsetof (
struct_Sy3TE4WEbvVfR4tJReRWfD , torque_cnst ) , 0 , 7 , 0 } , { "delay" ,
rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , delay ) , 0 , 7 , 0 } , {
"resistance" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , resistance ) , 0
, 7 , 0 } , { "inductance" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD ,
inductance ) , 0 , 7 , 0 } , { "inertia_matrix" , rt_offsetof (
struct_Sy3TE4WEbvVfR4tJReRWfD , inertia_matrix ) , 0 , 11 , 0 } , {
"inv_inertia_matrix" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD ,
inv_inertia_matrix ) , 0 , 11 , 0 } , { "dc_voltage" , rt_offsetof (
struct_Sy3TE4WEbvVfR4tJReRWfD , dc_voltage ) , 0 , 7 , 0 } , { "cant_angle" ,
rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , cant_angle ) , 0 , 7 , 0 } , {
"max_torque_Nm" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , max_torque_Nm
) , 0 , 7 , 0 } , { "Aw" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , Aw )
, 0 , 11 , 0 } , { "iAw" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , iAw
) , 0 , 11 , 0 } , { "ic" , rt_offsetof ( struct_Sy3TE4WEbvVfR4tJReRWfD , ic
) , 6 , 7 , 0 } , { "normals" , rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD ,
normals ) , 0 , 12 , 0 } , { "n_coils" , rt_offsetof (
struct_bAwhF0jhe8CAuqzSl58dcD , n_coils ) , 0 , 1 , 0 } , { "tot_coils" ,
rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD , tot_coils ) , 0 , 7 , 0 } , {
"id_x" , rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD , id_x ) , 0 , 13 , 0 }
, { "id_y" , rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD , id_y ) , 0 , 13 ,
0 } , { "id_z" , rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD , id_z ) , 0 , 7
, 0 } , { "dipoles_Am2" , rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD ,
dipoles_Am2 ) , 0 , 1 , 0 } , { "dipole_max_Am2" , rt_offsetof (
struct_bAwhF0jhe8CAuqzSl58dcD , dipole_max_Am2 ) , 0 , 1 , 0 } , { "voltage"
, rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD , voltage ) , 0 , 1 , 0 } , {
"max_current" , rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD , max_current ) ,
0 , 1 , 0 } , { "P_max_W" , rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD ,
P_max_W ) , 0 , 1 , 0 } , { "dc_max" , rt_offsetof (
struct_bAwhF0jhe8CAuqzSl58dcD , dc_max ) , 0 , 7 , 0 } , { "m_2_dc" ,
rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD , m_2_dc ) , 0 , 1 , 0 } , {
"dc_2_m" , rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD , dc_2_m ) , 0 , 1 , 0
} , { "dipole_to_power" , rt_offsetof ( struct_bAwhF0jhe8CAuqzSl58dcD ,
dipole_to_power ) , 0 , 1 , 0 } , { "sample_time_s" , rt_offsetof (
struct_w7aMc9U4emvM2kACBtRHPE , sample_time_s ) , 0 , 7 , 0 } , { "rwa" ,
rt_offsetof ( struct_w7aMc9U4emvM2kACBtRHPE , rwa ) , 7 , 7 , 0 } , { "mtq" ,
rt_offsetof ( struct_w7aMc9U4emvM2kACBtRHPE , mtq ) , 8 , 7 , 0 } , { "A" ,
rt_offsetof ( struct_9OHKL3KkhSMVqS2TKD32KD , A ) , 0 , 14 , 0 } , { "Phi" ,
rt_offsetof ( struct_9OHKL3KkhSMVqS2TKD32KD , Phi ) , 0 , 15 , 0 } , {
"A_inv" , rt_offsetof ( struct_9OHKL3KkhSMVqS2TKD32KD , A_inv ) , 0 , 15 , 0
} , { "A_1" , rt_offsetof ( struct_9OHKL3KkhSMVqS2TKD32KD , A_1 ) , 0 , 14 ,
0 } , { "Phi_1" , rt_offsetof ( struct_9OHKL3KkhSMVqS2TKD32KD , Phi_1 ) , 0 ,
15 , 0 } , { "A_2" , rt_offsetof ( struct_9OHKL3KkhSMVqS2TKD32KD , A_2 ) , 0
, 14 , 0 } , { "Phi_2" , rt_offsetof ( struct_9OHKL3KkhSMVqS2TKD32KD , Phi_2
) , 0 , 15 , 0 } , { "A_3" , rt_offsetof ( struct_9OHKL3KkhSMVqS2TKD32KD ,
A_3 ) , 0 , 14 , 0 } , { "Phi_3" , rt_offsetof (
struct_9OHKL3KkhSMVqS2TKD32KD , Phi_3 ) , 0 , 15 , 0 } , { "A_4" ,
rt_offsetof ( struct_9OHKL3KkhSMVqS2TKD32KD , A_4 ) , 0 , 14 , 0 } , {
"Phi_4" , rt_offsetof ( struct_9OHKL3KkhSMVqS2TKD32KD , Phi_4 ) , 0 , 15 , 0
} , { "C" , rt_offsetof ( struct_J2UklKDOwboHskfNE7JQOD , C ) , 0 , 5 , 0 } ,
{ "J" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , J ) , 0 , 5 , 0 } , {
"A" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , A ) , 0 , 14 , 0 } , {
"Phi" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , Phi ) , 0 , 15 , 0 } ,
{ "w_max" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , w_max ) , 0 , 7 , 0
} , { "torque_max" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , torque_max
) , 0 , 7 , 0 } , { "T" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , T ) ,
0 , 11 , 0 } , { "zeta" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , zeta
) , 0 , 7 , 0 } , { "wn" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , wn )
, 0 , 7 , 0 } , { "qd" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , qd ) ,
0 , 10 , 0 } , { "q0" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , q0 ) ,
0 , 10 , 0 } , { "K" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , K ) , 0
, 5 , 0 } , { "ep" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , ep ) , 0 ,
7 , 0 } , { "K_init" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , K_init )
, 0 , 5 , 0 } , { "P" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , P ) , 0
, 5 , 0 } , { "C" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC , C ) , 0 , 5
, 0 } , { "saturation" , rt_offsetof ( struct_4mAysgmjVCepNgQ3iGFExC ,
saturation ) , 0 , 7 , 0 } , { "w0" , rt_offsetof (
struct_4mAysgmjVCepNgQ3iGFExC , w0 ) , 0 , 1 , 0 } , { "qd1" , rt_offsetof (
struct_4mAysgmjVCepNgQ3iGFExC , qd1 ) , 0 , 10 , 0 } , { "Kd1" , rt_offsetof
( struct_U12upH4rVNUTnf5woIw8YH , Kd1 ) , 0 , 5 , 0 } , { "Kp1" , rt_offsetof
( struct_U12upH4rVNUTnf5woIw8YH , Kp1 ) , 0 , 5 , 0 } , { "qd1" , rt_offsetof
( struct_U12upH4rVNUTnf5woIw8YH , qd1 ) , 0 , 10 , 0 } , { "k" , rt_offsetof
( struct_RVC8XrLuWshpvAM0OkFvt , k ) , 0 , 7 , 0 } , { "B" , rt_offsetof (
struct_RVC8XrLuWshpvAM0OkFvt , B ) , 0 , 7 , 0 } , { "B_vec" , rt_offsetof (
struct_RVC8XrLuWshpvAM0OkFvt , B_vec ) , 0 , 1 , 0 } , { "maxDipole" ,
rt_offsetof ( struct_RVC8XrLuWshpvAM0OkFvt , maxDipole ) , 0 , 7 , 0 } , {
"Jw" , rt_offsetof ( struct_RVC8XrLuWshpvAM0OkFvt , Jw ) , 0 , 7 , 0 } , {
"ht" , rt_offsetof ( struct_RVC8XrLuWshpvAM0OkFvt , ht ) , 0 , 9 , 0 } , {
"stabilize" , rt_offsetof ( struct_lvNRa0gCEJ8LerTxVHRCcF , stabilize ) , 11
, 7 , 0 } , { "reorientation" , rt_offsetof ( struct_lvNRa0gCEJ8LerTxVHRCcF ,
reorientation ) , 12 , 7 , 0 } , { "tracking" , rt_offsetof (
struct_lvNRa0gCEJ8LerTxVHRCcF , tracking ) , 13 , 7 , 0 } , { "desaturation"
, rt_offsetof ( struct_lvNRa0gCEJ8LerTxVHRCcF , desaturation ) , 14 , 7 , 0 }
, { "Beta_init" , rt_offsetof ( struct_z5tOVs4XZJ8tZ1LnGwJNlH , Beta_init ) ,
0 , 1 , 0 } , { "quat_est_init" , rt_offsetof ( struct_z5tOVs4XZJ8tZ1LnGwJNlH
, quat_est_init ) , 0 , 10 , 0 } , { "w_init" , rt_offsetof (
struct_z5tOVs4XZJ8tZ1LnGwJNlH , w_init ) , 0 , 1 , 0 } , { "P_init" ,
rt_offsetof ( struct_z5tOVs4XZJ8tZ1LnGwJNlH , P_init ) , 0 , 2 , 0 } , {
"rt_valid_gyro" , rt_offsetof ( struct_z5tOVs4XZJ8tZ1LnGwJNlH , rt_valid_gyro
) , 0 , 7 , 0 } , { "rt_valid_mag" , rt_offsetof (
struct_z5tOVs4XZJ8tZ1LnGwJNlH , rt_valid_mag ) , 0 , 7 , 0 } , {
"rt_valid_sun" , rt_offsetof ( struct_z5tOVs4XZJ8tZ1LnGwJNlH , rt_valid_sun )
, 0 , 7 , 0 } , { "rt_mt_power_ok" , rt_offsetof (
struct_z5tOVs4XZJ8tZ1LnGwJNlH , rt_mt_power_ok ) , 0 , 7 , 0 } , {
"rt_sc_in_sun" , rt_offsetof ( struct_z5tOVs4XZJ8tZ1LnGwJNlH , rt_sc_in_sun )
, 0 , 7 , 0 } , { "rt_w_body_radps" , rt_offsetof (
struct_z5tOVs4XZJ8tZ1LnGwJNlH , rt_w_body_radps ) , 0 , 1 , 0 } , {
"rt_mag_body" , rt_offsetof ( struct_z5tOVs4XZJ8tZ1LnGwJNlH , rt_mag_body ) ,
0 , 1 , 0 } , { "rt_mag_eci_est" , rt_offsetof (
struct_z5tOVs4XZJ8tZ1LnGwJNlH , rt_mag_eci_est ) , 0 , 1 , 0 } , {
"rt_sun_body" , rt_offsetof ( struct_z5tOVs4XZJ8tZ1LnGwJNlH , rt_sun_body ) ,
0 , 1 , 0 } , { "rt_sun_eci_est" , rt_offsetof (
struct_z5tOVs4XZJ8tZ1LnGwJNlH , rt_sun_eci_est ) , 0 , 1 , 0 } , { "ic" ,
rt_offsetof ( struct_ICucPnOOJJLn3xbs96EvuF , ic ) , 16 , 7 , 0 } , { "dt" ,
rt_offsetof ( struct_ICucPnOOJJLn3xbs96EvuF , dt ) , 0 , 7 , 0 } , {
"sample_time_s" , rt_offsetof ( struct_ICucPnOOJJLn3xbs96EvuF , sample_time_s
) , 0 , 7 , 0 } , { "Q_k" , rt_offsetof ( struct_ICucPnOOJJLn3xbs96EvuF , Q_k
) , 0 , 2 , 0 } , { "gamma" , rt_offsetof ( struct_ICucPnOOJJLn3xbs96EvuF ,
gamma ) , 0 , 2 , 0 } , { "Qg" , rt_offsetof ( struct_ICucPnOOJJLn3xbs96EvuF
, Qg ) , 0 , 2 , 0 } , { "R" , rt_offsetof ( struct_ICucPnOOJJLn3xbs96EvuF ,
R ) , 0 , 2 , 0 } , { "sample_time_s" , rt_offsetof (
struct_3DKGR4n2ovZKiw3p2jOVcH , sample_time_s ) , 0 , 7 , 0 } , { "constants"
, rt_offsetof ( struct_3DKGR4n2ovZKiw3p2jOVcH , constants ) , 4 , 7 , 0 } , {
"scParams" , rt_offsetof ( struct_3DKGR4n2ovZKiw3p2jOVcH , scParams ) , 5 , 7
, 0 } , { "actuators" , rt_offsetof ( struct_3DKGR4n2ovZKiw3p2jOVcH ,
actuators ) , 9 , 7 , 0 } , { "allocator" , rt_offsetof (
struct_3DKGR4n2ovZKiw3p2jOVcH , allocator ) , 10 , 7 , 0 } , { "controllers"
, rt_offsetof ( struct_3DKGR4n2ovZKiw3p2jOVcH , controllers ) , 15 , 7 , 0 }
, { "estimation" , rt_offsetof ( struct_3DKGR4n2ovZKiw3p2jOVcH , estimation )
, 17 , 7 , 0 } } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_VECTOR , 0 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 2 , 2 , 0 } , {
rtwCAPI_MATRIX_COL_MAJOR , 4 , 2 , 0 } , { rtwCAPI_SCALAR , 6 , 2 , 0 } , {
rtwCAPI_MATRIX_COL_MAJOR , 8 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 10 , 2
, 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 6 , 2 ,
0 } , { rtwCAPI_MATRIX_COL_MAJOR , 12 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR
, 14 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 0 , 2 , 0 } , {
rtwCAPI_MATRIX_COL_MAJOR , 16 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 18 , 2
, 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 20 , 2 , 0 } , {
rtwCAPI_MATRIX_COL_MAJOR , 22 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 24 , 2
, 0 } } ; static const uint_T rtDimensionArray [ ] = { 4 , 1 , 3 , 1 , 6 , 6
, 1 , 1 , 6 , 3 , 3 , 3 , 1 , 3 , 1 , 4 , 4 , 4 , 5 , 3 , 2 , 1 , 3 , 4 , 4 ,
3 } ; static const real_T rtcapiStoredFloats [ ] = { 0.1 , 0.0 , 1.0 } ;
static const rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static const rtwCAPI_SampleTimeMap
rtSampleTimeMap [ ] = { { ( const void * ) & rtcapiStoredFloats [ 0 ] , (
const void * ) & rtcapiStoredFloats [ 1 ] , 0 , 0 } , { ( NULL ) , ( NULL ) ,
2 , 0 } , { ( const void * ) & rtcapiStoredFloats [ 2 ] , ( const void * ) &
rtcapiStoredFloats [ 1 ] , 1 , 0 } } ; static rtwCAPI_ModelMappingStaticInfo
mmiStatic = { { rtBlockSignals , 73 , ( NULL ) , 0 , ( NULL ) , 0 } , {
rtBlockParameters , 143 , rtModelParameters , 1 } , { ( NULL ) , 0 } , {
rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap
, rtDimensionArray } , "float" , { 2311783776U , 2513219590U , 126627232U ,
2807901779U } , ( NULL ) , 0 , 0 } ; const rtwCAPI_ModelMappingStaticInfo *
UnitTestDebug_GetCAPIStaticMap ( void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void UnitTestDebug_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void UnitTestDebug_host_InitializeDataMapInfo (
UnitTestDebug_host_DataMapInfo_T * dataMap , const char * path ) {
rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap ->
mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
