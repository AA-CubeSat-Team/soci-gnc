#include "__cf_UnitTestDebug.h"
#include "rt_logging_mmi.h"
#include "UnitTestDebug_capi.h"
#include <math.h>
#include "UnitTestDebug.h"
#include "UnitTestDebug_private.h"
#include "UnitTestDebug_dt.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; RTWExtModeInfo * gblRTWExtModeInfo = NULL ; extern boolean_T
gblExtModeStartPktReceived ; void raccelForceExtModeShutdown ( ) { if ( !
gblExtModeStartPktReceived ) { boolean_T stopRequested = false ;
rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 2 , & stopRequested ) ; }
rtExtModeShutdown ( 2 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 0 ;
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 0 ; int_T gbl_raccel_NumST = 3 ; const char_T
* gbl_raccel_Version = "9.2 (R2018b) 24-May-2018" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; const char * gblSlvrJacPatternFileName =
"slprj\\raccel\\UnitTestDebug\\UnitTestDebug_Jpattern.mat" ; const int_T
gblNumRootInportBlks = 0 ; const int_T gblNumModelInputs = 0 ; extern
rtInportTUtable * gblInportTUtables ; extern const char * gblInportFileName ;
const int_T gblInportDataTypeIdx [ ] = { - 1 } ; const int_T gblInportDims [
] = { - 1 } ; const int_T gblInportComplex [ ] = { - 1 } ; const int_T
gblInportInterpoFlag [ ] = { - 1 } ; const int_T gblInportContinuous [ ] = {
- 1 } ; int_T enableFcnCallFlag [ ] = { 1 , 1 , 1 } ;
#include "simstruc.h"
#include "fixedpoint.h"
B rtB ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS = &
model_S ; static void oz3hhcscl4 ( real_T A [ 36 ] , const real_T B_p [ 36 ]
) ; real_T rt_urand_Upu32_Yd_f_pw_snf ( uint32_T * u ) { uint32_T lo ;
uint32_T hi ; lo = * u % 127773U * 16807U ; hi = * u / 127773U * 2836U ; if (
lo < hi ) { * u = 2147483647U - ( hi - lo ) ; } else { * u = lo - hi ; }
return ( real_T ) * u * 4.6566128752457969E-10 ; } real_T
rt_nrand_Upu32_Yd_f_pw_snf ( uint32_T * u ) { real_T y ; real_T sr ; real_T
si ; do { sr = 2.0 * rt_urand_Upu32_Yd_f_pw_snf ( u ) - 1.0 ; si = 2.0 *
rt_urand_Upu32_Yd_f_pw_snf ( u ) - 1.0 ; si = sr * sr + si * si ; } while (
si > 1.0 ) ; y = muDoubleScalarSqrt ( - 2.0 * muDoubleScalarLog ( si ) / si )
* sr ; return y ; } static void oz3hhcscl4 ( real_T A [ 36 ] , const real_T
B_p [ 36 ] ) { real_T b_A [ 36 ] ; int8_T ipiv [ 6 ] ; int32_T j ; int32_T ix
; real_T smax ; real_T s ; int32_T iy ; int32_T c_ix ; int32_T d ; int32_T
ijA ; int32_T jBcol ; int32_T kBcol ; memcpy ( & b_A [ 0 ] , & B_p [ 0 ] ,
36U * sizeof ( real_T ) ) ; for ( j = 0 ; j < 6 ; j ++ ) { ipiv [ j ] = (
int8_T ) ( 1 + j ) ; } for ( j = 0 ; j < 5 ; j ++ ) { jBcol = j * 7 ; iy = 0
; ix = jBcol ; smax = muDoubleScalarAbs ( b_A [ jBcol ] ) ; for ( kBcol = 2 ;
kBcol <= 6 - j ; kBcol ++ ) { ix ++ ; s = muDoubleScalarAbs ( b_A [ ix ] ) ;
if ( s > smax ) { iy = kBcol - 1 ; smax = s ; } } if ( b_A [ jBcol + iy ] !=
0.0 ) { if ( iy != 0 ) { ipiv [ j ] = ( int8_T ) ( ( j + iy ) + 1 ) ; ix = j
; iy += j ; for ( kBcol = 0 ; kBcol < 6 ; kBcol ++ ) { smax = b_A [ ix ] ;
b_A [ ix ] = b_A [ iy ] ; b_A [ iy ] = smax ; ix += 6 ; iy += 6 ; } } iy = (
jBcol - j ) + 6 ; for ( ix = jBcol + 1 ; ix < iy ; ix ++ ) { b_A [ ix ] /=
b_A [ jBcol ] ; } } iy = jBcol ; ix = jBcol + 6 ; for ( kBcol = 0 ; kBcol <=
4 - j ; kBcol ++ ) { if ( b_A [ ix ] != 0.0 ) { smax = - b_A [ ix ] ; c_ix =
jBcol + 1 ; d = ( iy - j ) + 12 ; for ( ijA = 7 + iy ; ijA < d ; ijA ++ ) {
b_A [ ijA ] += b_A [ c_ix ] * smax ; c_ix ++ ; } } ix += 6 ; iy += 6 ; } }
for ( j = 0 ; j < 6 ; j ++ ) { jBcol = 6 * j ; iy = 6 * j ; for ( ix = 0 ; ix
< j ; ix ++ ) { kBcol = 6 * ix ; if ( b_A [ ix + iy ] != 0.0 ) { for ( c_ix =
0 ; c_ix < 6 ; c_ix ++ ) { A [ c_ix + jBcol ] -= b_A [ ix + iy ] * A [ c_ix +
kBcol ] ; } } } smax = 1.0 / b_A [ j + iy ] ; for ( iy = 0 ; iy < 6 ; iy ++ )
{ A [ iy + jBcol ] *= smax ; } } for ( j = 5 ; j >= 0 ; j -- ) { jBcol = 6 *
j ; iy = 6 * j - 1 ; for ( ix = j + 2 ; ix < 7 ; ix ++ ) { kBcol = ( ix - 1 )
* 6 ; if ( b_A [ ix + iy ] != 0.0 ) { for ( c_ix = 0 ; c_ix < 6 ; c_ix ++ ) {
A [ c_ix + jBcol ] -= b_A [ ix + iy ] * A [ c_ix + kBcol ] ; } } } } for ( j
= 4 ; j >= 0 ; j -- ) { if ( j + 1 != ipiv [ j ] ) { jBcol = ipiv [ j ] - 1 ;
for ( iy = 0 ; iy < 6 ; iy ++ ) { smax = A [ 6 * j + iy ] ; A [ iy + 6 * j ]
= A [ 6 * jBcol + iy ] ; A [ iy + 6 * jBcol ] = smax ; } } } } void
MdlInitialize ( void ) { uint32_T tseed ; int32_T t ; int32_T i ; real_T tmp
; tmp = muDoubleScalarFloor ( rtP . RandomNumber_Seed ) ; if (
muDoubleScalarIsNaN ( tmp ) || muDoubleScalarIsInf ( tmp ) ) { tmp = 0.0 ; }
else { tmp = muDoubleScalarRem ( tmp , 4.294967296E+9 ) ; } tseed = tmp < 0.0
? ( uint32_T ) - ( int32_T ) ( uint32_T ) - tmp : ( uint32_T ) tmp ; i = (
int32_T ) ( tseed >> 16U ) ; t = ( int32_T ) ( tseed & 32768U ) ; tseed = ( (
( ( tseed - ( ( uint32_T ) i << 16U ) ) + t ) << 16U ) + t ) + i ; if ( tseed
< 1U ) { tseed = 1144108930U ; } else { if ( tseed > 2147483646U ) { tseed =
2147483646U ; } } rtDW . owi0qnn13s [ 0 ] = tseed ; rtDW . hmtmt5gwtt [ 0 ] =
rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . owi0qnn13s [ 0 ] ) * rtP .
RandomNumber_StdDev [ 0 ] + rtP . RandomNumber_Mean ; tmp =
muDoubleScalarFloor ( rtP . RandomNumber_Seed ) ; if ( muDoubleScalarIsNaN (
tmp ) || muDoubleScalarIsInf ( tmp ) ) { tmp = 0.0 ; } else { tmp =
muDoubleScalarRem ( tmp , 4.294967296E+9 ) ; } tseed = tmp < 0.0 ? ( uint32_T
) - ( int32_T ) ( uint32_T ) - tmp : ( uint32_T ) tmp ; i = ( int32_T ) (
tseed >> 16U ) ; t = ( int32_T ) ( tseed & 32768U ) ; tseed = ( ( ( ( tseed -
( ( uint32_T ) i << 16U ) ) + t ) << 16U ) + t ) + i ; if ( tseed < 1U ) {
tseed = 1144108930U ; } else { if ( tseed > 2147483646U ) { tseed =
2147483646U ; } } rtDW . owi0qnn13s [ 1 ] = tseed ; rtDW . hmtmt5gwtt [ 1 ] =
rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . owi0qnn13s [ 1 ] ) * rtP .
RandomNumber_StdDev [ 1 ] + rtP . RandomNumber_Mean ; tmp =
muDoubleScalarFloor ( rtP . RandomNumber_Seed ) ; if ( muDoubleScalarIsNaN (
tmp ) || muDoubleScalarIsInf ( tmp ) ) { tmp = 0.0 ; } else { tmp =
muDoubleScalarRem ( tmp , 4.294967296E+9 ) ; } tseed = tmp < 0.0 ? ( uint32_T
) - ( int32_T ) ( uint32_T ) - tmp : ( uint32_T ) tmp ; i = ( int32_T ) (
tseed >> 16U ) ; t = ( int32_T ) ( tseed & 32768U ) ; tseed = ( ( ( ( tseed -
( ( uint32_T ) i << 16U ) ) + t ) << 16U ) + t ) + i ; if ( tseed < 1U ) {
tseed = 1144108930U ; } else { if ( tseed > 2147483646U ) { tseed =
2147483646U ; } } rtDW . owi0qnn13s [ 2 ] = tseed ; rtDW . hmtmt5gwtt [ 2 ] =
rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . owi0qnn13s [ 2 ] ) * rtP .
RandomNumber_StdDev [ 2 ] + rtP . RandomNumber_Mean ; rtDW . eo2izelnsp [ 0 ]
= rtP . DiscreteTimeIntegrator_IC [ 0 ] ; rtDW . eo2izelnsp [ 1 ] = rtP .
DiscreteTimeIntegrator_IC [ 1 ] ; rtDW . eo2izelnsp [ 2 ] = rtP .
DiscreteTimeIntegrator_IC [ 2 ] ; rtDW . eo2izelnsp [ 3 ] = rtP .
DiscreteTimeIntegrator_IC [ 3 ] ; tmp = muDoubleScalarFloor ( rtP .
RandomNumber1_Seed ) ; if ( muDoubleScalarIsNaN ( tmp ) ||
muDoubleScalarIsInf ( tmp ) ) { tmp = 0.0 ; } else { tmp = muDoubleScalarRem
( tmp , 4.294967296E+9 ) ; } tseed = tmp < 0.0 ? ( uint32_T ) - ( int32_T ) (
uint32_T ) - tmp : ( uint32_T ) tmp ; i = ( int32_T ) ( tseed >> 16U ) ; t =
( int32_T ) ( tseed & 32768U ) ; tseed = ( ( ( ( tseed - ( ( uint32_T ) i <<
16U ) ) + t ) << 16U ) + t ) + i ; if ( tseed < 1U ) { tseed = 1144108930U ;
} else { if ( tseed > 2147483646U ) { tseed = 2147483646U ; } } rtDW .
nn2tfrewz5 [ 0 ] = tseed ; rtDW . jk5uei3ei4 [ 0 ] =
rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . nn2tfrewz5 [ 0 ] ) * rtP .
RandomNumber1_StdDev [ 0 ] + rtP . RandomNumber1_Mean ; tmp =
muDoubleScalarFloor ( rtP . RandomNumber1_Seed ) ; if ( muDoubleScalarIsNaN (
tmp ) || muDoubleScalarIsInf ( tmp ) ) { tmp = 0.0 ; } else { tmp =
muDoubleScalarRem ( tmp , 4.294967296E+9 ) ; } tseed = tmp < 0.0 ? ( uint32_T
) - ( int32_T ) ( uint32_T ) - tmp : ( uint32_T ) tmp ; i = ( int32_T ) (
tseed >> 16U ) ; t = ( int32_T ) ( tseed & 32768U ) ; tseed = ( ( ( ( tseed -
( ( uint32_T ) i << 16U ) ) + t ) << 16U ) + t ) + i ; if ( tseed < 1U ) {
tseed = 1144108930U ; } else { if ( tseed > 2147483646U ) { tseed =
2147483646U ; } } rtDW . nn2tfrewz5 [ 1 ] = tseed ; rtDW . jk5uei3ei4 [ 1 ] =
rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . nn2tfrewz5 [ 1 ] ) * rtP .
RandomNumber1_StdDev [ 1 ] + rtP . RandomNumber1_Mean ; tmp =
muDoubleScalarFloor ( rtP . RandomNumber1_Seed ) ; if ( muDoubleScalarIsNaN (
tmp ) || muDoubleScalarIsInf ( tmp ) ) { tmp = 0.0 ; } else { tmp =
muDoubleScalarRem ( tmp , 4.294967296E+9 ) ; } tseed = tmp < 0.0 ? ( uint32_T
) - ( int32_T ) ( uint32_T ) - tmp : ( uint32_T ) tmp ; i = ( int32_T ) (
tseed >> 16U ) ; t = ( int32_T ) ( tseed & 32768U ) ; tseed = ( ( ( ( tseed -
( ( uint32_T ) i << 16U ) ) + t ) << 16U ) + t ) + i ; if ( tseed < 1U ) {
tseed = 1144108930U ; } else { if ( tseed > 2147483646U ) { tseed =
2147483646U ; } } rtDW . nn2tfrewz5 [ 2 ] = tseed ; rtDW . jk5uei3ei4 [ 2 ] =
rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . nn2tfrewz5 [ 2 ] ) * rtP .
RandomNumber1_StdDev [ 2 ] + rtP . RandomNumber1_Mean ; rtDW . gdylcuu45e =
rtP . Memory_InitialCondition ; rtDW . ic3jrlr0jz = rtP .
UnitDelay2_InitialCondition ; rtDW . jr51z3zb5d [ 0 ] = rtP .
UnitDelay2_InitialCondition_e5yh3e2aq2 [ 0 ] ; rtDW . jr51z3zb5d [ 1 ] = rtP
. UnitDelay2_InitialCondition_e5yh3e2aq2 [ 1 ] ; rtDW . jr51z3zb5d [ 2 ] =
rtP . UnitDelay2_InitialCondition_e5yh3e2aq2 [ 2 ] ; rtDW . jr51z3zb5d [ 3 ]
= rtP . UnitDelay2_InitialCondition_e5yh3e2aq2 [ 3 ] ; rtDW . lq50dyklp4 [ 0
] = rtP . fswParams . estimation . ic . Beta_init [ 0 ] ; rtDW . lq50dyklp4 [
1 ] = rtP . fswParams . estimation . ic . Beta_init [ 1 ] ; rtDW . lq50dyklp4
[ 2 ] = rtP . fswParams . estimation . ic . Beta_init [ 2 ] ; rtDW .
fa0uzeqpit [ 0 ] = rtP . fswParams . estimation . ic . quat_est_init [ 0 ] ;
rtB . loo5xvtgsh [ 0 ] = rtP . Merge_InitialOutput ; rtB . obpruepjlb [ 0 ] =
rtP . q_plusmerge_InitialOutput ; rtDW . fa0uzeqpit [ 1 ] = rtP . fswParams .
estimation . ic . quat_est_init [ 1 ] ; rtB . loo5xvtgsh [ 1 ] = rtP .
Merge_InitialOutput ; rtB . obpruepjlb [ 1 ] = rtP .
q_plusmerge_InitialOutput ; rtDW . fa0uzeqpit [ 2 ] = rtP . fswParams .
estimation . ic . quat_est_init [ 2 ] ; rtB . loo5xvtgsh [ 2 ] = rtP .
Merge_InitialOutput ; rtB . obpruepjlb [ 2 ] = rtP .
q_plusmerge_InitialOutput ; rtDW . fa0uzeqpit [ 3 ] = rtP . fswParams .
estimation . ic . quat_est_init [ 3 ] ; rtB . loo5xvtgsh [ 3 ] = rtP .
Merge_InitialOutput ; rtB . obpruepjlb [ 3 ] = rtP .
q_plusmerge_InitialOutput ; rtB . nt5aet3d3s [ 0 ] = rtP .
BiasMerge_InitialOutput ; rtB . nt5aet3d3s [ 1 ] = rtP .
BiasMerge_InitialOutput ; rtB . nt5aet3d3s [ 2 ] = rtP .
BiasMerge_InitialOutput ; for ( i = 0 ; i < 36 ; i ++ ) { rtDW . ismukjvadj [
i ] = rtP . fswParams . estimation . ic . P_init [ i ] ; rtB . mqrllrhknp [ i
] = rtP . P_plusmerge_InitialOutput ; } rtB . chwubaiywm [ 0 ] = rtP .
AngularVelo_Y0 ; rtB . chwubaiywm [ 1 ] = rtP . AngularVelo_Y0 ; rtB .
chwubaiywm [ 2 ] = rtP . AngularVelo_Y0 ; rtB . c1klcpas2f = rtP .
flag_out_Y0 ; } void MdlStart ( void ) { { void * * slioCatalogueAddr =
rt_slioCatalogueAddr ( ) ; void * r2 = ( NULL ) ; void * *
pOSigstreamManagerAddr = ( NULL ) ; const int maxErrorBufferSize = 16384 ;
char errMsgCreatingOSigstreamManager [ 16384 ] ; bool
errorCreatingOSigstreamManager = false ; const char *
errorAddingR2SharedResource = ( NULL ) ; * slioCatalogueAddr =
rtwGetNewSlioCatalogue ( rt_GetMatSigLogSelectorFileName ( ) ) ;
errorAddingR2SharedResource = rtwAddR2SharedResource (
rtwGetPointerFromUniquePtr ( rt_slioCatalogue ( ) ) , 1 ) ; if (
errorAddingR2SharedResource != ( NULL ) ) { rtwTerminateSlioCatalogue (
slioCatalogueAddr ) ; * slioCatalogueAddr = ( NULL ) ; ssSetErrorStatus ( rtS
, errorAddingR2SharedResource ) ; return ; } r2 = rtwGetR2SharedResource (
rtwGetPointerFromUniquePtr ( rt_slioCatalogue ( ) ) ) ;
pOSigstreamManagerAddr = rt_GetOSigstreamManagerAddr ( ) ;
errorCreatingOSigstreamManager = rtwOSigstreamManagerCreateInstance (
rt_GetMatSigLogSelectorFileName ( ) , r2 , pOSigstreamManagerAddr ,
errMsgCreatingOSigstreamManager , maxErrorBufferSize ) ; if (
errorCreatingOSigstreamManager ) { * pOSigstreamManagerAddr = ( NULL ) ;
ssSetErrorStatus ( rtS , errMsgCreatingOSigstreamManager ) ; return ; } } {
bool externalInputIsInDatasetFormat = false ; void * pISigstreamManager =
rt_GetISigstreamManager ( ) ; rtwISigstreamManagerGetInputIsInDatasetFormat (
pISigstreamManager , & externalInputIsInDatasetFormat ) ; if (
externalInputIsInDatasetFormat ) { } } rtB . lhspd1b5b3 [ 0 ] = rtP .
Constant4_Value [ 0 ] ; rtB . lhspd1b5b3 [ 1 ] = rtP . Constant4_Value [ 1 ]
; rtB . lhspd1b5b3 [ 2 ] = rtP . Constant4_Value [ 2 ] ; rtDW . ilthyfodyf =
false ; ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; rtDW .
ek3tkvtgck = - 1 ; memset ( & rtB . epk34rzqnu [ 0 ] , 0 , 9U * sizeof (
real_T ) ) ; rtB . epk34rzqnu [ 0 ] = 1.0 ; rtB . epk34rzqnu [ 4 ] = 1.0 ;
rtB . epk34rzqnu [ 8 ] = 1.0 ; MdlInitialize ( ) ; } void MdlOutputs ( int_T
tid ) { int8_T Phi_22 [ 9 ] ; int8_T b_I [ 9 ] ; static const int8_T a [ 9 ]
= { - 1 , 0 , 0 , 0 , - 1 , 0 , 0 , 0 , - 1 } ; static const int8_T b_a [ 9 ]
= { 1 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 } ; real_T KHI [ 36 ] ; int8_T b_I_p [
36 ] ; real_T m3vqsbhfap ; real_T o5fbh12wbo ; real_T hqzphhpf0a ; real_T
adobezhicd ; real_T bxkgw4nx0n ; real_T gk40pgs4ff ; real_T bafeipipwy [ 36 ]
; real_T jj4a1ein4v [ 12 ] ; int32_T idxStart ; real_T mhvcpxrr3l [ 9 ] ;
real_T l1jecu0erz [ 6 ] ; real_T gtgn40wmng [ 4 ] ; real_T ogoyiankqg [ 9 ] ;
real_T imrquoljb4 [ 36 ] ; int32_T i ; real_T hatd3u5u11 [ 36 ] ; real_T
olz4u2wjqo [ 9 ] ; real_T hatd3u5u11_p [ 36 ] ; real_T KHI_p [ 36 ] ; real_T
h2w5rko2ge [ 36 ] ; real_T katnewkzuf [ 16 ] ; real_T luueck1yme [ 6 ] ;
real_T tmp [ 6 ] ; real_T tmp_p [ 6 ] ; int32_T i_p ; real_T ft0juajmnq_idx_0
; real_T ft0juajmnq_idx_1 ; real_T ft0juajmnq_idx_2 ; real_T nmafzs135o_idx_2
; real_T nmafzs135o_idx_0 ; real_T nmafzs135o_idx_1 ; srClearBC ( rtDW .
d55jaht4oo ) ; if ( ssIsSampleHit ( rtS , 0 , 0 ) ) { srClearBC ( rtDW .
bpgaewctmf ) ; } srClearBC ( rtDW . l023zsos0w ) ; if ( ssIsSampleHit ( rtS ,
0 , 0 ) ) { srClearBC ( rtDW . eoo2421vkh ) ; } if ( ssIsSampleHit ( rtS , 0
, 0 ) ) { srClearBC ( rtDW . itbgldrtmn ) ; } srClearBC ( rtDW . pacgymw5aw )
; if ( ssIsSampleHit ( rtS , 0 , 0 ) ) { srClearBC ( rtDW . f44n4zoqaq ) ; }
if ( ssIsSampleHit ( rtS , 0 , 0 ) ) { srClearBC ( rtDW . be2p4vgwja ) ; } if
( ssIsSampleHit ( rtS , 0 , 0 ) ) { srClearBC ( rtDW . hsldxkjyqe ) ; }
m3vqsbhfap = muDoubleScalarSqrt ( ( ( rtDW . eo2izelnsp [ 0 ] * rtDW .
eo2izelnsp [ 0 ] + rtDW . eo2izelnsp [ 1 ] * rtDW . eo2izelnsp [ 1 ] ) + rtDW
. eo2izelnsp [ 2 ] * rtDW . eo2izelnsp [ 2 ] ) + rtDW . eo2izelnsp [ 3 ] *
rtDW . eo2izelnsp [ 3 ] ) ; rtB . evb2ami2f5 = rtDW . eo2izelnsp [ 2 ] /
m3vqsbhfap ; rtB . l33vh4jdca = rtDW . eo2izelnsp [ 0 ] / m3vqsbhfap ; rtB .
dejmsjiytm = rtDW . eo2izelnsp [ 1 ] / m3vqsbhfap ; rtB . bzlumtv1jw = rtDW .
eo2izelnsp [ 3 ] / m3vqsbhfap ; o5fbh12wbo = muDoubleScalarSqrt ( ( ( rtB .
l33vh4jdca * rtB . l33vh4jdca + rtB . dejmsjiytm * rtB . dejmsjiytm ) + rtB .
evb2ami2f5 * rtB . evb2ami2f5 ) + rtB . bzlumtv1jw * rtB . bzlumtv1jw ) ;
m3vqsbhfap = rtB . evb2ami2f5 / o5fbh12wbo ; hqzphhpf0a = rtB . bzlumtv1jw /
o5fbh12wbo ; adobezhicd = rtB . dejmsjiytm / o5fbh12wbo ; o5fbh12wbo = rtB .
l33vh4jdca / o5fbh12wbo ; rtB . h1pvfyoead = ( ( ( rtP .
Constant_Value_otz3nmwoqv - m3vqsbhfap * m3vqsbhfap ) - hqzphhpf0a *
hqzphhpf0a ) * rtP . Gain2_Gain_cnsd3b5ouu * rtP . Constant2_Value_chs5tmnkek
[ 0 ] + ( adobezhicd * m3vqsbhfap + o5fbh12wbo * hqzphhpf0a ) * rtP .
Gain_Gain_klyu41lrfn * rtP . Constant2_Value_chs5tmnkek [ 1 ] ) + (
adobezhicd * hqzphhpf0a - o5fbh12wbo * m3vqsbhfap ) * rtP .
Gain1_Gain_diuflnffrx * rtP . Constant2_Value_chs5tmnkek [ 2 ] ; rtB .
k3ubjuj4xo = ( ( ( rtP . Constant_Value_gztnxshksk - adobezhicd * adobezhicd
) - hqzphhpf0a * hqzphhpf0a ) * rtP . Gain2_Gain_no1j2ourve * rtP .
Constant2_Value_chs5tmnkek [ 1 ] + ( adobezhicd * m3vqsbhfap - o5fbh12wbo *
hqzphhpf0a ) * rtP . Gain_Gain_jhze2kqkab * rtP . Constant2_Value_chs5tmnkek
[ 0 ] ) + ( o5fbh12wbo * adobezhicd + m3vqsbhfap * hqzphhpf0a ) * rtP .
Gain1_Gain_mcq3nfgl5y * rtP . Constant2_Value_chs5tmnkek [ 2 ] ; rtB .
bwa10aik04 = ( ( adobezhicd * hqzphhpf0a + o5fbh12wbo * m3vqsbhfap ) * rtP .
Gain_Gain_d3m0eipbk4 * rtP . Constant2_Value_chs5tmnkek [ 0 ] + ( m3vqsbhfap
* hqzphhpf0a - o5fbh12wbo * adobezhicd ) * rtP . Gain1_Gain_eukkukzdsc * rtP
. Constant2_Value_chs5tmnkek [ 1 ] ) + ( ( rtP . Constant_Value_jc32hza5ok -
adobezhicd * adobezhicd ) - m3vqsbhfap * m3vqsbhfap ) * rtP .
Gain2_Gain_aqxl3lkkkb * rtP . Constant2_Value_chs5tmnkek [ 2 ] ; rtB .
jzkvyvyuee [ 0 ] = rtDW . hmtmt5gwtt [ 0 ] + rtB . h1pvfyoead ; rtB .
jzkvyvyuee [ 1 ] = rtDW . hmtmt5gwtt [ 1 ] + rtB . k3ubjuj4xo ; rtB .
jzkvyvyuee [ 2 ] = rtDW . hmtmt5gwtt [ 2 ] + rtB . bwa10aik04 ; o5fbh12wbo =
muDoubleScalarSqrt ( ( ( rtB . l33vh4jdca * rtB . l33vh4jdca + rtB .
dejmsjiytm * rtB . dejmsjiytm ) + rtB . evb2ami2f5 * rtB . evb2ami2f5 ) + rtB
. bzlumtv1jw * rtB . bzlumtv1jw ) ; m3vqsbhfap = rtB . evb2ami2f5 /
o5fbh12wbo ; hqzphhpf0a = rtB . bzlumtv1jw / o5fbh12wbo ; adobezhicd = rtB .
dejmsjiytm / o5fbh12wbo ; o5fbh12wbo = rtB . l33vh4jdca / o5fbh12wbo ; rtB .
ohsor4jyhe = ( ( ( rtP . Constant_Value_ong43hwtad - m3vqsbhfap * m3vqsbhfap
) - hqzphhpf0a * hqzphhpf0a ) * rtP . Gain2_Gain_eugrs2j5w1 * rtP .
Constant3_Value_b1f4zjlmmk [ 0 ] + ( adobezhicd * m3vqsbhfap + o5fbh12wbo *
hqzphhpf0a ) * rtP . Gain_Gain_chibgsrp3r * rtP . Constant3_Value_b1f4zjlmmk
[ 1 ] ) + ( adobezhicd * hqzphhpf0a - o5fbh12wbo * m3vqsbhfap ) * rtP .
Gain1_Gain_iwfebhm2do * rtP . Constant3_Value_b1f4zjlmmk [ 2 ] ; rtB .
fd5wmraa51 = ( ( ( rtP . Constant_Value_hf4lqdwccu - adobezhicd * adobezhicd
) - hqzphhpf0a * hqzphhpf0a ) * rtP . Gain2_Gain_pdua0qf4rh * rtP .
Constant3_Value_b1f4zjlmmk [ 1 ] + ( adobezhicd * m3vqsbhfap - o5fbh12wbo *
hqzphhpf0a ) * rtP . Gain_Gain_ag0mpz4kyf * rtP . Constant3_Value_b1f4zjlmmk
[ 0 ] ) + ( o5fbh12wbo * adobezhicd + m3vqsbhfap * hqzphhpf0a ) * rtP .
Gain1_Gain_denqfwp1iw * rtP . Constant3_Value_b1f4zjlmmk [ 2 ] ; rtB .
kehzuzhs35 = ( ( adobezhicd * hqzphhpf0a + o5fbh12wbo * m3vqsbhfap ) * rtP .
Gain_Gain_iiknapd0gg * rtP . Constant3_Value_b1f4zjlmmk [ 0 ] + ( m3vqsbhfap
* hqzphhpf0a - o5fbh12wbo * adobezhicd ) * rtP . Gain1_Gain_hi2t442oxb * rtP
. Constant3_Value_b1f4zjlmmk [ 1 ] ) + ( ( rtP . Constant_Value_imftmnjmib -
adobezhicd * adobezhicd ) - m3vqsbhfap * m3vqsbhfap ) * rtP .
Gain2_Gain_k4jcurr4zm * rtP . Constant3_Value_b1f4zjlmmk [ 2 ] ;
ft0juajmnq_idx_0 = rtDW . jk5uei3ei4 [ 0 ] + rtB . ohsor4jyhe ;
ft0juajmnq_idx_1 = rtDW . jk5uei3ei4 [ 1 ] + rtB . fd5wmraa51 ;
ft0juajmnq_idx_2 = rtDW . jk5uei3ei4 [ 2 ] + rtB . kehzuzhs35 ; rtB .
dlusutdiez = ( rtDW . gdylcuu45e || rtB . p0unimm1k0 ) ; if ( rtB .
dlusutdiez ) { if ( ! rtDW . ilthyfodyf ) { if ( ssGetTaskTime ( rtS , 0 ) !=
ssGetTStart ( rtS ) ) { ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ;
} rtDW . ilthyfodyf = true ; } rtB . mxfdp2ltan [ 0 ] = rtDW . jr51z3zb5d [ 0
] ; rtB . mxfdp2ltan [ 1 ] = rtDW . jr51z3zb5d [ 1 ] ; rtB . mxfdp2ltan [ 2 ]
= rtDW . jr51z3zb5d [ 2 ] ; rtB . mxfdp2ltan [ 3 ] = rtDW . jr51z3zb5d [ 3 ]
; if ( rtDW . ic3jrlr0jz > 0.0 ) { rtDW . ek3tkvtgck = 0 ; rtB . k3ljcleoid [
0 ] = rtB . mxfdp2ltan [ 0 ] ; rtB . k3ljcleoid [ 1 ] = rtB . mxfdp2ltan [ 1
] ; rtB . k3ljcleoid [ 2 ] = rtB . mxfdp2ltan [ 2 ] ; rtB . k3ljcleoid [ 3 ]
= rtB . mxfdp2ltan [ 3 ] ; srUpdateBC ( rtDW . d55jaht4oo ) ; } else { rtDW .
ek3tkvtgck = 1 ; if ( rtB . of1r505p3n ) { m3vqsbhfap = 1.0 / (
muDoubleScalarSqrt ( ( ft0juajmnq_idx_0 * ft0juajmnq_idx_0 + ft0juajmnq_idx_1
* ft0juajmnq_idx_1 ) + ft0juajmnq_idx_2 * ft0juajmnq_idx_2 ) + rtP .
Normalization2_Bias ) ; hqzphhpf0a = ft0juajmnq_idx_0 * m3vqsbhfap ;
o5fbh12wbo = ft0juajmnq_idx_1 * m3vqsbhfap ; adobezhicd = ft0juajmnq_idx_2 *
m3vqsbhfap ; mhvcpxrr3l [ 0 ] = hqzphhpf0a ; mhvcpxrr3l [ 1 ] = o5fbh12wbo ;
mhvcpxrr3l [ 2 ] = adobezhicd ; m3vqsbhfap = 1.0 / ( muDoubleScalarSqrt ( (
rtB . jzkvyvyuee [ 0 ] * rtB . jzkvyvyuee [ 0 ] + rtB . jzkvyvyuee [ 1 ] *
rtB . jzkvyvyuee [ 1 ] ) + rtB . jzkvyvyuee [ 2 ] * rtB . jzkvyvyuee [ 2 ] )
+ rtP . Normalization3_Bias ) ; nmafzs135o_idx_0 = rtB . jzkvyvyuee [ 0 ] *
m3vqsbhfap ; nmafzs135o_idx_1 = rtB . jzkvyvyuee [ 1 ] * m3vqsbhfap ;
nmafzs135o_idx_2 = rtB . jzkvyvyuee [ 2 ] * m3vqsbhfap ; l1jecu0erz [ 1 ] =
adobezhicd * nmafzs135o_idx_0 ; l1jecu0erz [ 2 ] = hqzphhpf0a *
nmafzs135o_idx_1 ; l1jecu0erz [ 5 ] = o5fbh12wbo * nmafzs135o_idx_0 ;
nmafzs135o_idx_0 = o5fbh12wbo * nmafzs135o_idx_2 - adobezhicd *
nmafzs135o_idx_1 ; nmafzs135o_idx_1 = l1jecu0erz [ 1 ] - hqzphhpf0a *
nmafzs135o_idx_2 ; nmafzs135o_idx_2 = l1jecu0erz [ 2 ] - l1jecu0erz [ 5 ] ;
m3vqsbhfap = 1.0 / ( muDoubleScalarSqrt ( ( nmafzs135o_idx_0 *
nmafzs135o_idx_0 + nmafzs135o_idx_1 * nmafzs135o_idx_1 ) + nmafzs135o_idx_2 *
nmafzs135o_idx_2 ) + rtP . Normalization5_Bias ) ; nmafzs135o_idx_0 *=
m3vqsbhfap ; nmafzs135o_idx_1 *= m3vqsbhfap ; nmafzs135o_idx_2 *= m3vqsbhfap
; l1jecu0erz [ 0 ] = o5fbh12wbo * nmafzs135o_idx_2 ; l1jecu0erz [ 1 ] =
adobezhicd * nmafzs135o_idx_0 ; l1jecu0erz [ 2 ] = hqzphhpf0a *
nmafzs135o_idx_1 ; l1jecu0erz [ 3 ] = adobezhicd * nmafzs135o_idx_1 ;
l1jecu0erz [ 4 ] = hqzphhpf0a * nmafzs135o_idx_2 ; l1jecu0erz [ 5 ] =
o5fbh12wbo * nmafzs135o_idx_0 ; mhvcpxrr3l [ 3 ] = nmafzs135o_idx_0 ;
mhvcpxrr3l [ 6 ] = l1jecu0erz [ 0 ] - l1jecu0erz [ 3 ] ; mhvcpxrr3l [ 4 ] =
nmafzs135o_idx_1 ; mhvcpxrr3l [ 7 ] = l1jecu0erz [ 1 ] - l1jecu0erz [ 4 ] ;
mhvcpxrr3l [ 5 ] = nmafzs135o_idx_2 ; mhvcpxrr3l [ 8 ] = l1jecu0erz [ 2 ] -
l1jecu0erz [ 5 ] ; for ( i = 0 ; i < 3 ; i ++ ) { ogoyiankqg [ 3 * i ] =
mhvcpxrr3l [ i ] ; ogoyiankqg [ 1 + 3 * i ] = mhvcpxrr3l [ i + 3 ] ;
ogoyiankqg [ 2 + 3 * i ] = mhvcpxrr3l [ i + 6 ] ; } memcpy ( & mhvcpxrr3l [ 0
] , & ogoyiankqg [ 0 ] , 9U * sizeof ( real_T ) ) ; for ( i = 0 ; i < 3 ; i
++ ) { for ( idxStart = 0 ; idxStart < 3 ; idxStart ++ ) { ogoyiankqg [
idxStart + 3 * i ] = 0.0 ; ogoyiankqg [ idxStart + 3 * i ] += mhvcpxrr3l [ 3
* i ] * rtB . igtrb0xxov [ idxStart ] ; ogoyiankqg [ idxStart + 3 * i ] +=
mhvcpxrr3l [ 3 * i + 1 ] * rtB . igtrb0xxov [ idxStart + 3 ] ; ogoyiankqg [
idxStart + 3 * i ] += mhvcpxrr3l [ 3 * i + 2 ] * rtB . igtrb0xxov [ idxStart
+ 6 ] ; } } gtgn40wmng [ 0 ] = muDoubleScalarSqrt ( ( ( ogoyiankqg [ 0 ] +
ogoyiankqg [ 4 ] ) + ogoyiankqg [ 8 ] ) + 1.0 ) * 0.5 ; if ( gtgn40wmng [ 0 ]
!= 0.0 ) { m3vqsbhfap = 1.0 / ( 4.0 * gtgn40wmng [ 0 ] ) ; gtgn40wmng [ 1 ] =
( ogoyiankqg [ 7 ] - ogoyiankqg [ 5 ] ) * m3vqsbhfap ; gtgn40wmng [ 2 ] = (
ogoyiankqg [ 2 ] - ogoyiankqg [ 6 ] ) * m3vqsbhfap ; gtgn40wmng [ 3 ] = (
ogoyiankqg [ 3 ] - ogoyiankqg [ 1 ] ) * m3vqsbhfap ; } else { gtgn40wmng [ 1
] = muDoubleScalarSqrt ( ( ogoyiankqg [ 0 ] + 1.0 ) * 0.5 ) ; gtgn40wmng [ 2
] = muDoubleScalarSqrt ( ( ogoyiankqg [ 4 ] + 1.0 ) * 0.5 ) *
muDoubleScalarSign ( ogoyiankqg [ 3 ] ) ; gtgn40wmng [ 3 ] =
muDoubleScalarSqrt ( ( ogoyiankqg [ 8 ] + 1.0 ) * 0.5 ) * muDoubleScalarSign
( ogoyiankqg [ 6 ] ) ; } rtB . loo5xvtgsh [ 0 ] = gtgn40wmng [ 0 ] ; rtB .
loo5xvtgsh [ 1 ] = gtgn40wmng [ 1 ] ; rtB . loo5xvtgsh [ 2 ] = gtgn40wmng [ 2
] ; rtB . loo5xvtgsh [ 3 ] = gtgn40wmng [ 3 ] ; srUpdateBC ( rtDW .
bpgaewctmf ) ; } else { rtB . loo5xvtgsh [ 0 ] = rtDW . fa0uzeqpit [ 0 ] ;
rtB . loo5xvtgsh [ 1 ] = rtDW . fa0uzeqpit [ 1 ] ; rtB . loo5xvtgsh [ 2 ] =
rtDW . fa0uzeqpit [ 2 ] ; rtB . loo5xvtgsh [ 3 ] = rtDW . fa0uzeqpit [ 3 ] ;
srUpdateBC ( rtDW . l023zsos0w ) ; } rtB . k3ljcleoid [ 0 ] = rtB .
loo5xvtgsh [ 0 ] ; rtB . k3ljcleoid [ 1 ] = rtB . loo5xvtgsh [ 1 ] ; rtB .
k3ljcleoid [ 2 ] = rtB . loo5xvtgsh [ 2 ] ; rtB . k3ljcleoid [ 3 ] = rtB .
loo5xvtgsh [ 3 ] ; srUpdateBC ( rtDW . eoo2421vkh ) ; } if ( rtP .
Constant6_Value == 1.0 ) { m3vqsbhfap = muDoubleScalarSqrt ( ( ( rtB .
k3ljcleoid [ 0 ] * rtB . k3ljcleoid [ 0 ] + rtB . k3ljcleoid [ 1 ] * rtB .
k3ljcleoid [ 1 ] ) + rtB . k3ljcleoid [ 2 ] * rtB . k3ljcleoid [ 2 ] ) + rtB
. k3ljcleoid [ 3 ] * rtB . k3ljcleoid [ 3 ] ) ; adobezhicd = rtB . k3ljcleoid
[ 2 ] / m3vqsbhfap ; o5fbh12wbo = rtB . k3ljcleoid [ 3 ] / m3vqsbhfap ;
nmafzs135o_idx_2 = rtB . k3ljcleoid [ 1 ] / m3vqsbhfap ; bxkgw4nx0n = rtB .
k3ljcleoid [ 0 ] / m3vqsbhfap ; m3vqsbhfap = ( ( ( rtP . Constant_Value -
adobezhicd * adobezhicd ) - o5fbh12wbo * o5fbh12wbo ) * rtP . Gain2_Gain *
rtP . Constant_Value_gxmqunm0u0 [ 0 ] + ( nmafzs135o_idx_2 * adobezhicd +
bxkgw4nx0n * o5fbh12wbo ) * rtP . Gain_Gain * rtP . Constant_Value_gxmqunm0u0
[ 1 ] ) + ( nmafzs135o_idx_2 * o5fbh12wbo - bxkgw4nx0n * adobezhicd ) * rtP .
Gain1_Gain * rtP . Constant_Value_gxmqunm0u0 [ 2 ] ; hqzphhpf0a = ( ( ( rtP .
Constant_Value_l5mn50z5cq - nmafzs135o_idx_2 * nmafzs135o_idx_2 ) -
o5fbh12wbo * o5fbh12wbo ) * rtP . Gain2_Gain_a5r1lslwra * rtP .
Constant_Value_gxmqunm0u0 [ 1 ] + ( nmafzs135o_idx_2 * adobezhicd -
bxkgw4nx0n * o5fbh12wbo ) * rtP . Gain_Gain_pi5uhcql0z * rtP .
Constant_Value_gxmqunm0u0 [ 0 ] ) + ( bxkgw4nx0n * nmafzs135o_idx_2 +
adobezhicd * o5fbh12wbo ) * rtP . Gain1_Gain_fhzwrqpxwn * rtP .
Constant_Value_gxmqunm0u0 [ 2 ] ; adobezhicd = ( ( nmafzs135o_idx_2 *
o5fbh12wbo + bxkgw4nx0n * adobezhicd ) * rtP . Gain_Gain_lliryqv0lr * rtP .
Constant_Value_gxmqunm0u0 [ 0 ] + ( adobezhicd * o5fbh12wbo - bxkgw4nx0n *
nmafzs135o_idx_2 ) * rtP . Gain1_Gain_jqcyn3sr2w * rtP .
Constant_Value_gxmqunm0u0 [ 1 ] ) + ( ( rtP . Constant_Value_lrvooetugt -
nmafzs135o_idx_2 * nmafzs135o_idx_2 ) - adobezhicd * adobezhicd ) * rtP .
Gain2_Gain_gplc4ydenu * rtP . Constant_Value_gxmqunm0u0 [ 2 ] ;
nmafzs135o_idx_0 = muDoubleScalarSqrt ( ( ( rtB . k3ljcleoid [ 0 ] * rtB .
k3ljcleoid [ 0 ] + rtB . k3ljcleoid [ 1 ] * rtB . k3ljcleoid [ 1 ] ) + rtB .
k3ljcleoid [ 2 ] * rtB . k3ljcleoid [ 2 ] ) + rtB . k3ljcleoid [ 3 ] * rtB .
k3ljcleoid [ 3 ] ) ; o5fbh12wbo = rtB . k3ljcleoid [ 2 ] / nmafzs135o_idx_0 ;
nmafzs135o_idx_2 = rtB . k3ljcleoid [ 3 ] / nmafzs135o_idx_0 ; bxkgw4nx0n =
rtB . k3ljcleoid [ 1 ] / nmafzs135o_idx_0 ; gk40pgs4ff = rtB . k3ljcleoid [ 0
] / nmafzs135o_idx_0 ; nmafzs135o_idx_0 = ( ( ( rtP .
Constant_Value_c5k4awpww5 - o5fbh12wbo * o5fbh12wbo ) - nmafzs135o_idx_2 *
nmafzs135o_idx_2 ) * rtP . Gain2_Gain_lxqqvcp1dv * rtP .
Constant1_Value_kpkyenjwdq [ 0 ] + ( bxkgw4nx0n * o5fbh12wbo + gk40pgs4ff *
nmafzs135o_idx_2 ) * rtP . Gain_Gain_igquidva0x * rtP .
Constant1_Value_kpkyenjwdq [ 1 ] ) + ( bxkgw4nx0n * nmafzs135o_idx_2 -
gk40pgs4ff * o5fbh12wbo ) * rtP . Gain1_Gain_gutlcr5n0l * rtP .
Constant1_Value_kpkyenjwdq [ 2 ] ; nmafzs135o_idx_1 = ( ( ( rtP .
Constant_Value_ecblqlsacg - bxkgw4nx0n * bxkgw4nx0n ) - nmafzs135o_idx_2 *
nmafzs135o_idx_2 ) * rtP . Gain2_Gain_a5mzwuqcxa * rtP .
Constant1_Value_kpkyenjwdq [ 1 ] + ( bxkgw4nx0n * o5fbh12wbo - gk40pgs4ff *
nmafzs135o_idx_2 ) * rtP . Gain_Gain_ivgqmscmom * rtP .
Constant1_Value_kpkyenjwdq [ 0 ] ) + ( gk40pgs4ff * bxkgw4nx0n + o5fbh12wbo *
nmafzs135o_idx_2 ) * rtP . Gain1_Gain_erhzz1d1jc * rtP .
Constant1_Value_kpkyenjwdq [ 2 ] ; o5fbh12wbo = ( ( bxkgw4nx0n *
nmafzs135o_idx_2 + gk40pgs4ff * o5fbh12wbo ) * rtP . Gain_Gain_m4fytnehbd *
rtP . Constant1_Value_kpkyenjwdq [ 0 ] + ( o5fbh12wbo * nmafzs135o_idx_2 -
gk40pgs4ff * bxkgw4nx0n ) * rtP . Gain1_Gain_nlppff24em * rtP .
Constant1_Value_kpkyenjwdq [ 1 ] ) + ( ( rtP . Constant_Value_iqmtoqh2vp -
bxkgw4nx0n * bxkgw4nx0n ) - o5fbh12wbo * o5fbh12wbo ) * rtP .
Gain2_Gain_dnlg4rbf3l * rtP . Constant1_Value_kpkyenjwdq [ 2 ] ; mhvcpxrr3l [
0 ] = rtP . Constant1_Value ; mhvcpxrr3l [ 1 ] = adobezhicd ; mhvcpxrr3l [ 2
] = rtP . Gain3_Gain * hqzphhpf0a ; mhvcpxrr3l [ 3 ] = rtP . Gain4_Gain *
adobezhicd ; mhvcpxrr3l [ 4 ] = rtP . Constant2_Value ; mhvcpxrr3l [ 5 ] =
m3vqsbhfap ; mhvcpxrr3l [ 6 ] = hqzphhpf0a ; mhvcpxrr3l [ 7 ] = rtP .
Gain1_Gain_eay2spzcgy * m3vqsbhfap ; mhvcpxrr3l [ 8 ] = rtP . Constant3_Value
; ogoyiankqg [ 0 ] = rtP . Constant1_Value_gywsazy05k ; ogoyiankqg [ 1 ] =
o5fbh12wbo ; ogoyiankqg [ 2 ] = rtP . Gain3_Gain_ebexp5cpru *
nmafzs135o_idx_1 ; ogoyiankqg [ 3 ] = rtP . Gain4_Gain_jsw1usbw51 *
o5fbh12wbo ; ogoyiankqg [ 4 ] = rtP . Constant2_Value_ht5ssv34ga ; ogoyiankqg
[ 5 ] = nmafzs135o_idx_0 ; ogoyiankqg [ 6 ] = nmafzs135o_idx_1 ; ogoyiankqg [
7 ] = rtP . Gain1_Gain_hinlh1vqa3 * nmafzs135o_idx_0 ; ogoyiankqg [ 8 ] = rtP
. Constant3_Value_ftknmtr0cr ; for ( i = 0 ; i < 3 ; i ++ ) { bafeipipwy [ 6
* i ] = mhvcpxrr3l [ 3 * i ] ; bafeipipwy [ 3 + 6 * i ] = ogoyiankqg [ 3 * i
] ; bafeipipwy [ 1 + 6 * i ] = mhvcpxrr3l [ 3 * i + 1 ] ; bafeipipwy [ 4 + 6
* i ] = ogoyiankqg [ 3 * i + 1 ] ; bafeipipwy [ 2 + 6 * i ] = mhvcpxrr3l [ 3
* i + 2 ] ; bafeipipwy [ 5 + 6 * i ] = ogoyiankqg [ 3 * i + 2 ] ; } memcpy (
& bafeipipwy [ 18 ] , & rtB . edjk3wh4gd [ 0 ] , 18U * sizeof ( real_T ) ) ;
for ( i = 0 ; i < 6 ; i ++ ) { for ( idxStart = 0 ; idxStart < 6 ; idxStart
++ ) { imrquoljb4 [ i + 6 * idxStart ] = 0.0 ; hatd3u5u11_p [ i + 6 *
idxStart ] = 0.0 ; for ( i_p = 0 ; i_p < 6 ; i_p ++ ) { imrquoljb4 [ i + 6 *
idxStart ] += rtDW . ismukjvadj [ 6 * i_p + i ] * bafeipipwy [ 6 * i_p +
idxStart ] ; hatd3u5u11_p [ i + 6 * idxStart ] += bafeipipwy [ 6 * i_p + i ]
* rtDW . ismukjvadj [ 6 * idxStart + i_p ] ; } } for ( idxStart = 0 ;
idxStart < 6 ; idxStart ++ ) { nmafzs135o_idx_2 = 0.0 ; for ( i_p = 0 ; i_p <
6 ; i_p ++ ) { nmafzs135o_idx_2 += hatd3u5u11_p [ 6 * i_p + i ] * bafeipipwy
[ 6 * i_p + idxStart ] ; } hatd3u5u11 [ i + 6 * idxStart ] = rtP . fswParams
. estimation . R [ 6 * idxStart + i ] + nmafzs135o_idx_2 ; } } oz3hhcscl4 (
imrquoljb4 , hatd3u5u11 ) ; if ( rtP . Constant7_Value == 0.0 ) { for ( i = 0
; i < 6 ; i ++ ) { imrquoljb4 [ 3 + 6 * i ] = 0.0 ; imrquoljb4 [ 4 + 6 * i ]
= 0.0 ; imrquoljb4 [ 5 + 6 * i ] = 0.0 ; } } for ( i = 0 ; i < 36 ; i ++ ) {
b_I_p [ i ] = 0 ; } for ( i = 0 ; i < 6 ; i ++ ) { b_I_p [ i + 6 * i ] = 1 ;
} for ( i = 0 ; i < 6 ; i ++ ) { for ( idxStart = 0 ; idxStart < 6 ; idxStart
++ ) { nmafzs135o_idx_2 = 0.0 ; for ( i_p = 0 ; i_p < 6 ; i_p ++ ) {
nmafzs135o_idx_2 += imrquoljb4 [ 6 * i_p + i ] * bafeipipwy [ 6 * idxStart +
i_p ] ; } KHI [ i + 6 * idxStart ] = nmafzs135o_idx_2 - ( real_T ) b_I_p [ 6
* idxStart + i ] ; } for ( idxStart = 0 ; idxStart < 6 ; idxStart ++ ) {
hatd3u5u11 [ i + 6 * idxStart ] = 0.0 ; hatd3u5u11_p [ i + 6 * idxStart ] =
0.0 ; for ( i_p = 0 ; i_p < 6 ; i_p ++ ) { hatd3u5u11 [ i + 6 * idxStart ] +=
KHI [ 6 * i_p + i ] * rtDW . ismukjvadj [ 6 * idxStart + i_p ] ; hatd3u5u11_p
[ i + 6 * idxStart ] += imrquoljb4 [ 6 * i_p + i ] * rtP . fswParams .
estimation . R [ 6 * idxStart + i_p ] ; } } } for ( i = 0 ; i < 6 ; i ++ ) {
for ( idxStart = 0 ; idxStart < 6 ; idxStart ++ ) { KHI_p [ i + 6 * idxStart
] = 0.0 ; h2w5rko2ge [ i + 6 * idxStart ] = 0.0 ; for ( i_p = 0 ; i_p < 6 ;
i_p ++ ) { KHI_p [ i + 6 * idxStart ] += hatd3u5u11 [ 6 * i_p + i ] * KHI [ 6
* i_p + idxStart ] ; h2w5rko2ge [ i + 6 * idxStart ] += hatd3u5u11_p [ 6 *
i_p + i ] * imrquoljb4 [ 6 * i_p + idxStart ] ; } } } for ( i = 0 ; i < 36 ;
i ++ ) { rtB . mqrllrhknp [ i ] = KHI_p [ i ] + h2w5rko2ge [ i ] ; }
jj4a1ein4v [ 0 ] = rtP . Gain_Gain_d2ee5bjups * rtB . k3ljcleoid [ 1 ] ;
jj4a1ein4v [ 1 ] = rtB . k3ljcleoid [ 0 ] ; jj4a1ein4v [ 2 ] = rtB .
k3ljcleoid [ 3 ] ; jj4a1ein4v [ 3 ] = rtP . Gain1_Gain_gukw2z34vg * rtB .
k3ljcleoid [ 2 ] ; jj4a1ein4v [ 4 ] = rtP . Gain2_Gain_fd1hdrny0i * rtB .
k3ljcleoid [ 2 ] ; jj4a1ein4v [ 5 ] = rtP . Gain3_Gain_df4fissmij * rtB .
k3ljcleoid [ 3 ] ; jj4a1ein4v [ 6 ] = rtB . k3ljcleoid [ 0 ] ; jj4a1ein4v [ 7
] = rtB . k3ljcleoid [ 1 ] ; jj4a1ein4v [ 8 ] = rtP . Gain4_Gain_jqdgqgtsq5 *
rtB . k3ljcleoid [ 3 ] ; jj4a1ein4v [ 9 ] = rtB . k3ljcleoid [ 2 ] ;
jj4a1ein4v [ 10 ] = rtP . Gain5_Gain * rtB . k3ljcleoid [ 1 ] ; jj4a1ein4v [
11 ] = rtB . k3ljcleoid [ 0 ] ; luueck1yme [ 0 ] = m3vqsbhfap ; luueck1yme [
1 ] = hqzphhpf0a ; luueck1yme [ 2 ] = adobezhicd ; luueck1yme [ 3 ] =
nmafzs135o_idx_0 ; luueck1yme [ 4 ] = nmafzs135o_idx_1 ; luueck1yme [ 5 ] =
o5fbh12wbo ; tmp [ 0 ] = rtB . jzkvyvyuee [ 0 ] ; tmp [ 3 ] =
ft0juajmnq_idx_0 ; tmp [ 1 ] = rtB . jzkvyvyuee [ 1 ] ; tmp [ 4 ] =
ft0juajmnq_idx_1 ; tmp [ 2 ] = rtB . jzkvyvyuee [ 2 ] ; tmp [ 5 ] =
ft0juajmnq_idx_2 ; for ( i = 0 ; i < 6 ; i ++ ) { tmp_p [ i ] = tmp [ i ] -
luueck1yme [ i ] ; } for ( i = 0 ; i < 6 ; i ++ ) { l1jecu0erz [ i ] = 0.0 ;
for ( idxStart = 0 ; idxStart < 6 ; idxStart ++ ) { l1jecu0erz [ i ] +=
imrquoljb4 [ 6 * idxStart + i ] * tmp_p [ idxStart ] ; } } for ( i = 0 ; i <
4 ; i ++ ) { gtgn40wmng [ i ] = ( ( jj4a1ein4v [ i + 4 ] * rtP . Gain6_Gain *
l1jecu0erz [ 1 ] + rtP . Gain6_Gain * jj4a1ein4v [ i ] * l1jecu0erz [ 0 ] ) +
jj4a1ein4v [ i + 8 ] * rtP . Gain6_Gain * l1jecu0erz [ 2 ] ) + rtB .
k3ljcleoid [ i ] ; } m3vqsbhfap = muDoubleScalarSqrt ( ( ( gtgn40wmng [ 0 ] *
gtgn40wmng [ 0 ] + gtgn40wmng [ 1 ] * gtgn40wmng [ 1 ] ) + gtgn40wmng [ 2 ] *
gtgn40wmng [ 2 ] ) + gtgn40wmng [ 3 ] * gtgn40wmng [ 3 ] ) ; rtB . obpruepjlb
[ 0 ] = gtgn40wmng [ 0 ] / m3vqsbhfap ; rtB . obpruepjlb [ 1 ] = gtgn40wmng [
1 ] / m3vqsbhfap ; rtB . obpruepjlb [ 2 ] = gtgn40wmng [ 2 ] / m3vqsbhfap ;
rtB . obpruepjlb [ 3 ] = gtgn40wmng [ 3 ] / m3vqsbhfap ; rtB . nt5aet3d3s [ 0
] = l1jecu0erz [ 3 ] + rtDW . lq50dyklp4 [ 0 ] ; rtB . nt5aet3d3s [ 1 ] =
l1jecu0erz [ 4 ] + rtDW . lq50dyklp4 [ 1 ] ; rtB . nt5aet3d3s [ 2 ] =
l1jecu0erz [ 5 ] + rtDW . lq50dyklp4 [ 2 ] ; srUpdateBC ( rtDW . itbgldrtmn )
; } else { if ( rtP . Constant6_Value == 0.0 ) { rtB . obpruepjlb [ 0 ] = rtB
. k3ljcleoid [ 0 ] ; rtB . obpruepjlb [ 1 ] = rtB . k3ljcleoid [ 1 ] ; rtB .
obpruepjlb [ 2 ] = rtB . k3ljcleoid [ 2 ] ; rtB . obpruepjlb [ 3 ] = rtB .
k3ljcleoid [ 3 ] ; memcpy ( & rtB . mqrllrhknp [ 0 ] , & rtDW . ismukjvadj [
0 ] , 36U * sizeof ( real_T ) ) ; rtB . nt5aet3d3s [ 0 ] = rtDW . lq50dyklp4
[ 0 ] ; rtB . nt5aet3d3s [ 1 ] = rtDW . lq50dyklp4 [ 1 ] ; rtB . nt5aet3d3s [
2 ] = rtDW . lq50dyklp4 [ 2 ] ; srUpdateBC ( rtDW . pacgymw5aw ) ; } } rtB .
chwubaiywm [ 0 ] = rtB . es152orfgm [ 0 ] - rtB . nt5aet3d3s [ 0 ] ; rtB .
chwubaiywm [ 1 ] = rtB . es152orfgm [ 1 ] - rtB . nt5aet3d3s [ 1 ] ; rtB .
chwubaiywm [ 2 ] = rtB . es152orfgm [ 2 ] - rtB . nt5aet3d3s [ 2 ] ;
m3vqsbhfap = muDoubleScalarSqrt ( ( rtB . chwubaiywm [ 0 ] * rtB . chwubaiywm
[ 0 ] + rtB . chwubaiywm [ 1 ] * rtB . chwubaiywm [ 1 ] ) + rtB . chwubaiywm
[ 2 ] * rtB . chwubaiywm [ 2 ] ) ; mhvcpxrr3l [ 0 ] = rtP .
Constant1_Value_h0nyb23dyo ; mhvcpxrr3l [ 1 ] = rtB . chwubaiywm [ 2 ] ;
mhvcpxrr3l [ 2 ] = rtP . Gain_Gain_izh1wtguao * rtB . chwubaiywm [ 1 ] ;
mhvcpxrr3l [ 3 ] = rtP . Gain3_Gain_l235frcyp2 * rtB . chwubaiywm [ 2 ] ;
mhvcpxrr3l [ 4 ] = rtP . Constant2_Value_enlht0un1m ; mhvcpxrr3l [ 5 ] = rtB
. chwubaiywm [ 0 ] ; mhvcpxrr3l [ 6 ] = rtB . chwubaiywm [ 1 ] ; mhvcpxrr3l [
7 ] = rtP . Gain1_Gain_nitzlnqw2a * rtB . chwubaiywm [ 0 ] ; mhvcpxrr3l [ 8 ]
= rtP . Constant3_Value_guvepryqpw ; if ( m3vqsbhfap < 1.0E-10 ) { for ( i =
0 ; i < 9 ; i ++ ) { b_I [ i ] = 0 ; Phi_22 [ i ] = 0 ; } b_I [ 0 ] = 1 ; b_I
[ 4 ] = 1 ; b_I [ 8 ] = 1 ; for ( idxStart = 0 ; idxStart < 3 ; idxStart ++ )
{ Phi_22 [ idxStart + 3 * idxStart ] = 1 ; bafeipipwy [ 6 * idxStart ] = b_I
[ 3 * idxStart ] ; bafeipipwy [ 6 * ( idxStart + 3 ) ] = ( real_T ) a [ 3 *
idxStart ] * rtP . fswParams . estimation . dt ; bafeipipwy [ 3 + 6 *
idxStart ] = 0.0 ; bafeipipwy [ 1 + 6 * idxStart ] = b_I [ 3 * idxStart + 1 ]
; bafeipipwy [ 1 + 6 * ( idxStart + 3 ) ] = ( real_T ) a [ 3 * idxStart + 1 ]
* rtP . fswParams . estimation . dt ; bafeipipwy [ 4 + 6 * idxStart ] = 0.0 ;
bafeipipwy [ 2 + 6 * idxStart ] = b_I [ 3 * idxStart + 2 ] ; bafeipipwy [ 2 +
6 * ( idxStart + 3 ) ] = ( real_T ) a [ 3 * idxStart + 2 ] * rtP . fswParams
. estimation . dt ; bafeipipwy [ 5 + 6 * idxStart ] = 0.0 ; } for ( i = 0 ; i
< 3 ; i ++ ) { bafeipipwy [ 3 + 6 * ( i + 3 ) ] = Phi_22 [ 3 * i ] ;
bafeipipwy [ 4 + 6 * ( i + 3 ) ] = Phi_22 [ 3 * i + 1 ] ; bafeipipwy [ 5 + 6
* ( i + 3 ) ] = Phi_22 [ 3 * i + 2 ] ; } } else { for ( i = 0 ; i < 9 ; i ++
) { b_I [ i ] = 0 ; Phi_22 [ i ] = 0 ; } b_I [ 0 ] = 1 ; b_I [ 4 ] = 1 ; b_I
[ 8 ] = 1 ; hqzphhpf0a = muDoubleScalarSin ( m3vqsbhfap * rtP . fswParams .
estimation . dt ) / m3vqsbhfap ; adobezhicd = muDoubleScalarCos ( m3vqsbhfap
* rtP . fswParams . estimation . dt ) ; o5fbh12wbo = m3vqsbhfap * m3vqsbhfap
; nmafzs135o_idx_2 = muDoubleScalarCos ( m3vqsbhfap * rtP . fswParams .
estimation . dt ) ; bxkgw4nx0n = m3vqsbhfap * m3vqsbhfap ; nmafzs135o_idx_0 =
m3vqsbhfap * rtP . fswParams . estimation . dt - muDoubleScalarSin (
m3vqsbhfap * rtP . fswParams . estimation . dt ) ; nmafzs135o_idx_1 =
muDoubleScalarPower ( m3vqsbhfap , 3.0 ) ; for ( idxStart = 0 ; idxStart < 3
; idxStart ++ ) { Phi_22 [ idxStart + 3 * idxStart ] = 1 ; for ( i = 0 ; i <
3 ; i ++ ) { ogoyiankqg [ idxStart + 3 * i ] = 0.0 ; olz4u2wjqo [ idxStart +
3 * i ] = 0.0 ; ogoyiankqg [ idxStart + 3 * i ] += mhvcpxrr3l [ 3 * i ] *
mhvcpxrr3l [ idxStart ] ; olz4u2wjqo [ idxStart + 3 * i ] += mhvcpxrr3l [ 3 *
i ] * mhvcpxrr3l [ idxStart ] ; ogoyiankqg [ idxStart + 3 * i ] += mhvcpxrr3l
[ 3 * i + 1 ] * mhvcpxrr3l [ idxStart + 3 ] ; olz4u2wjqo [ idxStart + 3 * i ]
+= mhvcpxrr3l [ 3 * i + 1 ] * mhvcpxrr3l [ idxStart + 3 ] ; ogoyiankqg [
idxStart + 3 * i ] += mhvcpxrr3l [ 3 * i + 2 ] * mhvcpxrr3l [ idxStart + 6 ]
; olz4u2wjqo [ idxStart + 3 * i ] += mhvcpxrr3l [ 3 * i + 2 ] * mhvcpxrr3l [
idxStart + 6 ] ; } } for ( i = 0 ; i < 3 ; i ++ ) { ft0juajmnq_idx_0 =
mhvcpxrr3l [ 3 * i ] ; bafeipipwy [ 6 * i ] = ogoyiankqg [ 3 * i ] * ( 1.0 -
adobezhicd ) / o5fbh12wbo + ( ( real_T ) b_I [ 3 * i ] - ft0juajmnq_idx_0 *
hqzphhpf0a ) ; bafeipipwy [ 6 * ( i + 3 ) ] = ( ( 1.0 - nmafzs135o_idx_2 ) *
ft0juajmnq_idx_0 / bxkgw4nx0n - ( real_T ) b_a [ 3 * i ] * rtP . fswParams .
estimation . dt ) - olz4u2wjqo [ 3 * i ] * nmafzs135o_idx_0 /
nmafzs135o_idx_1 ; bafeipipwy [ 3 + 6 * i ] = 0.0 ; bafeipipwy [ 3 + 6 * ( i
+ 3 ) ] = Phi_22 [ 3 * i ] ; ft0juajmnq_idx_0 = mhvcpxrr3l [ 3 * i + 1 ] ;
bafeipipwy [ 1 + 6 * i ] = ogoyiankqg [ 3 * i + 1 ] * ( 1.0 - adobezhicd ) /
o5fbh12wbo + ( ( real_T ) b_I [ 3 * i + 1 ] - ft0juajmnq_idx_0 * hqzphhpf0a )
; bafeipipwy [ 1 + 6 * ( i + 3 ) ] = ( ( 1.0 - nmafzs135o_idx_2 ) *
ft0juajmnq_idx_0 / bxkgw4nx0n - ( real_T ) b_a [ 3 * i + 1 ] * rtP .
fswParams . estimation . dt ) - olz4u2wjqo [ 3 * i + 1 ] * nmafzs135o_idx_0 /
nmafzs135o_idx_1 ; bafeipipwy [ 4 + 6 * i ] = 0.0 ; bafeipipwy [ 4 + 6 * ( i
+ 3 ) ] = Phi_22 [ 3 * i + 1 ] ; ft0juajmnq_idx_0 = mhvcpxrr3l [ 3 * i + 2 ]
; bafeipipwy [ 2 + 6 * i ] = ogoyiankqg [ 3 * i + 2 ] * ( 1.0 - adobezhicd )
/ o5fbh12wbo + ( ( real_T ) b_I [ 3 * i + 2 ] - ft0juajmnq_idx_0 * hqzphhpf0a
) ; bafeipipwy [ 2 + 6 * ( i + 3 ) ] = ( ( 1.0 - nmafzs135o_idx_2 ) *
ft0juajmnq_idx_0 / bxkgw4nx0n - ( real_T ) b_a [ 3 * i + 2 ] * rtP .
fswParams . estimation . dt ) - olz4u2wjqo [ 3 * i + 2 ] * nmafzs135o_idx_0 /
nmafzs135o_idx_1 ; bafeipipwy [ 5 + 6 * i ] = 0.0 ; bafeipipwy [ 5 + 6 * ( i
+ 3 ) ] = Phi_22 [ 3 * i + 2 ] ; } } for ( i = 0 ; i < 6 ; i ++ ) { for (
idxStart = 0 ; idxStart < 6 ; idxStart ++ ) { imrquoljb4 [ i + 6 * idxStart ]
= 0.0 ; for ( i_p = 0 ; i_p < 6 ; i_p ++ ) { imrquoljb4 [ i + 6 * idxStart ]
+= rtB . mqrllrhknp [ 6 * i_p + i ] * bafeipipwy [ 6 * i_p + idxStart ] ; } }
} for ( i = 0 ; i < 6 ; i ++ ) { for ( idxStart = 0 ; idxStart < 6 ; idxStart
++ ) { nmafzs135o_idx_2 = 0.0 ; for ( i_p = 0 ; i_p < 6 ; i_p ++ ) {
nmafzs135o_idx_2 += bafeipipwy [ 6 * i_p + idxStart ] * imrquoljb4 [ 6 * i +
i_p ] ; } rtB . ida2tctgp2 [ idxStart + 6 * i ] = rtP . fswParams .
estimation . Qg [ 6 * i + idxStart ] + nmafzs135o_idx_2 ; } } mhvcpxrr3l [ 0
] = rtP . Constant1_Value_f35hg154j0 ; if ( m3vqsbhfap < 1.0E-10 ) {
ft0juajmnq_idx_0 = rtP . Constant_Value_hteor4a5kn ; ft0juajmnq_idx_1 = rtP .
Constant1_Value_buy3qqwwhi ; ft0juajmnq_idx_2 = rtP .
Constant2_Value_lzwp0qxwab ; srUpdateBC ( rtDW . f44n4zoqaq ) ; } else {
hqzphhpf0a = muDoubleScalarSin ( rtP . fswParams . estimation . dt * rtP .
Constant_Value_adgfdn1zan * m3vqsbhfap ) ; ft0juajmnq_idx_0 = hqzphhpf0a *
rtB . chwubaiywm [ 0 ] / m3vqsbhfap ; ft0juajmnq_idx_1 = hqzphhpf0a * rtB .
chwubaiywm [ 1 ] / m3vqsbhfap ; ft0juajmnq_idx_2 = hqzphhpf0a * rtB .
chwubaiywm [ 2 ] / m3vqsbhfap ; srUpdateBC ( rtDW . be2p4vgwja ) ; }
mhvcpxrr3l [ 1 ] = ft0juajmnq_idx_2 ; mhvcpxrr3l [ 4 ] = rtP .
Constant2_Value_e5s0xhvsmx ; mhvcpxrr3l [ 5 ] = ft0juajmnq_idx_0 ; mhvcpxrr3l
[ 6 ] = ft0juajmnq_idx_1 ; mhvcpxrr3l [ 8 ] = rtP .
Constant3_Value_b5l2r3ghc5 ; mhvcpxrr3l [ 2 ] = rtP . Gain_Gain_ddqwqhx5tx *
ft0juajmnq_idx_1 ; mhvcpxrr3l [ 7 ] = rtP . Gain1_Gain_ly5pvjnqag *
ft0juajmnq_idx_0 ; mhvcpxrr3l [ 3 ] = rtP . Gain3_Gain_enevc5eimy *
ft0juajmnq_idx_2 ; m3vqsbhfap = muDoubleScalarCos ( rtP . fswParams .
estimation . dt * rtP . Constant_Value_ib2ewpsxpl * m3vqsbhfap ) ; gtgn40wmng
[ 0 ] = m3vqsbhfap ; gtgn40wmng [ 1 ] = rtP . Gain_Gain_mumivssi3t *
ft0juajmnq_idx_0 ; jj4a1ein4v [ 0 ] = ft0juajmnq_idx_0 ; gtgn40wmng [ 2 ] =
rtP . Gain_Gain_mumivssi3t * ft0juajmnq_idx_1 ; jj4a1ein4v [ 1 ] =
ft0juajmnq_idx_1 ; gtgn40wmng [ 3 ] = rtP . Gain_Gain_mumivssi3t *
ft0juajmnq_idx_2 ; jj4a1ein4v [ 2 ] = ft0juajmnq_idx_2 ; for ( i = 0 ; i < 9
; i ++ ) { jj4a1ein4v [ i + 3 ] = m3vqsbhfap * rtB . epk34rzqnu [ i ] -
mhvcpxrr3l [ i ] ; } for ( i = 0 ; i < 4 ; i ++ ) { katnewkzuf [ i << 2 ] =
gtgn40wmng [ i ] ; katnewkzuf [ 1 + ( i << 2 ) ] = jj4a1ein4v [ 3 * i ] ;
katnewkzuf [ 2 + ( i << 2 ) ] = jj4a1ein4v [ 3 * i + 1 ] ; katnewkzuf [ 3 + (
i << 2 ) ] = jj4a1ein4v [ 3 * i + 2 ] ; } for ( i = 0 ; i < 4 ; i ++ ) {
m3vqsbhfap = katnewkzuf [ i + 12 ] * rtB . obpruepjlb [ 3 ] + ( katnewkzuf [
i + 8 ] * rtB . obpruepjlb [ 2 ] + ( katnewkzuf [ i + 4 ] * rtB . obpruepjlb
[ 1 ] + katnewkzuf [ i ] * rtB . obpruepjlb [ 0 ] ) ) ; gtgn40wmng [ i ] =
m3vqsbhfap ; } m3vqsbhfap = muDoubleScalarSqrt ( ( ( gtgn40wmng [ 0 ] *
gtgn40wmng [ 0 ] + gtgn40wmng [ 1 ] * gtgn40wmng [ 1 ] ) + gtgn40wmng [ 2 ] *
gtgn40wmng [ 2 ] ) + gtgn40wmng [ 3 ] * gtgn40wmng [ 3 ] ) ; rtB . ee30l0u33u
= gtgn40wmng [ 0 ] / m3vqsbhfap ; rtB . i1fwhqeosf = gtgn40wmng [ 1 ] /
m3vqsbhfap ; rtB . fzvlmbe2x0 = gtgn40wmng [ 2 ] / m3vqsbhfap ; rtB .
mh2krcrgw3 = gtgn40wmng [ 3 ] / m3vqsbhfap ; rtB . c1klcpas2f = rtP .
Constant10_Value ; srUpdateBC ( rtDW . hsldxkjyqe ) ; } else { if ( rtDW .
ilthyfodyf ) { ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; rtDW .
ek3tkvtgck = - 1 ; rtDW . ilthyfodyf = false ; } } rtB . b3z40kptxq = ( ( rtB
. l33vh4jdca * rtB . obpruepjlb [ 0 ] - - rtB . dejmsjiytm * rtB . obpruepjlb
[ 1 ] ) - - rtB . evb2ami2f5 * rtB . obpruepjlb [ 2 ] ) - - rtB . bzlumtv1jw
* rtB . obpruepjlb [ 3 ] ; rtB . hlzyk2zeiu = ( ( rtB . l33vh4jdca * rtB .
obpruepjlb [ 1 ] + - rtB . dejmsjiytm * rtB . obpruepjlb [ 0 ] ) + - rtB .
evb2ami2f5 * rtB . obpruepjlb [ 3 ] ) - - rtB . bzlumtv1jw * rtB . obpruepjlb
[ 2 ] ; rtB . jnsdiecjvo = ( ( rtB . l33vh4jdca * rtB . obpruepjlb [ 2 ] - -
rtB . dejmsjiytm * rtB . obpruepjlb [ 3 ] ) + - rtB . evb2ami2f5 * rtB .
obpruepjlb [ 0 ] ) + - rtB . bzlumtv1jw * rtB . obpruepjlb [ 1 ] ; rtB .
dmo32unafg = ( ( rtB . l33vh4jdca * rtB . obpruepjlb [ 3 ] + - rtB .
dejmsjiytm * rtB . obpruepjlb [ 2 ] ) - - rtB . evb2ami2f5 * rtB . obpruepjlb
[ 1 ] ) + - rtB . bzlumtv1jw * rtB . obpruepjlb [ 0 ] ; rtB . dgj40kd3c4 [ 0
] = rtP . Gain3_Gain_g31whpxaxh * rtB . b3z40kptxq ; rtB . dgj40kd3c4 [ 1 ] =
rtP . Gain3_Gain_g31whpxaxh * rtB . hlzyk2zeiu ; rtB . dgj40kd3c4 [ 2 ] = rtP
. Gain3_Gain_g31whpxaxh * rtB . jnsdiecjvo ; rtB . dgj40kd3c4 [ 3 ] = rtP .
Gain3_Gain_g31whpxaxh * rtB . dmo32unafg ; if ( rtB . obpruepjlb [ 0 ] > 1.0
) { nmafzs135o_idx_2 = 1.0 ; } else if ( rtB . obpruepjlb [ 0 ] < - 1.0 ) {
nmafzs135o_idx_2 = - 1.0 ; } else { nmafzs135o_idx_2 = rtB . obpruepjlb [ 0 ]
; } rtB . ifm2ensjiv = rtP . Gain1_Gain_dwko2h5myg * muDoubleScalarAcos (
nmafzs135o_idx_2 ) ; if ( rtB . l33vh4jdca > 1.0 ) { nmafzs135o_idx_2 = 1.0 ;
} else if ( rtB . l33vh4jdca < - 1.0 ) { nmafzs135o_idx_2 = - 1.0 ; } else {
nmafzs135o_idx_2 = rtB . l33vh4jdca ; } rtB . cuhw0sczh3 = rtP .
Gain_Gain_efmbe4yoj3 * muDoubleScalarAcos ( nmafzs135o_idx_2 ) ; rtB .
gz2mbgxqth = ( rtB . cuhw0sczh3 - rtB . ifm2ensjiv ) * rtP .
Gain2_Gain_dndn2znysv ; rtB . ps1qixq3zf = muDoubleScalarSqrt ( ( ( rtB .
b3z40kptxq * rtB . b3z40kptxq + rtB . hlzyk2zeiu * rtB . hlzyk2zeiu ) + rtB .
jnsdiecjvo * rtB . jnsdiecjvo ) + rtB . dmo32unafg * rtB . dmo32unafg ) ;
o5fbh12wbo = muDoubleScalarSqrt ( ( ( rtB . obpruepjlb [ 0 ] * rtB .
obpruepjlb [ 0 ] + rtB . obpruepjlb [ 1 ] * rtB . obpruepjlb [ 1 ] ) + rtB .
obpruepjlb [ 2 ] * rtB . obpruepjlb [ 2 ] ) + rtB . obpruepjlb [ 3 ] * rtB .
obpruepjlb [ 3 ] ) ; m3vqsbhfap = rtB . obpruepjlb [ 2 ] / o5fbh12wbo ;
hqzphhpf0a = rtB . obpruepjlb [ 3 ] / o5fbh12wbo ; adobezhicd = rtB .
obpruepjlb [ 1 ] / o5fbh12wbo ; o5fbh12wbo = rtB . obpruepjlb [ 0 ] /
o5fbh12wbo ; rtB . fj45fplo2h = ( ( ( rtP . Constant_Value_e04ikljkmv -
m3vqsbhfap * m3vqsbhfap ) - hqzphhpf0a * hqzphhpf0a ) * rtP .
Gain2_Gain_op03fmkcim * rtP . Constant8_Value [ 0 ] + ( adobezhicd *
m3vqsbhfap + o5fbh12wbo * hqzphhpf0a ) * rtP . Gain_Gain_bhwu5bylct * rtP .
Constant8_Value [ 1 ] ) + ( adobezhicd * hqzphhpf0a - o5fbh12wbo * m3vqsbhfap
) * rtP . Gain1_Gain_ppz2nua2un * rtP . Constant8_Value [ 2 ] ; rtB .
i0j31orab3 = ( ( ( rtP . Constant_Value_b41hk0kxkh - adobezhicd * adobezhicd
) - hqzphhpf0a * hqzphhpf0a ) * rtP . Gain2_Gain_flvppo5uo3 * rtP .
Constant8_Value [ 1 ] + ( adobezhicd * m3vqsbhfap - o5fbh12wbo * hqzphhpf0a )
* rtP . Gain_Gain_ovw33ojfgh * rtP . Constant8_Value [ 0 ] ) + ( o5fbh12wbo *
adobezhicd + m3vqsbhfap * hqzphhpf0a ) * rtP . Gain1_Gain_dsq2lkmbcs * rtP .
Constant8_Value [ 2 ] ; rtB . fzubazngl3 = ( ( adobezhicd * hqzphhpf0a +
o5fbh12wbo * m3vqsbhfap ) * rtP . Gain_Gain_irsqnwliiv * rtP .
Constant8_Value [ 0 ] + ( m3vqsbhfap * hqzphhpf0a - o5fbh12wbo * adobezhicd )
* rtP . Gain1_Gain_jwm5cb1c12 * rtP . Constant8_Value [ 1 ] ) + ( ( rtP .
Constant_Value_oc2s014i34 - adobezhicd * adobezhicd ) - m3vqsbhfap *
m3vqsbhfap ) * rtP . Gain2_Gain_if0kcnigpw * rtP . Constant8_Value [ 2 ] ;
katnewkzuf [ 0 ] = rtP . Gain1_Gain_mgka3jhv0b * 0.0 ; katnewkzuf [ 4 ] = rtP
. Gain1_Gain_mgka3jhv0b * - rtB . lhspd1b5b3 [ 0 ] ; katnewkzuf [ 1 ] = rtP .
Gain1_Gain_mgka3jhv0b * rtB . lhspd1b5b3 [ 0 ] ; katnewkzuf [ 8 ] = rtP .
Gain1_Gain_mgka3jhv0b * - rtB . lhspd1b5b3 [ 1 ] ; katnewkzuf [ 2 ] = rtP .
Gain1_Gain_mgka3jhv0b * rtB . lhspd1b5b3 [ 1 ] ; katnewkzuf [ 12 ] = rtP .
Gain1_Gain_mgka3jhv0b * - rtB . lhspd1b5b3 [ 2 ] ; katnewkzuf [ 3 ] = rtP .
Gain1_Gain_mgka3jhv0b * rtB . lhspd1b5b3 [ 2 ] ; katnewkzuf [ 5 ] = rtP .
Gain1_Gain_mgka3jhv0b * 0.0 ; katnewkzuf [ 9 ] = rtP . Gain1_Gain_mgka3jhv0b
* rtB . lhspd1b5b3 [ 2 ] ; katnewkzuf [ 13 ] = rtP . Gain1_Gain_mgka3jhv0b *
- rtB . lhspd1b5b3 [ 1 ] ; katnewkzuf [ 6 ] = rtP . Gain1_Gain_mgka3jhv0b * -
rtB . lhspd1b5b3 [ 2 ] ; katnewkzuf [ 10 ] = rtP . Gain1_Gain_mgka3jhv0b *
0.0 ; katnewkzuf [ 14 ] = rtP . Gain1_Gain_mgka3jhv0b * rtB . lhspd1b5b3 [ 0
] ; katnewkzuf [ 7 ] = rtP . Gain1_Gain_mgka3jhv0b * rtB . lhspd1b5b3 [ 1 ] ;
katnewkzuf [ 11 ] = rtP . Gain1_Gain_mgka3jhv0b * - rtB . lhspd1b5b3 [ 0 ] ;
katnewkzuf [ 15 ] = rtP . Gain1_Gain_mgka3jhv0b * 0.0 ; for ( i = 0 ; i < 4 ;
i ++ ) { rtB . gbtlnwgalm [ i ] = 0.0 ; rtB . gbtlnwgalm [ i ] += katnewkzuf
[ i ] * rtB . l33vh4jdca ; rtB . gbtlnwgalm [ i ] += katnewkzuf [ i + 4 ] *
rtB . dejmsjiytm ; rtB . gbtlnwgalm [ i ] += katnewkzuf [ i + 8 ] * rtB .
evb2ami2f5 ; rtB . gbtlnwgalm [ i ] += katnewkzuf [ i + 12 ] * rtB .
bzlumtv1jw ; } UNUSED_PARAMETER ( tid ) ; } void MdlOutputsTID2 ( int_T tid )
{ real_T gqeotn43du [ 6 ] ; real_T acc ; real_T of4jgkg1ew [ 3 ] ; int32_T i
; real_T iwl4ttshkf_idx_1 ; real_T iwl4ttshkf_idx_2 ; real_T iwl4ttshkf_idx_0
; rtB . p0unimm1k0 = ( ( ( rtP . Constant5_Value != 0.0 ) && ( rtP .
Constant9_Value != 0.0 ) ) == ( int32_T ) rtP . CompareToConstant_const ) ;
rtB . of1r505p3n = ( rtP . Constant6_Value != 0.0 ) ; rtB . lhspd1b5b3 [ 0 ]
= rtP . Constant4_Value [ 0 ] ; rtB . lhspd1b5b3 [ 1 ] = rtP .
Constant4_Value [ 1 ] ; rtB . lhspd1b5b3 [ 2 ] = rtP . Constant4_Value [ 2 ]
; acc = 1.0 / ( muDoubleScalarSqrt ( ( rtP . Constant1_Value_kpkyenjwdq [ 0 ]
* rtP . Constant1_Value_kpkyenjwdq [ 0 ] + rtP . Constant1_Value_kpkyenjwdq [
1 ] * rtP . Constant1_Value_kpkyenjwdq [ 1 ] ) + rtP .
Constant1_Value_kpkyenjwdq [ 2 ] * rtP . Constant1_Value_kpkyenjwdq [ 2 ] ) +
rtP . Normalization_Bias ) ; iwl4ttshkf_idx_0 = rtP .
Constant1_Value_kpkyenjwdq [ 0 ] * acc ; iwl4ttshkf_idx_1 = rtP .
Constant1_Value_kpkyenjwdq [ 1 ] * acc ; iwl4ttshkf_idx_2 = rtP .
Constant1_Value_kpkyenjwdq [ 2 ] * acc ; rtB . igtrb0xxov [ 0 ] =
iwl4ttshkf_idx_0 ; rtB . igtrb0xxov [ 1 ] = iwl4ttshkf_idx_1 ; rtB .
igtrb0xxov [ 2 ] = iwl4ttshkf_idx_2 ; acc = 1.0 / ( muDoubleScalarSqrt ( (
rtP . Constant_Value_gxmqunm0u0 [ 0 ] * rtP . Constant_Value_gxmqunm0u0 [ 0 ]
+ rtP . Constant_Value_gxmqunm0u0 [ 1 ] * rtP . Constant_Value_gxmqunm0u0 [ 1
] ) + rtP . Constant_Value_gxmqunm0u0 [ 2 ] * rtP . Constant_Value_gxmqunm0u0
[ 2 ] ) + rtP . Normalization1_Bias ) ; of4jgkg1ew [ 0 ] = rtP .
Constant_Value_gxmqunm0u0 [ 0 ] * acc ; of4jgkg1ew [ 1 ] = rtP .
Constant_Value_gxmqunm0u0 [ 1 ] * acc ; of4jgkg1ew [ 2 ] = rtP .
Constant_Value_gxmqunm0u0 [ 2 ] * acc ; gqeotn43du [ 1 ] = iwl4ttshkf_idx_2 *
of4jgkg1ew [ 0 ] ; gqeotn43du [ 2 ] = iwl4ttshkf_idx_0 * of4jgkg1ew [ 1 ] ;
gqeotn43du [ 5 ] = iwl4ttshkf_idx_1 * of4jgkg1ew [ 0 ] ; of4jgkg1ew [ 0 ] =
iwl4ttshkf_idx_1 * of4jgkg1ew [ 2 ] - iwl4ttshkf_idx_2 * of4jgkg1ew [ 1 ] ;
of4jgkg1ew [ 1 ] = gqeotn43du [ 1 ] - iwl4ttshkf_idx_0 * of4jgkg1ew [ 2 ] ;
of4jgkg1ew [ 2 ] = gqeotn43du [ 2 ] - gqeotn43du [ 5 ] ; acc = 1.0 / (
muDoubleScalarSqrt ( ( of4jgkg1ew [ 0 ] * of4jgkg1ew [ 0 ] + of4jgkg1ew [ 1 ]
* of4jgkg1ew [ 1 ] ) + of4jgkg1ew [ 2 ] * of4jgkg1ew [ 2 ] ) + rtP .
Normalization4_Bias ) ; of4jgkg1ew [ 0 ] *= acc ; of4jgkg1ew [ 1 ] *= acc ;
of4jgkg1ew [ 2 ] *= acc ; gqeotn43du [ 0 ] = iwl4ttshkf_idx_1 * of4jgkg1ew [
2 ] ; gqeotn43du [ 1 ] = iwl4ttshkf_idx_2 * of4jgkg1ew [ 0 ] ; gqeotn43du [ 2
] = iwl4ttshkf_idx_0 * of4jgkg1ew [ 1 ] ; gqeotn43du [ 3 ] = iwl4ttshkf_idx_2
* of4jgkg1ew [ 1 ] ; gqeotn43du [ 4 ] = iwl4ttshkf_idx_0 * of4jgkg1ew [ 2 ] ;
gqeotn43du [ 5 ] = iwl4ttshkf_idx_1 * of4jgkg1ew [ 0 ] ; for ( i = 0 ; i < 3
; i ++ ) { rtB . igtrb0xxov [ i + 3 ] = of4jgkg1ew [ i ] ; rtB . igtrb0xxov [
i + 6 ] = gqeotn43du [ i ] - gqeotn43du [ i + 3 ] ; rtB . edjk3wh4gd [ 6 * i
] = rtP . Constant2_Value_i4dkrdfott [ 3 * i ] ; rtB . edjk3wh4gd [ 3 + 6 * i
] = rtP . Constant1_Value_c2dxafuacz [ 3 * i ] ; rtB . edjk3wh4gd [ 1 + 6 * i
] = rtP . Constant2_Value_i4dkrdfott [ 3 * i + 1 ] ; rtB . edjk3wh4gd [ 4 + 6
* i ] = rtP . Constant1_Value_c2dxafuacz [ 3 * i + 1 ] ; rtB . edjk3wh4gd [ 2
+ 6 * i ] = rtP . Constant2_Value_i4dkrdfott [ 3 * i + 2 ] ; rtB . edjk3wh4gd
[ 5 + 6 * i ] = rtP . Constant1_Value_c2dxafuacz [ 3 * i + 2 ] ; if ( rtP .
Constant7_Value > rtP . SwitchesdependingonifGyroisoffline_Threshold ) { rtB
. es152orfgm [ i ] = rtB . lhspd1b5b3 [ i ] ; } else { rtB . es152orfgm [ i ]
= rtP . Constant_Value_jdndcrmtkc [ i ] ; } } srUpdateBC ( rtDW . hsldxkjyqe
) ; UNUSED_PARAMETER ( tid ) ; } void MdlUpdate ( int_T tid ) { rtDW .
hmtmt5gwtt [ 0 ] = rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . owi0qnn13s [ 0 ] ) *
rtP . RandomNumber_StdDev [ 0 ] + rtP . RandomNumber_Mean ; rtDW . hmtmt5gwtt
[ 1 ] = rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . owi0qnn13s [ 1 ] ) * rtP .
RandomNumber_StdDev [ 1 ] + rtP . RandomNumber_Mean ; rtDW . hmtmt5gwtt [ 2 ]
= rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . owi0qnn13s [ 2 ] ) * rtP .
RandomNumber_StdDev [ 2 ] + rtP . RandomNumber_Mean ; rtDW . eo2izelnsp [ 0 ]
+= rtP . DiscreteTimeIntegrator_gainval * rtB . gbtlnwgalm [ 0 ] ; rtDW .
eo2izelnsp [ 1 ] += rtP . DiscreteTimeIntegrator_gainval * rtB . gbtlnwgalm [
1 ] ; rtDW . eo2izelnsp [ 2 ] += rtP . DiscreteTimeIntegrator_gainval * rtB .
gbtlnwgalm [ 2 ] ; rtDW . eo2izelnsp [ 3 ] += rtP .
DiscreteTimeIntegrator_gainval * rtB . gbtlnwgalm [ 3 ] ; rtDW . jk5uei3ei4 [
0 ] = rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . nn2tfrewz5 [ 0 ] ) * rtP .
RandomNumber1_StdDev [ 0 ] + rtP . RandomNumber1_Mean ; rtDW . jk5uei3ei4 [ 1
] = rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . nn2tfrewz5 [ 1 ] ) * rtP .
RandomNumber1_StdDev [ 1 ] + rtP . RandomNumber1_Mean ; rtDW . jk5uei3ei4 [ 2
] = rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . nn2tfrewz5 [ 2 ] ) * rtP .
RandomNumber1_StdDev [ 2 ] + rtP . RandomNumber1_Mean ; rtDW . gdylcuu45e =
rtB . dlusutdiez ; if ( rtDW . ilthyfodyf ) { rtDW . ic3jrlr0jz = rtP .
Constant1_Value_jmutz103sv ; rtDW . jr51z3zb5d [ 0 ] = rtB . ee30l0u33u ;
rtDW . jr51z3zb5d [ 1 ] = rtB . i1fwhqeosf ; rtDW . jr51z3zb5d [ 2 ] = rtB .
fzvlmbe2x0 ; rtDW . jr51z3zb5d [ 3 ] = rtB . mh2krcrgw3 ; if ( rtDW .
ek3tkvtgck == 1 ) { rtDW . fa0uzeqpit [ 0 ] = rtB . loo5xvtgsh [ 0 ] ; rtDW .
fa0uzeqpit [ 1 ] = rtB . loo5xvtgsh [ 1 ] ; rtDW . fa0uzeqpit [ 2 ] = rtB .
loo5xvtgsh [ 2 ] ; rtDW . fa0uzeqpit [ 3 ] = rtB . loo5xvtgsh [ 3 ] ; }
memcpy ( & rtDW . ismukjvadj [ 0 ] , & rtB . ida2tctgp2 [ 0 ] , 36U * sizeof
( real_T ) ) ; rtDW . lq50dyklp4 [ 0 ] = rtB . nt5aet3d3s [ 0 ] ; rtDW .
lq50dyklp4 [ 1 ] = rtB . nt5aet3d3s [ 1 ] ; rtDW . lq50dyklp4 [ 2 ] = rtB .
nt5aet3d3s [ 2 ] ; } UNUSED_PARAMETER ( tid ) ; } void MdlUpdateTID2 ( int_T
tid ) { UNUSED_PARAMETER ( tid ) ; } void MdlTerminate ( void ) { if (
rt_slioCatalogue ( ) != ( NULL ) ) { void * * slioCatalogueAddr =
rt_slioCatalogueAddr ( ) ; rtwSaveDatasetsToMatFile (
rtwGetPointerFromUniquePtr ( rt_slioCatalogue ( ) ) ,
rt_GetMatSigstreamLoggingFileName ( ) ) ; rtwTerminateSlioCatalogue (
slioCatalogueAddr ) ; * slioCatalogueAddr = NULL ; } } void
MdlInitializeSizes ( void ) { ssSetNumContStates ( rtS , 0 ) ; ssSetNumY (
rtS , 0 ) ; ssSetNumU ( rtS , 0 ) ; ssSetDirectFeedThrough ( rtS , 0 ) ;
ssSetNumSampleTimes ( rtS , 2 ) ; ssSetNumBlocks ( rtS , 592 ) ;
ssSetNumBlockIO ( rtS , 46 ) ; ssSetNumBlockParams ( rtS , 184 ) ; } void
MdlInitializeSampleTimes ( void ) { ssSetSampleTime ( rtS , 0 , 0.1 ) ;
ssSetSampleTime ( rtS , 1 , 1.0 ) ; ssSetOffsetTime ( rtS , 0 , 0.0 ) ;
ssSetOffsetTime ( rtS , 1 , 0.0 ) ; } void raccel_set_checksum ( ) {
ssSetChecksumVal ( rtS , 0 , 2311783776U ) ; ssSetChecksumVal ( rtS , 1 ,
2513219590U ) ; ssSetChecksumVal ( rtS , 2 , 126627232U ) ; ssSetChecksumVal
( rtS , 3 , 2807901779U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( void ) { static struct _ssMdlInfo mdlInfo
; ( void ) memset ( ( char * ) rtS , 0 , sizeof ( SimStruct ) ) ; ( void )
memset ( ( char * ) & mdlInfo , 0 , sizeof ( struct _ssMdlInfo ) ) ;
ssSetMdlInfoPtr ( rtS , & mdlInfo ) ; { static time_T mdlPeriod [
NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T
mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ;
static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T
mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits
[ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [
NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) {
mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ;
mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS ,
& mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , &
mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ;
ssSetTNextWasAdjustedPtr ( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ;
ssSetPerTaskSampleHitsPtr ( rtS , & mdlPerTaskSampleHits [ 0 ] ) ;
ssSetTimeOfNextSampleHitPtr ( rtS , & mdlTimeOfNextSampleHit [ 0 ] ) ; }
ssSetSolverMode ( rtS , SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS ,
( ( void * ) & rtB ) ) ; ( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof
( B ) ) ; } { void * dwork = ( void * ) & rtDW ; ssSetRootDWork ( rtS , dwork
) ; ( void ) memset ( dwork , 0 , sizeof ( DW ) ) ; } { static
DataTypeTransInfo dtInfo ; ( void ) memset ( ( char_T * ) & dtInfo , 0 ,
sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS , & dtInfo ) ; dtInfo .
numDataTypes = 32 ; dtInfo . dataTypeSizes = & rtDataTypeSizes [ 0 ] ; dtInfo
. dataTypeNames = & rtDataTypeNames [ 0 ] ; dtInfo . BTransTable = &
rtBTransTable ; dtInfo . PTransTable = & rtPTransTable ; dtInfo .
dataTypeInfoTable = rtDataTypeInfoTable ; }
UnitTestDebug_InitializeDataMapInfo ( ) ; ssSetIsRapidAcceleratorActive ( rtS
, true ) ; ssSetRootSS ( rtS , rtS ) ; ssSetVersion ( rtS ,
SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS , "UnitTestDebug" ) ;
ssSetPath ( rtS , "UnitTestDebug" ) ; ssSetTStart ( rtS , 0.0 ) ; ssSetTFinal
( rtS , 1000.0 ) ; ssSetStepSize ( rtS , 0.1 ) ; ssSetFixedStepSize ( rtS ,
0.1 ) ; { static RTWLogInfo rt_DataLoggingInfo ; rt_DataLoggingInfo .
loggingInterval = NULL ; ssSetRTWLogInfo ( rtS , & rt_DataLoggingInfo ) ; } {
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogXSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; rtliSetLogT (
ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX ( ssGetRTWLogInfo ( rtS ) ,
"" ) ; rtliSetLogXFinal ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 4 ) ; rtliSetLogMaxRows (
ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogDecimation ( ssGetRTWLogInfo ( rtS
) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
ssSolverInfo slvrInfo ; ssSetSolverInfo ( rtS , & slvrInfo ) ;
ssSetSolverName ( rtS , "FixedStepDiscrete" ) ; ssSetVariableStepSolver ( rtS
, 0 ) ; ssSetSolverConsistencyChecking ( rtS , 0 ) ;
ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ; ssSetSolverRobustResetMethod (
rtS , 0 ) ; ssSetSolverStateProjection ( rtS , 0 ) ;
ssSetSolverMassMatrixType ( rtS , ( ssMatrixType ) 0 ) ;
ssSetSolverMassMatrixNzMax ( rtS , 0 ) ; ssSetModelOutputs ( rtS , MdlOutputs
) ; ssSetModelLogData ( rtS , rt_UpdateTXYLogVars ) ;
ssSetModelLogDataIfInInterval ( rtS , rt_UpdateTXXFYLogVars ) ;
ssSetModelUpdate ( rtS , MdlUpdate ) ; ssSetTNextTid ( rtS , INT_MIN ) ;
ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 0 ) ; } ssSetChecksumVal ( rtS , 0 ,
2311783776U ) ; ssSetChecksumVal ( rtS , 1 , 2513219590U ) ; ssSetChecksumVal
( rtS , 2 , 126627232U ) ; ssSetChecksumVal ( rtS , 3 , 2807901779U ) ; {
static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE ; static
RTWExtModeInfo rt_ExtModeInfo ; static const sysRanDType * systemRan [ 14 ] ;
gblRTWExtModeInfo = & rt_ExtModeInfo ; ssSetRTWExtModeInfo ( rtS , &
rt_ExtModeInfo ) ; rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo ,
systemRan ) ; systemRan [ 0 ] = & rtAlwaysEnabled ; systemRan [ 1 ] = (
sysRanDType * ) & rtDW . l023zsos0w ; systemRan [ 2 ] = ( sysRanDType * ) &
rtDW . bpgaewctmf ; systemRan [ 3 ] = ( sysRanDType * ) & rtDW . bpgaewctmf ;
systemRan [ 4 ] = ( sysRanDType * ) & rtDW . eoo2421vkh ; systemRan [ 5 ] = (
sysRanDType * ) & rtDW . pacgymw5aw ; systemRan [ 6 ] = ( sysRanDType * ) &
rtDW . d55jaht4oo ; systemRan [ 7 ] = ( sysRanDType * ) & rtDW . itbgldrtmn ;
systemRan [ 8 ] = ( sysRanDType * ) & rtDW . itbgldrtmn ; systemRan [ 9 ] = (
sysRanDType * ) & rtDW . hsldxkjyqe ; systemRan [ 10 ] = ( sysRanDType * ) &
rtDW . be2p4vgwja ; systemRan [ 11 ] = ( sysRanDType * ) & rtDW . f44n4zoqaq
; systemRan [ 12 ] = ( sysRanDType * ) & rtDW . hsldxkjyqe ; systemRan [ 13 ]
= & rtAlwaysEnabled ; rteiSetModelMappingInfoPtr ( ssGetRTWExtModeInfo ( rtS
) , & ssGetModelMappingInfo ( rtS ) ) ; rteiSetChecksumsPtr (
ssGetRTWExtModeInfo ( rtS ) , ssGetChecksums ( rtS ) ) ; rteiSetTPtr (
ssGetRTWExtModeInfo ( rtS ) , ssGetTPtr ( rtS ) ) ; } return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
const int_T gblParameterTuningTid = 2 ; void MdlOutputsParameterSampleTime (
int_T tid ) { MdlOutputsTID2 ( tid ) ; }
