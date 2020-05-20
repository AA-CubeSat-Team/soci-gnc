#include "__cf_UnitTestDebug.h"
#ifndef RTW_HEADER_UnitTestDebug_types_h_
#define RTW_HEADER_UnitTestDebug_types_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#ifndef DEFINED_TYPEDEF_FOR_struct_pRh2I6kb8EpGWYupLmWg4F_
#define DEFINED_TYPEDEF_FOR_struct_pRh2I6kb8EpGWYupLmWg4F_
typedef struct { real_T prodOutputMode ; real_T prodOutputWordLength ; real_T
prodOutputFracLength ; real_T accumMode ; real_T accumWordLength ; real_T
accumFracLength ; real_T outputMode ; real_T outputWordLength ; real_T
outputFracLength ; real_T roundingMode ; real_T overflowMode ; }
struct_pRh2I6kb8EpGWYupLmWg4F ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_ty10kkX2qfxaFZ5ZM3ZHyG_
#define DEFINED_TYPEDEF_FOR_struct_ty10kkX2qfxaFZ5ZM3ZHyG_
typedef struct { real_T M2KM ; real_T KM2M ; real_T DEG2RAD ; real_T RAD2DEG
; real_T DAY2SEC ; real_T SEC2DAY ; real_T RPS2RPM ; real_T RPM2RPS ; real_T
AU2KM ; real_T nT2T ; real_T HR2SEC ; real_T SEC2HR ; }
struct_ty10kkX2qfxaFZ5ZM3ZHyG ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_E5m6pVGpMUCQICNWvvJYVD_
#define DEFINED_TYPEDEF_FOR_struct_E5m6pVGpMUCQICNWvvJYVD_
typedef struct { real_T w_earth_rads [ 3 ] ; real_T mu_earth_km3s2 ; real_T
r_earth_km ; real_T JDJ2000 ; real_T reorientation_controller_threshold ; }
struct_E5m6pVGpMUCQICNWvvJYVD ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_TOo86xfEEzLUMQL1cJ6i4F_
#define DEFINED_TYPEDEF_FOR_struct_TOo86xfEEzLUMQL1cJ6i4F_
typedef struct { struct_ty10kkX2qfxaFZ5ZM3ZHyG convert ;
struct_E5m6pVGpMUCQICNWvvJYVD global ; real_T id_r [ 3 ] ; real_T id_v [ 3 ]
; real_T id_q [ 4 ] ; real_T id_w [ 3 ] ; } struct_TOo86xfEEzLUMQL1cJ6i4F ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_aWpGGhIuows0R6KCHlyCw_
#define DEFINED_TYPEDEF_FOR_struct_aWpGGhIuows0R6KCHlyCw_
typedef struct { real_T z_len ; real_T x_len ; real_T y_len ; real_T m_3u ;
real_T xB_dir [ 3 ] ; real_T yB_dir [ 3 ] ; real_T zB_dir [ 3 ] ; real_T J [
9 ] ; real_T point_of_pressure [ 3 ] ; real_T CD ; real_T Ax ; real_T Ay ;
real_T Az ; } struct_aWpGGhIuows0R6KCHlyCw ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_9Y7NpmKix1IG4oH8KKEfiF_
#define DEFINED_TYPEDEF_FOR_struct_9Y7NpmKix1IG4oH8KKEfiF_
typedef struct { real_T rpm [ 4 ] ; real_T radps [ 4 ] ; real_T momentum [ 4
] ; real_T body_momentum [ 3 ] ; real_T power_W [ 4 ] ; real_T torque_Nm [ 4
] ; real_T body_torque_Nm [ 3 ] ; real_T rt1 ; real_T deriv1 ; }
struct_9Y7NpmKix1IG4oH8KKEfiF ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_Sy3TE4WEbvVfR4tJReRWfD_
#define DEFINED_TYPEDEF_FOR_struct_Sy3TE4WEbvVfR4tJReRWfD_
typedef struct { real_T num_wheels ; real_T sample_time_s ; real_T inertia [
4 ] ; real_T time_cnst [ 4 ] ; real_T max_RPM ; real_T max_RADPS ; real_T
visc_fric ; real_T torque_cnst ; real_T delay ; real_T resistance ; real_T
inductance ; real_T inertia_matrix [ 16 ] ; real_T inv_inertia_matrix [ 16 ]
; real_T dc_voltage ; real_T cant_angle ; real_T max_torque_Nm ; real_T Aw [
16 ] ; real_T iAw [ 16 ] ; struct_9Y7NpmKix1IG4oH8KKEfiF ic ; }
struct_Sy3TE4WEbvVfR4tJReRWfD ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_bAwhF0jhe8CAuqzSl58dcD_
#define DEFINED_TYPEDEF_FOR_struct_bAwhF0jhe8CAuqzSl58dcD_
typedef struct { real_T normals [ 15 ] ; real_T n_coils [ 3 ] ; real_T
tot_coils ; real_T id_x [ 2 ] ; real_T id_y [ 2 ] ; real_T id_z ; real_T
dipoles_Am2 [ 3 ] ; real_T dipole_max_Am2 [ 3 ] ; real_T voltage [ 3 ] ;
real_T max_current [ 3 ] ; real_T P_max_W [ 3 ] ; real_T dc_max ; real_T
m_2_dc [ 3 ] ; real_T dc_2_m [ 3 ] ; real_T dipole_to_power [ 3 ] ; }
struct_bAwhF0jhe8CAuqzSl58dcD ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_w7aMc9U4emvM2kACBtRHPE_
#define DEFINED_TYPEDEF_FOR_struct_w7aMc9U4emvM2kACBtRHPE_
typedef struct { real_T sample_time_s ; struct_Sy3TE4WEbvVfR4tJReRWfD rwa ;
struct_bAwhF0jhe8CAuqzSl58dcD mtq ; } struct_w7aMc9U4emvM2kACBtRHPE ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_9OHKL3KkhSMVqS2TKD32KD_
#define DEFINED_TYPEDEF_FOR_struct_9OHKL3KkhSMVqS2TKD32KD_
typedef struct { real_T A [ 12 ] ; real_T Phi [ 12 ] ; real_T A_inv [ 12 ] ;
real_T A_1 [ 12 ] ; real_T Phi_1 [ 12 ] ; real_T A_2 [ 12 ] ; real_T Phi_2 [
12 ] ; real_T A_3 [ 12 ] ; real_T Phi_3 [ 12 ] ; real_T A_4 [ 12 ] ; real_T
Phi_4 [ 12 ] ; } struct_9OHKL3KkhSMVqS2TKD32KD ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_J2UklKDOwboHskfNE7JQOD_
#define DEFINED_TYPEDEF_FOR_struct_J2UklKDOwboHskfNE7JQOD_
typedef struct { real_T C [ 9 ] ; } struct_J2UklKDOwboHskfNE7JQOD ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_4mAysgmjVCepNgQ3iGFExC_
#define DEFINED_TYPEDEF_FOR_struct_4mAysgmjVCepNgQ3iGFExC_
typedef struct { real_T J [ 9 ] ; real_T A [ 12 ] ; real_T Phi [ 12 ] ;
real_T w_max ; real_T torque_max ; real_T T [ 16 ] ; real_T zeta ; real_T wn
; real_T qd [ 4 ] ; real_T q0 [ 4 ] ; real_T K [ 9 ] ; real_T ep ; real_T
K_init [ 9 ] ; real_T P [ 9 ] ; real_T C [ 9 ] ; real_T saturation ; real_T
w0 [ 3 ] ; real_T qd1 [ 4 ] ; } struct_4mAysgmjVCepNgQ3iGFExC ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_U12upH4rVNUTnf5woIw8YH_
#define DEFINED_TYPEDEF_FOR_struct_U12upH4rVNUTnf5woIw8YH_
typedef struct { real_T Kd1 [ 9 ] ; real_T Kp1 [ 9 ] ; real_T qd1 [ 4 ] ; }
struct_U12upH4rVNUTnf5woIw8YH ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_RVC8XrLuWshpvAM0OkFvt_
#define DEFINED_TYPEDEF_FOR_struct_RVC8XrLuWshpvAM0OkFvt_
typedef struct { real_T k ; real_T B ; real_T B_vec [ 3 ] ; real_T maxDipole
; real_T Jw ; real_T ht [ 4 ] ; } struct_RVC8XrLuWshpvAM0OkFvt ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_lvNRa0gCEJ8LerTxVHRCcF_
#define DEFINED_TYPEDEF_FOR_struct_lvNRa0gCEJ8LerTxVHRCcF_
typedef struct { struct_J2UklKDOwboHskfNE7JQOD stabilize ;
struct_4mAysgmjVCepNgQ3iGFExC reorientation ; struct_U12upH4rVNUTnf5woIw8YH
tracking ; struct_RVC8XrLuWshpvAM0OkFvt desaturation ; }
struct_lvNRa0gCEJ8LerTxVHRCcF ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_z5tOVs4XZJ8tZ1LnGwJNlH_
#define DEFINED_TYPEDEF_FOR_struct_z5tOVs4XZJ8tZ1LnGwJNlH_
typedef struct { real_T Beta_init [ 3 ] ; real_T quat_est_init [ 4 ] ; real_T
w_init [ 3 ] ; real_T P_init [ 36 ] ; real_T rt_valid_gyro ; real_T
rt_valid_mag ; real_T rt_valid_sun ; real_T rt_mt_power_ok ; real_T
rt_sc_in_sun ; real_T rt_w_body_radps [ 3 ] ; real_T rt_mag_body [ 3 ] ;
real_T rt_mag_eci_est [ 3 ] ; real_T rt_sun_body [ 3 ] ; real_T
rt_sun_eci_est [ 3 ] ; } struct_z5tOVs4XZJ8tZ1LnGwJNlH ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_ICucPnOOJJLn3xbs96EvuF_
#define DEFINED_TYPEDEF_FOR_struct_ICucPnOOJJLn3xbs96EvuF_
typedef struct { struct_z5tOVs4XZJ8tZ1LnGwJNlH ic ; real_T dt ; real_T
sample_time_s ; real_T Q_k [ 36 ] ; real_T gamma [ 36 ] ; real_T Qg [ 36 ] ;
real_T R [ 36 ] ; } struct_ICucPnOOJJLn3xbs96EvuF ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_3DKGR4n2ovZKiw3p2jOVcH_
#define DEFINED_TYPEDEF_FOR_struct_3DKGR4n2ovZKiw3p2jOVcH_
typedef struct { real_T sample_time_s ; struct_TOo86xfEEzLUMQL1cJ6i4F
constants ; struct_aWpGGhIuows0R6KCHlyCw scParams ;
struct_w7aMc9U4emvM2kACBtRHPE actuators ; struct_9OHKL3KkhSMVqS2TKD32KD
allocator ; struct_lvNRa0gCEJ8LerTxVHRCcF controllers ;
struct_ICucPnOOJJLn3xbs96EvuF estimation ; } struct_3DKGR4n2ovZKiw3p2jOVcH ;
#endif
typedef struct P_ P ;
#endif
