/*
 * my_wmm_test.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "my_wmm_test".
 *
 * Model version              : 1.2
 * Simulink Coder version : 9.0 (R2018b) 24-May-2018
 * C source code generated on : Sun May  3 13:59:22 2020
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "my_wmm_test.h"
#include "my_wmm_test_private.h"

/* Block states (default storage) */
DW_my_wmm_test_T my_wmm_test_DW;

/* Real-time model */
RT_MODEL_my_wmm_test_T my_wmm_test_M_;
RT_MODEL_my_wmm_test_T *const my_wmm_test_M = &my_wmm_test_M_;

/* Forward declaration for local functions */
static void my_wmm_test_factorial(real_T *n);

/* Function for MATLAB Function: '<S1>/MATLAB Function' */
static void my_wmm_test_factorial(real_T *n)
{
  static const real_T b[170] = { 1.0, 2.0, 6.0, 24.0, 120.0, 720.0, 5040.0,
    40320.0, 362880.0, 3.6288E+6, 3.99168E+7, 4.790016E+8, 6.2270208E+9,
    8.71782912E+10, 1.307674368E+12, 2.0922789888E+13, 3.55687428096E+14,
    6.402373705728E+15, 1.21645100408832E+17, 2.43290200817664E+18,
    5.109094217170944E+19, 1.1240007277776077E+21, 2.5852016738884978E+22,
    6.2044840173323941E+23, 1.5511210043330986E+25, 4.0329146112660565E+26,
    1.0888869450418352E+28, 3.0488834461171384E+29, 8.8417619937397008E+30,
    2.6525285981219103E+32, 8.2228386541779224E+33, 2.6313083693369352E+35,
    8.6833176188118859E+36, 2.9523279903960412E+38, 1.0333147966386144E+40,
    3.7199332678990118E+41, 1.3763753091226343E+43, 5.23022617466601E+44,
    2.0397882081197442E+46, 8.1591528324789768E+47, 3.3452526613163803E+49,
    1.4050061177528798E+51, 6.0415263063373834E+52, 2.6582715747884485E+54,
    1.1962222086548019E+56, 5.5026221598120885E+57, 2.5862324151116818E+59,
    1.2413915592536073E+61, 6.0828186403426752E+62, 3.0414093201713376E+64,
    1.5511187532873822E+66, 8.0658175170943877E+67, 4.2748832840600255E+69,
    2.3084369733924138E+71, 1.2696403353658276E+73, 7.1099858780486348E+74,
    4.0526919504877221E+76, 2.3505613312828789E+78, 1.3868311854568986E+80,
    8.3209871127413916E+81, 5.0758021387722484E+83, 3.1469973260387939E+85,
    1.98260831540444E+87, 1.2688693218588417E+89, 8.2476505920824715E+90,
    5.4434493907744307E+92, 3.6471110918188683E+94, 2.4800355424368305E+96,
    1.711224524281413E+98, 1.197857166996989E+100, 8.5047858856786218E+101,
    6.1234458376886077E+103, 4.4701154615126834E+105, 3.3078854415193856E+107,
    2.4809140811395391E+109, 1.8854947016660498E+111, 1.4518309202828584E+113,
    1.1324281178206295E+115, 8.9461821307829729E+116, 7.1569457046263779E+118,
    5.7971260207473655E+120, 4.75364333701284E+122, 3.9455239697206569E+124,
    3.314240134565352E+126, 2.8171041143805494E+128, 2.4227095383672724E+130,
    2.1077572983795269E+132, 1.8548264225739836E+134, 1.6507955160908452E+136,
    1.4857159644817607E+138, 1.3520015276784023E+140, 1.24384140546413E+142,
    1.1567725070816409E+144, 1.0873661566567424E+146, 1.0329978488239052E+148,
    9.916779348709491E+149, 9.6192759682482062E+151, 9.426890448883242E+153,
    9.33262154439441E+155, 9.33262154439441E+157, 9.4259477598383536E+159,
    9.6144667150351211E+161, 9.9029007164861754E+163, 1.0299016745145622E+166,
    1.0813967582402903E+168, 1.1462805637347078E+170, 1.2265202031961373E+172,
    1.3246418194518284E+174, 1.4438595832024928E+176, 1.5882455415227421E+178,
    1.7629525510902437E+180, 1.9745068572210728E+182, 2.2311927486598123E+184,
    2.5435597334721862E+186, 2.9250936934930141E+188, 3.3931086844518965E+190,
    3.969937160808719E+192, 4.6845258497542883E+194, 5.5745857612076033E+196,
    6.6895029134491239E+198, 8.09429852527344E+200, 9.8750442008335976E+202,
    1.2146304367025325E+205, 1.5061417415111404E+207, 1.8826771768889254E+209,
    2.3721732428800459E+211, 3.0126600184576582E+213, 3.8562048236258025E+215,
    4.9745042224772855E+217, 6.4668554892204716E+219, 8.4715806908788174E+221,
    1.1182486511960039E+224, 1.4872707060906852E+226, 1.9929427461615181E+228,
    2.6904727073180495E+230, 3.6590428819525472E+232, 5.01288874827499E+234,
    6.9177864726194859E+236, 9.6157231969410859E+238, 1.346201247571752E+241,
    1.89814375907617E+243, 2.6953641378881614E+245, 3.8543707171800706E+247,
    5.5502938327393013E+249, 8.0479260574719866E+251, 1.17499720439091E+254,
    1.7272458904546376E+256, 2.5563239178728637E+258, 3.8089226376305671E+260,
    5.7133839564458505E+262, 8.6272097742332346E+264, 1.3113358856834518E+267,
    2.0063439050956811E+269, 3.0897696138473489E+271, 4.7891429014633912E+273,
    7.47106292628289E+275, 1.1729568794264138E+278, 1.8532718694937338E+280,
    2.9467022724950369E+282, 4.714723635992059E+284, 7.5907050539472148E+286,
    1.2296942187394488E+289, 2.0044015765453015E+291, 3.2872185855342945E+293,
    5.423910666131586E+295, 9.0036917057784329E+297, 1.5036165148649983E+300,
    2.5260757449731969E+302, 4.2690680090047027E+304, 7.257415615307994E+306 };

  if ((!(*n < 0.0)) && (!(floor(*n) != *n)) && ((!rtIsInf(*n)) && (!rtIsNaN(*n))))
  {
    if (*n > 170.0) {
      *n = (rtInf);
    } else if (*n < 1.0) {
      *n = 1.0;
    } else {
      *n = b[(int32_T)*n - 1];
    }
  }
}

real_T rt_powd_snf(real_T u0, real_T u1)
{
  real_T y;
  real_T tmp;
  real_T tmp_0;
  if (rtIsNaN(u0) || rtIsNaN(u1)) {
    y = (rtNaN);
  } else {
    tmp = fabs(u0);
    tmp_0 = fabs(u1);
    if (rtIsInf(u1)) {
      if (tmp == 1.0) {
        y = 1.0;
      } else if (tmp > 1.0) {
        if (u1 > 0.0) {
          y = (rtInf);
        } else {
          y = 0.0;
        }
      } else if (u1 > 0.0) {
        y = 0.0;
      } else {
        y = (rtInf);
      }
    } else if (tmp_0 == 0.0) {
      y = 1.0;
    } else if (tmp_0 == 1.0) {
      if (u1 > 0.0) {
        y = u0;
      } else {
        y = 1.0 / u0;
      }
    } else if (u1 == 2.0) {
      y = u0 * u0;
    } else if ((u1 == 0.5) && (u0 >= 0.0)) {
      y = sqrt(u0);
    } else if ((u0 < 0.0) && (u1 > floor(u1))) {
      y = (rtNaN);
    } else {
      y = pow(u0, u1);
    }
  }

  return y;
}

/* Model step function */
void my_wmm_test_step(void)
{
  /* local block i/o variables */
  real_T rtb_B_ned_nT[3];
  real_T rtb_FLAG;
  real_T lat;
  int32_T FLAG;
  real_T srlat;
  real_T sp[13];
  real_T cp[13];
  int32_T m;
  real_T Rc;
  real_T p;
  real_T z;
  real_T P[196];
  real_T xx;
  real_T trlat;
  real_T bz;
  real_T G;
  real_T H;
  int32_T b_m;
  int32_T b_n;
  int32_T c_m;
  static const real_T g[156] = { -29438.2, -2444.5, 1351.8, 907.5, -232.9, 69.4,
    81.7, 24.2, 5.5, -2.0, 3.0, -2.0, -1493.5, 3014.7, -2351.6, 814.8, 360.1,
    67.7, -75.9, 8.9, 8.8, -6.1, -1.4, -0.1, 0.0, 1679.0, 1223.6, 117.8, 191.7,
    72.3, -7.1, -16.9, 3.0, 0.2, -2.3, 0.5, 0.0, 0.0, 582.3, -335.6, -141.3,
    -129.1, 52.2, -3.1, -3.2, 0.6, 2.1, 1.2, 0.0, 0.0, 0.0, 69.7, -157.2, -28.4,
    15.0, -20.7, 0.6, -0.5, -0.8, -0.9, 0.0, 0.0, 0.0, 0.0, 7.7, 13.6, 9.1, 13.3,
    -13.2, 1.8, 0.6, 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, -70.3, -3.0, 11.6, -0.1, -0.7,
    -0.7, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.9, -16.3, 8.7, 2.2, 0.1, 0.6, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.1, -9.1, 2.4, 1.7, -0.4, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, -10.4, -1.8, -0.2, -0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, -3.6, 0.4, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 3.5, -0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

  static const real_T dg[156] = { 7.0, -11.0, 2.4, -0.8, -0.3, -0.8, -0.3, -0.1,
    -0.1, 0.0, 0.0, 0.0, 9.0, -6.2, -5.7, -0.9, 0.6, -0.5, -0.2, 0.2, -0.1, 0.0,
    0.0, 0.0, 0.0, 0.3, 2.0, -6.5, -0.8, -0.1, -0.3, -0.2, 0.0, -0.1, 0.0, 0.0,
    0.0, 0.0, -11.0, 5.2, 0.1, 1.6, 0.9, 0.5, 0.4, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0,
    -4.0, 1.2, -1.6, 0.1, -0.1, -0.4, -0.1, 0.0, -0.1, 0.0, 0.0, 0.0, 0.0, 1.4,
    0.0, -0.6, 0.4, 0.0, -0.2, -0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, -0.9,
    0.4, 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, -0.1, 0.0, -0.1,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.0, -0.2, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.3, -0.1, -0.1, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, -0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, -0.1 };

  static const real_T h[156] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 4796.3, -2842.4, -113.7, 283.3, 46.9, -20.1, -54.3, 10.1,
    -21.8, 3.3, 0.0, -1.0, 0.0, -638.8, 246.5, -188.6, 196.5, 32.8, -19.5, -18.3,
    10.7, -0.4, 2.1, 0.3, 0.0, 0.0, -537.4, 180.7, -119.9, 59.1, 6.0, 13.3, 11.8,
    4.6, -0.6, 1.8, 0.0, 0.0, 0.0, -330.0, 16.0, -67.1, 24.5, -14.5, -6.8, 4.4,
    -1.1, -2.2, 0.0, 0.0, 0.0, 0.0, 100.6, 8.1, 3.5, 16.2, -6.9, -7.9, 0.7, 0.3,
    0.0, 0.0, 0.0, 0.0, 0.0, 61.9, -27.7, 6.0, 7.9, -0.6, -0.2, 0.7, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, -2.9, -9.2, 1.0, -4.2, -2.1, -0.1, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 2.4, -3.9, -2.9, -1.5, 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 8.5, -1.1, -2.6, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -8.8,
    -2.0, -0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.3, -0.2,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8 };

  static const real_T dh[156] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, -30.2, -29.6, 6.5, -0.4, 0.2, 0.3, 0.6, -0.4, -0.3, 0.0, 0.0,
    0.0, 0.0, -17.3, -0.8, 5.8, 2.3, -1.5, 0.5, 0.6, 0.1, 0.1, 0.1, 0.0, 0.0,
    0.0, -2.0, 3.8, 0.0, -1.2, -0.8, -0.1, -0.4, -0.2, 0.0, -0.1, 0.0, 0.0, 0.0,
    -3.5, 3.3, 0.4, -0.2, 0.6, 0.3, 0.1, 0.1, 0.1, 0.0, 0.0, 0.0, 0.0, -0.6, 0.2,
    -1.1, -0.2, 0.1, -0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 0.1, -0.5,
    0.0, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.5, -0.1, 0.0, 0.1,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.5, -0.1, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, -0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, -0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    -0.1 };

  int32_T P_tmp;
  int32_T P_tmp_0;
  int32_T P_tmp_1;
  int32_T P_tmp_2;
  real_T srlat_tmp;
  real_T srlat_tmp_0;
  real_T secrlat_tmp;

  /* MATLAB Function: '<S1>/MATLAB Function' incorporates:
   *  Constant: '<Root>/Constant'
   *  Constant: '<Root>/Constant1'
   *  Constant: '<Root>/Constant2'
   *  Constant: '<Root>/Constant3'
   */
  lat = 0.017453292519943295 * my_wmm_test_P.lat;
  p = 0.017453292519943295 * my_wmm_test_P.lon;
  FLAG = 0;
  if (my_wmm_test_P.dyear < 2015.0) {
    FLAG = -1;
  }

  srlat = sin(lat);
  memset(&sp[0], 0, 13U * sizeof(real_T));
  memset(&cp[0], 0, 13U * sizeof(real_T));
  sp[1] = sin(p);
  cp[0] = 1.0;
  cp[1] = cos(p);
  m = 3;
  for (b_m = 0; b_m < 11; b_m++) {
    m = 3 + b_m;
    xx = cp[b_m + 1];
    sp[b_m + 2] = xx * sp[1] + sp[b_m + 1] * cp[1];
    cp[b_m + 2] = xx * cp[1] - sp[b_m + 1] * sp[1];
  }

  Rc = 6.378137E+6 / sqrt(1.0 - srlat * srlat * 0.0066943799901413165);
  p = (Rc + my_wmm_test_P.alt) * cos(lat);
  z = (Rc * 0.99330562000985867 + my_wmm_test_P.alt) * srlat;
  Rc = sqrt(p * p + z * z);
  p = asin(z / Rc);
  srlat = sin(p);
  Rc = 6.3712E+6 / Rc;
  z = Rc * Rc;
  memset(&P[0], 0, 196U * sizeof(real_T));
  xx = sqrt(1.0 - srlat * srlat);
  trlat = tan(p);
  secrlat_tmp = 1.0 / cos(p);
  P[0] = 1.0;
  P[1] = srlat;
  P[15] = -xx;
  b_m = 2;
  for (b_n = 0; b_n < 12; b_n++) {
    b_m = 2 + b_n;
    P[b_n + 2] = (((2.0 + (real_T)b_n) * 2.0 - 1.0) * srlat * P[b_n + 1] - ((2.0
      + (real_T)b_n) - 1.0) * P[b_n]) * (1.0 / (2.0 + (real_T)b_n));
    m = 1;
    for (c_m = 0; c_m <= b_n + 1; c_m++) {
      m = 1 + c_m;
      P_tmp = 14 * c_m + b_n;
      P_tmp_0 = b_n - c_m;
      H = b_n + c_m;
      P_tmp_1 = P_tmp + 1;
      P_tmp_2 = P_tmp + 2;
      P[(b_n + 14 * (c_m + 1)) + 2] = ((((real_T)P_tmp_0 + 1.0) + 1.0) * srlat *
        P[P_tmp_2] - ((H + 3.0) - 1.0) * P[P_tmp_1]) * (1.0 / xx);
      if ((1 + c_m > 1) && (P_tmp_0 + 1 > 0)) {
        bz = ((real_T)(b_n - c_m) - 1.0) + 1.0;
        my_wmm_test_factorial(&bz);
        G = (H + 1.0) - 1.0;
        my_wmm_test_factorial(&G);
        P[b_n + 14 * c_m] = rt_powd_snf(-1.0, (1.0 + (real_T)c_m) - 1.0) * sqrt
          (2.0 * bz / G) * P[P_tmp];
      }

      if ((1 + c_m > 1) && (2 + b_n == 13)) {
        bz = (real_T)(b_n - c_m) + 1.0;
        my_wmm_test_factorial(&bz);
        G = (H + 2.0) - 1.0;
        my_wmm_test_factorial(&G);
        P[(b_n + 14 * c_m) + 1] = rt_powd_snf(-1.0, (1.0 + (real_T)c_m) - 1.0) *
          sqrt(2.0 * bz / G) * P[P_tmp_1];
        bz = ((real_T)(b_n - c_m) + 1.0) + 1.0;
        my_wmm_test_factorial(&bz);
        G = ((real_T)(b_n + c_m) + 3.0) - 1.0;
        my_wmm_test_factorial(&G);
        P[(b_n + 14 * c_m) + 2] = rt_powd_snf(-1.0, (1.0 + (real_T)c_m) - 1.0) *
          sqrt(2.0 * bz / G) * P[P_tmp_2];
      }
    }
  }

  srlat = b_m - m;
  my_wmm_test_factorial(&srlat);
  xx = b_m + m;
  my_wmm_test_factorial(&xx);
  P[b_m + 14 * m] *= sqrt(2.0 * srlat / xx) * rt_powd_snf(-1.0, (real_T)m);
  srlat = 0.0;
  xx = 0.0;
  bz = 0.0;
  for (m = 0; m < 12; m++) {
    z *= Rc;
    for (b_m = 0; b_m <= m + 1; b_m++) {
      b_n = 12 * b_m + m;
      G = dg[b_n] * (my_wmm_test_P.dyear - 2015.0) + g[b_n];
      H = dh[b_n] * (my_wmm_test_P.dyear - 2015.0) + h[b_n];
      b_n = 14 * b_m + m;
      srlat_tmp = P[b_n + 1];
      srlat_tmp_0 = G * cp[b_m] + H * sp[b_m];
      srlat -= (((1.0 + (real_T)m) + 1.0) * trlat * srlat_tmp - sqrt((m + 2) *
                 (m + 2) - b_m * b_m) * secrlat_tmp * P[b_n + 2]) * (srlat_tmp_0
        * z);
      xx += (G * sp[b_m] - H * cp[b_m]) * (z * (real_T)b_m) * srlat_tmp;
      bz -= ((1.0 + (real_T)m) + 1.0) * z * srlat_tmp_0 * srlat_tmp;
    }
  }

  lat = p - lat;
  p = sin(lat);
  lat = cos(lat);
  rtb_B_ned_nT[0] = lat * srlat - p * bz;
  rtb_B_ned_nT[1] = secrlat_tmp * xx;
  rtb_B_ned_nT[2] = p * srlat + lat * bz;
  rtb_FLAG = FLAG;

  /* End of MATLAB Function: '<S1>/MATLAB Function' */

  /* ToWorkspace: '<Root>/To Workspace' */
  rt_UpdateLogVar((LogVar *)(LogVar*)
                  (my_wmm_test_DW.ToWorkspace_PWORK.LoggedData), &rtb_B_ned_nT[0],
                  0);

  /* ToWorkspace: '<Root>/To Workspace1' */
  rt_UpdateLogVar((LogVar *)(LogVar*)
                  (my_wmm_test_DW.ToWorkspace1_PWORK.LoggedData), &rtb_FLAG, 0);

  /* Matfile logging */
  rt_UpdateTXYLogVars(my_wmm_test_M->rtwLogInfo,
                      (&my_wmm_test_M->Timing.taskTime0));

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.02s, 0.0s] */
    if ((rtmGetTFinal(my_wmm_test_M)!=-1) &&
        !((rtmGetTFinal(my_wmm_test_M)-my_wmm_test_M->Timing.taskTime0) >
          my_wmm_test_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(my_wmm_test_M, "Simulation finished");
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
  if (!(++my_wmm_test_M->Timing.clockTick0)) {
    ++my_wmm_test_M->Timing.clockTickH0;
  }

  my_wmm_test_M->Timing.taskTime0 = my_wmm_test_M->Timing.clockTick0 *
    my_wmm_test_M->Timing.stepSize0 + my_wmm_test_M->Timing.clockTickH0 *
    my_wmm_test_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void my_wmm_test_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)my_wmm_test_M, 0,
                sizeof(RT_MODEL_my_wmm_test_T));
  rtmSetTFinal(my_wmm_test_M, 1.0);
  my_wmm_test_M->Timing.stepSize0 = 0.02;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = NULL;
    my_wmm_test_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(my_wmm_test_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(my_wmm_test_M->rtwLogInfo, (NULL));
    rtliSetLogT(my_wmm_test_M->rtwLogInfo, "tout");
    rtliSetLogX(my_wmm_test_M->rtwLogInfo, "");
    rtliSetLogXFinal(my_wmm_test_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(my_wmm_test_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(my_wmm_test_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(my_wmm_test_M->rtwLogInfo, 0);
    rtliSetLogDecimation(my_wmm_test_M->rtwLogInfo, 1);
    rtliSetLogY(my_wmm_test_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(my_wmm_test_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(my_wmm_test_M->rtwLogInfo, (NULL));
  }

  /* states (dwork) */
  (void) memset((void *)&my_wmm_test_DW, 0,
                sizeof(DW_my_wmm_test_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(my_wmm_test_M->rtwLogInfo, 0.0, rtmGetTFinal
    (my_wmm_test_M), my_wmm_test_M->Timing.stepSize0, (&rtmGetErrorStatus
    (my_wmm_test_M)));

  /* Start for ToWorkspace: '<Root>/To Workspace' */
  {
    int_T dimensions[1] = { 3 };

    my_wmm_test_DW.ToWorkspace_PWORK.LoggedData = rt_CreateLogVar(
      my_wmm_test_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(my_wmm_test_M),
      my_wmm_test_M->Timing.stepSize0,
      (&rtmGetErrorStatus(my_wmm_test_M)),
      "b_nt_sim",
      SS_DOUBLE,
      0,
      0,
      0,
      3,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.02,
      1);
    if (my_wmm_test_DW.ToWorkspace_PWORK.LoggedData == (NULL))
      return;
  }

  /* Start for ToWorkspace: '<Root>/To Workspace1' */
  {
    int_T dimensions[1] = { 1 };

    my_wmm_test_DW.ToWorkspace1_PWORK.LoggedData = rt_CreateLogVar(
      my_wmm_test_M->rtwLogInfo,
      0.0,
      rtmGetTFinal(my_wmm_test_M),
      my_wmm_test_M->Timing.stepSize0,
      (&rtmGetErrorStatus(my_wmm_test_M)),
      "flag_sim",
      SS_DOUBLE,
      0,
      0,
      0,
      1,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      (NULL),
      0,
      1,
      0.02,
      1);
    if (my_wmm_test_DW.ToWorkspace1_PWORK.LoggedData == (NULL))
      return;
  }
}

/* Model terminate function */
void my_wmm_test_terminate(void)
{
  /* (no terminate code required) */
}
