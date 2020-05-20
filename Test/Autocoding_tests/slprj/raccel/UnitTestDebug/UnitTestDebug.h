#include "__cf_UnitTestDebug.h"
#ifndef RTW_HEADER_UnitTestDebug_h_
#define RTW_HEADER_UnitTestDebug_h_
#include <stddef.h>
#include <string.h>
#include "rtw_modelmap.h"
#ifndef UnitTestDebug_COMMON_INCLUDES_
#define UnitTestDebug_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "sigstream_rtw.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "UnitTestDebug_types.h"
#include "multiword_types.h"
#include "mwmathutil.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME UnitTestDebug
#define NSAMPLE_TIMES (3) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (46) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (0)   
#elif NCSTATES != 0
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T evb2ami2f5 ; real_T l33vh4jdca ; real_T dejmsjiytm ;
real_T bzlumtv1jw ; real_T h1pvfyoead ; real_T k3ubjuj4xo ; real_T bwa10aik04
; real_T jzkvyvyuee [ 3 ] ; real_T ohsor4jyhe ; real_T fd5wmraa51 ; real_T
kehzuzhs35 ; real_T lhspd1b5b3 [ 3 ] ; real_T b3z40kptxq ; real_T hlzyk2zeiu
; real_T jnsdiecjvo ; real_T dmo32unafg ; real_T dgj40kd3c4 [ 4 ] ; real_T
ifm2ensjiv ; real_T cuhw0sczh3 ; real_T gz2mbgxqth ; real_T ps1qixq3zf ;
real_T fj45fplo2h ; real_T i0j31orab3 ; real_T fzubazngl3 ; real_T gbtlnwgalm
[ 4 ] ; real_T mxfdp2ltan [ 4 ] ; real_T k3ljcleoid [ 4 ] ; real_T obpruepjlb
[ 4 ] ; real_T nt5aet3d3s [ 3 ] ; real_T mqrllrhknp [ 36 ] ; real_T
es152orfgm [ 3 ] ; real_T chwubaiywm [ 3 ] ; real_T ida2tctgp2 [ 36 ] ;
real_T epk34rzqnu [ 9 ] ; real_T ee30l0u33u ; real_T i1fwhqeosf ; real_T
fzvlmbe2x0 ; real_T mh2krcrgw3 ; real_T c1klcpas2f ; real_T edjk3wh4gd [ 18 ]
; real_T loo5xvtgsh [ 4 ] ; real_T igtrb0xxov [ 9 ] ; boolean_T p0unimm1k0 ;
boolean_T dlusutdiez ; boolean_T of1r505p3n ; } B ; typedef struct { real_T
eo2izelnsp [ 4 ] ; real_T ic3jrlr0jz ; real_T jr51z3zb5d [ 4 ] ; real_T
ismukjvadj [ 36 ] ; real_T lq50dyklp4 [ 3 ] ; real_T fa0uzeqpit [ 4 ] ;
real_T hmtmt5gwtt [ 3 ] ; real_T jk5uei3ei4 [ 3 ] ; struct { void *
LoggedData [ 4 ] ; } ckpfh3kyyy ; struct { void * LoggedData [ 4 ] ; }
nswqmnl2rr ; struct { void * LoggedData [ 2 ] ; } mlxpoqjkwx ; struct { void
* LoggedData ; } jq3woon32o ; struct { void * LoggedData [ 2 ] ; } oa3iy3mn5r
; struct { void * LoggedData ; } abdpz0fqfb ; struct { void * LoggedData ; }
c1nk03yorp ; struct { void * LoggedData ; } hr4v0t5lss ; struct { void *
LoggedData [ 3 ] ; } mxhe5vgezu ; struct { void * LoggedData [ 3 ] ; }
nqwzk20w5b ; struct { void * LoggedData ; } dfovtl4aod ; struct { void *
LoggedData ; } jkdospy4g4 ; struct { void * LoggedData [ 3 ] ; } kventh31jz ;
struct { void * LoggedData ; } ovtumj1mmt ; struct { void * LoggedData [ 3 ]
; } jusku22gak ; struct { void * LoggedData [ 3 ] ; } daqvko5rwj ; struct {
void * LoggedData [ 3 ] ; } av12353yoh ; struct { void * LoggedData ; }
ldey3dgpc3 ; struct { void * LoggedData ; } mxeldapvtc ; struct { void *
LoggedData [ 3 ] ; } imtm502gug ; struct { void * LoggedData ; } egdg3y2mmu ;
struct { void * LoggedData ; } kkzeps2143 ; uint32_T owi0qnn13s [ 3 ] ;
uint32_T nn2tfrewz5 [ 3 ] ; int8_T hsldxkjyqe ; int8_T ek3tkvtgck ; int8_T
be2p4vgwja ; int8_T f44n4zoqaq ; int8_T pacgymw5aw ; int8_T itbgldrtmn ;
int8_T eoo2421vkh ; int8_T l023zsos0w ; int8_T bpgaewctmf ; int8_T d55jaht4oo
; boolean_T gdylcuu45e ; boolean_T ilthyfodyf ; } DW ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ {
struct_3DKGR4n2ovZKiw3p2jOVcH fswParams ; real_T Normalization2_Bias ; real_T
Normalization3_Bias ; real_T Normalization5_Bias ; real_T Normalization_Bias
; real_T Normalization1_Bias ; real_T Normalization4_Bias ; boolean_T
CompareToConstant_const ; real_T Merge_InitialOutput ; real_T Constant_Value
; real_T Gain2_Gain ; real_T Gain_Gain ; real_T Gain1_Gain ; real_T
Gain_Gain_pi5uhcql0z ; real_T Constant_Value_l5mn50z5cq ; real_T
Gain2_Gain_a5r1lslwra ; real_T Gain1_Gain_fhzwrqpxwn ; real_T
Gain_Gain_lliryqv0lr ; real_T Gain1_Gain_jqcyn3sr2w ; real_T
Constant_Value_lrvooetugt ; real_T Gain2_Gain_gplc4ydenu ; real_T
Constant_Value_c5k4awpww5 ; real_T Gain2_Gain_lxqqvcp1dv ; real_T
Gain_Gain_igquidva0x ; real_T Gain1_Gain_gutlcr5n0l ; real_T
Gain_Gain_ivgqmscmom ; real_T Constant_Value_ecblqlsacg ; real_T
Gain2_Gain_a5mzwuqcxa ; real_T Gain1_Gain_erhzz1d1jc ; real_T
Gain_Gain_m4fytnehbd ; real_T Gain1_Gain_nlppff24em ; real_T
Constant_Value_iqmtoqh2vp ; real_T Gain2_Gain_dnlg4rbf3l ; real_T
Constant1_Value ; real_T Gain3_Gain ; real_T Gain4_Gain ; real_T
Constant2_Value ; real_T Gain1_Gain_eay2spzcgy ; real_T Constant3_Value ;
real_T Constant1_Value_gywsazy05k ; real_T Gain3_Gain_ebexp5cpru ; real_T
Gain4_Gain_jsw1usbw51 ; real_T Constant2_Value_ht5ssv34ga ; real_T
Gain1_Gain_hinlh1vqa3 ; real_T Constant3_Value_ftknmtr0cr ; real_T
Constant2_Value_i4dkrdfott [ 9 ] ; real_T Constant1_Value_c2dxafuacz [ 9 ] ;
real_T Gain_Gain_d2ee5bjups ; real_T Gain1_Gain_gukw2z34vg ; real_T
Gain2_Gain_fd1hdrny0i ; real_T Gain3_Gain_df4fissmij ; real_T
Gain4_Gain_jqdgqgtsq5 ; real_T Gain5_Gain ; real_T Gain6_Gain ; real_T
Constant_Value_hteor4a5kn ; real_T Constant1_Value_buy3qqwwhi ; real_T
Constant2_Value_lzwp0qxwab ; real_T Constant_Value_adgfdn1zan ; real_T
AngularVelo_Y0 ; real_T uSigmaBounds_Y0 ; real_T flag_out_Y0 ; real_T
UnitDelay2_InitialCondition ; real_T UnitDelay2_InitialCondition_e5yh3e2aq2 [
4 ] ; real_T q_plusmerge_InitialOutput ; real_T Constant1_Value_jmutz103sv ;
real_T BiasMerge_InitialOutput ; real_T Constant_Value_jdndcrmtkc [ 3 ] ;
real_T P_plusmerge_InitialOutput ; real_T
SwitchesdependingonifGyroisoffline_Threshold ; real_T
Constant1_Value_h0nyb23dyo ; real_T Gain_Gain_izh1wtguao ; real_T
Gain3_Gain_l235frcyp2 ; real_T Constant2_Value_enlht0un1m ; real_T
Gain1_Gain_nitzlnqw2a ; real_T Constant3_Value_guvepryqpw ; real_T
Constant1_Value_f35hg154j0 ; real_T Constant2_Value_e5s0xhvsmx ; real_T
Constant3_Value_b5l2r3ghc5 ; real_T Gain_Gain_ddqwqhx5tx ; real_T
Gain1_Gain_ly5pvjnqag ; real_T Gain3_Gain_enevc5eimy ; real_T
Constant_Value_ib2ewpsxpl ; real_T Gain_Gain_mumivssi3t ; real_T
Constant_Value_gxmqunm0u0 [ 3 ] ; real_T Constant1_Value_kpkyenjwdq [ 3 ] ;
real_T RandomNumber_Mean ; real_T RandomNumber_StdDev [ 3 ] ; real_T
RandomNumber_Seed ; real_T Constant2_Value_chs5tmnkek [ 3 ] ; real_T
DiscreteTimeIntegrator_gainval ; real_T DiscreteTimeIntegrator_IC [ 4 ] ;
real_T Constant_Value_otz3nmwoqv ; real_T Gain2_Gain_cnsd3b5ouu ; real_T
Gain_Gain_klyu41lrfn ; real_T Gain1_Gain_diuflnffrx ; real_T
Gain_Gain_jhze2kqkab ; real_T Constant_Value_gztnxshksk ; real_T
Gain2_Gain_no1j2ourve ; real_T Gain1_Gain_mcq3nfgl5y ; real_T
Gain_Gain_d3m0eipbk4 ; real_T Gain1_Gain_eukkukzdsc ; real_T
Constant_Value_jc32hza5ok ; real_T Gain2_Gain_aqxl3lkkkb ; real_T
RandomNumber1_Mean ; real_T RandomNumber1_StdDev [ 3 ] ; real_T
RandomNumber1_Seed ; real_T Constant3_Value_b1f4zjlmmk [ 3 ] ; real_T
Constant_Value_ong43hwtad ; real_T Gain2_Gain_eugrs2j5w1 ; real_T
Gain_Gain_chibgsrp3r ; real_T Gain1_Gain_iwfebhm2do ; real_T
Gain_Gain_ag0mpz4kyf ; real_T Constant_Value_hf4lqdwccu ; real_T
Gain2_Gain_pdua0qf4rh ; real_T Gain1_Gain_denqfwp1iw ; real_T
Gain_Gain_iiknapd0gg ; real_T Gain1_Gain_hi2t442oxb ; real_T
Constant_Value_imftmnjmib ; real_T Gain2_Gain_k4jcurr4zm ; real_T
Constant4_Value [ 3 ] ; real_T Constant6_Value ; real_T Constant7_Value ;
real_T Constant10_Value ; real_T Constant5_Value ; real_T Constant9_Value ;
real_T Gain3_Gain_g31whpxaxh ; real_T Gain1_Gain_dwko2h5myg ; real_T
Gain_Gain_efmbe4yoj3 ; real_T Gain2_Gain_dndn2znysv ; real_T Constant8_Value
[ 3 ] ; real_T Constant_Value_e04ikljkmv ; real_T Gain2_Gain_op03fmkcim ;
real_T Gain_Gain_bhwu5bylct ; real_T Gain1_Gain_ppz2nua2un ; real_T
Gain_Gain_ovw33ojfgh ; real_T Constant_Value_b41hk0kxkh ; real_T
Gain2_Gain_flvppo5uo3 ; real_T Gain1_Gain_dsq2lkmbcs ; real_T
Gain_Gain_irsqnwliiv ; real_T Gain1_Gain_jwm5cb1c12 ; real_T
Constant_Value_oc2s014i34 ; real_T Gain2_Gain_if0kcnigpw ; real_T
Gain1_Gain_mgka3jhv0b ; boolean_T Memory_InitialCondition ; } ; extern const
char * RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern DW rtDW ; extern P
rtP ; extern const rtwCAPI_ModelMappingStaticInfo *
UnitTestDebug_GetCAPIStaticMap ( void ) ; extern SimStruct * const rtS ;
extern const int_T gblNumToFiles ; extern const int_T gblNumFrFiles ; extern
const int_T gblNumFrWksBlocks ; extern rtInportTUtable * gblInportTUtables ;
extern const char * gblInportFileName ; extern const int_T
gblNumRootInportBlks ; extern const int_T gblNumModelInputs ; extern const
int_T gblInportDataTypeIdx [ ] ; extern const int_T gblInportDims [ ] ;
extern const int_T gblInportComplex [ ] ; extern const int_T
gblInportInterpoFlag [ ] ; extern const int_T gblInportContinuous [ ] ;
extern const int_T gblParameterTuningTid ; extern DataMapInfo *
rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ;
void MdlOutputs ( int_T tid ) ; void MdlOutputsParameterSampleTime ( int_T
tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void
MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ;
SimStruct * raccel_register_model ( void ) ;
#endif
