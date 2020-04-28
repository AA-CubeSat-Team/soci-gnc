/*
 * /Users/devantormey/Documents/MATLAB/UW/AACT/soci-gnc/Test/Autocoding_tests/slprj/grt/_sharedutils/foh_4t8rPkG0.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "soac_unit_test".
 *
 * Model version              : 1.95
 * Simulink Coder version : 9.0 (R2018b) 24-May-2018
 * C source code generated on : Tue Apr 21 17:06:42 2020
 * Created for block: soac_unit_test
 */

#include "rtwtypes.h"
#include <string.h>
#include "deriv_j3VW1WvS.h"
#include "eye_y3VYXK5u.h"
#include "linspace_dCtge7ie.h"
#include "foh_4t8rPkG0.h"

/*
 * Function for MATLAB Function: '<S3>/SOLVE'
 * function [ EH,BE,ES,AR ] = foh( X,U,s,N,Nx,Nu,J,Dx,Du,Ds,iDx )
 */
void foh_4t8rPkG0(const real_T X[100], const real_T U[30], real_T s, const
                  real_T J[9], const real_T Dx[100], const real_T Du[9], const
                  real_T iDx[100], real_T EH[10000], real_T BE[3000], real_T ES
                  [100], real_T AR[100])
{
  real_T P0[190];
  real_T u[6];
  real_T tspan[10];
  real_T h;
  real_T k1[190];
  real_T k2[190];
  real_T k3[190];
  real_T k4[190];
  int32_T k;
  int32_T k_;
  real_T a;
  real_T EH_tmp[100];
  real_T P0_0[190];
  real_T iDx_0[100];
  real_T P0_1[30];
  real_T P0_2[30];
  real_T iDx_1[10];
  int32_T i;
  int32_T i_0;
  int32_T i_1;
  int32_T iDx_tmp;
  int32_T EH_tmp_0;
  int32_T P0_tmp;
  int32_T i_2;
  real_T *P0_3;

  /* '<S6>:1:149' len     = N-1; */
  /* '<S6>:1:150' tau     = linspace(0,1,N); */
  /* '<S6>:1:151' Nsub    = 10; */
  /* '<S6>:1:154' EH          = zeros(Nx*(len+1),Nx*(len+1)); */
  memset(&EH[0], 0, 10000U * sizeof(real_T));

  /* '<S6>:1:155' EH(1:Nx,1:Nx) = eye(Nx); */
  eye_y3VYXK5u(EH_tmp);
  for (i = 0; i < 10; i++) {
    memcpy(&EH[i * 100], &EH_tmp[i * 10], 10U * sizeof(real_T));
  }

  /* '<S6>:1:156' BE          = zeros(Nx*(len+1),Nu*(len+1)); */
  memset(&BE[0], 0, 3000U * sizeof(real_T));

  /* '<S6>:1:157' ES          = zeros(Nx*(len+1),1); */
  /* '<S6>:1:158' AR          = zeros(Nx*(len+1),1); */
  memset(&ES[0], 0, 100U * sizeof(real_T));
  memset(&AR[0], 0, 100U * sizeof(real_T));

  /* '<S6>:1:161' A0  = eye(Nx); */
  /* '<S6>:1:162' B0p = zeros(Nx*Nu,1); */
  /* '<S6>:1:163' B0m = zeros(Nx*Nu,1); */
  /* '<S6>:1:164' S0  = zeros(Nx,1); */
  /* '<S6>:1:165' R0  = zeros(Nx,1); */
  /* '<S6>:1:167' for k = 1:len */
  for (k = 0; k < 9; k++) {
    /* '<S6>:1:170' xF = X(Nx*(k-1)+(1:Nx)); */
    /* '<S6>:1:171' P0 = [xF(:); A0(:); B0p(:); B0m(:); S0(:); R0(:)]; */
    memcpy(&P0[0], &X[10 * k], 10U * sizeof(real_T));
    memcpy(&P0[10], &EH_tmp[0], 100U * sizeof(real_T));
    for (i = 0; i < 30; i++) {
      P0[i + 110] = 0.0;
      P0[i + 140] = 0.0;
    }

    for (i = 0; i < 10; i++) {
      P0[i + 170] = 0.0;
      P0[i + 180] = 0.0;
    }

    /* '<S6>:1:173' um = U(Nu*(k-1)+(1:Nu)); */
    /* '<S6>:1:174' up = U(Nu*k+(1:Nu)); */
    /* '<S6>:1:175' u  = [reshape(um,Nu,1) reshape(up,Nu,1)]; */
    i = 3 * k;
    i_2 = (1 + k) * 3;
    u[0] = U[i];
    u[3] = U[i_2];
    u[1] = U[1 + i];
    u[4] = U[1 + i_2];
    u[2] = U[2 + i];
    u[5] = U[2 + i_2];

    /* '<S6>:1:176' tspan = linspace(tau(k), tau(k+1), N); */
    linspace_dCtge7ie(0.1111111111111111 * (real_T)k, ((real_T)k + 1.0) *
                      0.1111111111111111, tspan);

    /* '<S6>:1:178' for k_ = 1:Nsub-1 */
    for (k_ = 0; k_ < 9; k_++) {
      /* '<S6>:1:180' tk      = tspan(k_); */
      /* '<S6>:1:181' tkp1    = tspan(k_+1); */
      /* '<S6>:1:182' h       = tkp1-tk; */
      h = tspan[k_ + 1] - tspan[k_];

      /* '<S6>:1:184' k1 = deriv(tk    ,P0       ,u,tspan,s,J); */
      deriv_j3VW1WvS(tspan[k_], P0, u, tspan, s, J, k1);

      /* '<S6>:1:185' k2 = deriv(tk+h/2,P0+h/2*k1,u,tspan,s,J); */
      a = h / 2.0;
      for (i = 0; i < 190; i++) {
        P0_0[i] = a * k1[i] + P0[i];
      }

      deriv_j3VW1WvS(h / 2.0 + tspan[k_], P0_0, u, tspan, s, J, k2);

      /* '<S6>:1:186' k3 = deriv(tk+h/2,P0+h/2*k2,u,tspan,s,J); */
      a = h / 2.0;
      for (i = 0; i < 190; i++) {
        P0_0[i] = a * k2[i] + P0[i];
      }

      deriv_j3VW1WvS(h / 2.0 + tspan[k_], P0_0, u, tspan, s, J, k3);

      /* '<S6>:1:187' k4 = deriv(tk+h  ,P0+h*k3  ,u,tspan,s,J); */
      for (i = 0; i < 190; i++) {
        P0_0[i] = h * k3[i] + P0[i];
      }

      deriv_j3VW1WvS(tspan[k_] + h, P0_0, u, tspan, s, J, k4);

      /* '<S6>:1:189' P0 = (P0+h/6*(k1+2*k2+2*k3+k4)); */
      h /= 6.0;
      for (i = 0; i < 190; i++) {
        P0[i] += (((2.0 * k2[i] + k1[i]) + 2.0 * k3[i]) + k4[i]) * h;
      }
    }

    /* '<S6>:1:192' AF  = P0(Nx+1:Nx*(Nx+1)); */
    /* '<S6>:1:193' BFp = P0(Nx*(Nx+1)+1:Nx*(Nx+Nu+1)); */
    /* '<S6>:1:194' BFm = P0(Nx*(Nx+Nu+1)+1:Nx*(Nx+2*Nu+1)); */
    /* '<S6>:1:195' SF  = P0(Nx*(Nx+2*Nu+1)+1:Nx*(Nx+2*Nu+2)); */
    /* '<S6>:1:196' RF  = P0(Nx*(Nx+2*Nu+2)+1:Nx*(Nx+2*Nu+3)); */
    /* '<S6>:1:199' Ad  = reshape(AF,Nx,Nx); */
    /* '<S6>:1:200' EH(Nx*k+(1:Nx),Nx*(k-1)+(1:Nx)) = iDx*Ad*Dx; */
    P0_3 = &P0[10];
    i = (1 + k) * 10;
    k_ = 10 * k;
    for (i_0 = 0; i_0 < 10; i_0++) {
      for (i_1 = 0; i_1 < 10; i_1++) {
        iDx_tmp = i_0 + 10 * i_1;
        iDx_0[iDx_tmp] = 0.0;
        for (P0_tmp = 0; P0_tmp < 10; P0_tmp++) {
          iDx_0[iDx_tmp] = iDx[10 * P0_tmp + i_0] * P0_3[10 * i_1 + P0_tmp] +
            iDx_0[10 * i_1 + i_0];
        }
      }

      for (i_1 = 0; i_1 < 10; i_1++) {
        iDx_tmp = i_1 + k_;
        EH_tmp_0 = (i_0 + i) + 100 * iDx_tmp;
        EH[EH_tmp_0] = 0.0;
        for (P0_tmp = 0; P0_tmp < 10; P0_tmp++) {
          EH[EH_tmp_0] = EH[(iDx_tmp * 100 + i_0) + i] + iDx_0[10 * P0_tmp + i_0]
            * Dx[10 * i_1 + P0_tmp];
        }
      }
    }

    /* '<S6>:1:201' BE(Nx*k+(1:Nx),Nu*(k-1)+(1:Nu)) = iDx*(Ad*reshape(BFm,Nx,Nu))*Du; */
    P0_3 = &P0[10];
    memcpy(&P0_1[0], &P0[140], 30U * sizeof(real_T));
    for (k_ = 0; k_ < 10; k_++) {
      for (i_0 = 0; i_0 < 3; i_0++) {
        P0_tmp = k_ + 10 * i_0;
        P0_2[P0_tmp] = 0.0;
        for (i_1 = 0; i_1 < 10; i_1++) {
          P0_2[P0_tmp] = P0_3[10 * i_1 + k_] * P0_1[10 * i_0 + i_1] + P0_2[10 *
            i_0 + k_];
        }
      }
    }

    k_ = 3 * k;
    for (i_0 = 0; i_0 < 10; i_0++) {
      for (i_1 = 0; i_1 < 3; i_1++) {
        iDx_tmp = i_0 + 10 * i_1;
        P0_1[iDx_tmp] = 0.0;
        for (P0_tmp = 0; P0_tmp < 10; P0_tmp++) {
          P0_1[iDx_tmp] = iDx[10 * P0_tmp + i_0] * P0_2[10 * i_1 + P0_tmp] +
            P0_1[10 * i_1 + i_0];
        }
      }

      for (i_1 = 0; i_1 < 3; i_1++) {
        P0_tmp = i_1 + k_;
        iDx_tmp = (i_0 + i) + 100 * P0_tmp;
        BE[iDx_tmp] = 0.0;
        P0_tmp = (P0_tmp * 100 + i_0) + i;
        BE[iDx_tmp] = BE[P0_tmp] + Du[3 * i_1] * P0_1[i_0];
        BE[iDx_tmp] = BE[P0_tmp] + Du[3 * i_1 + 1] * P0_1[i_0 + 10];
        BE[iDx_tmp] = BE[P0_tmp] + Du[3 * i_1 + 2] * P0_1[i_0 + 20];
      }
    }

    /* '<S6>:1:202' BE(Nx*k+(1:Nx),Nu*k+(1:Nu))     = iDx*(Ad*reshape(BFp,Nx,Nu))*Du; */
    P0_3 = &P0[10];
    memcpy(&P0_1[0], &P0[110], 30U * sizeof(real_T));
    for (k_ = 0; k_ < 10; k_++) {
      for (i_0 = 0; i_0 < 3; i_0++) {
        P0_tmp = k_ + 10 * i_0;
        P0_2[P0_tmp] = 0.0;
        for (i_1 = 0; i_1 < 10; i_1++) {
          P0_2[P0_tmp] = P0_3[10 * i_1 + k_] * P0_1[10 * i_0 + i_1] + P0_2[10 *
            i_0 + k_];
        }
      }
    }

    for (k_ = 0; k_ < 10; k_++) {
      for (i_0 = 0; i_0 < 3; i_0++) {
        iDx_tmp = k_ + 10 * i_0;
        P0_1[iDx_tmp] = 0.0;
        for (i_1 = 0; i_1 < 10; i_1++) {
          P0_1[iDx_tmp] = iDx[10 * i_1 + k_] * P0_2[10 * i_0 + i_1] + P0_1[10 *
            i_0 + k_];
        }
      }

      for (i_0 = 0; i_0 < 3; i_0++) {
        P0_tmp = i_0 + i_2;
        iDx_tmp = (k_ + i) + 100 * P0_tmp;
        BE[iDx_tmp] = 0.0;
        P0_tmp = (P0_tmp * 100 + k_) + i;
        BE[iDx_tmp] = BE[P0_tmp] + Du[3 * i_0] * P0_1[k_];
        BE[iDx_tmp] = BE[P0_tmp] + Du[3 * i_0 + 1] * P0_1[k_ + 10];
        BE[iDx_tmp] = BE[P0_tmp] + Du[3 * i_0 + 2] * P0_1[k_ + 20];
      }
    }

    /* '<S6>:1:203' ES(Nx*k+(1:Nx))                 = iDx*(Ad*reshape(SF,Nx,1))*Ds; */
    P0_3 = &P0[10];
    for (i_2 = 0; i_2 < 10; i_2++) {
      tspan[i_2] = 0.0;
      for (k_ = 0; k_ < 10; k_++) {
        tspan[i_2] += P0_3[10 * k_ + i_2] * P0[170 + k_];
      }
    }

    for (i_2 = 0; i_2 < 10; i_2++) {
      iDx_1[i_2] = 0.0;
      for (k_ = 0; k_ < 10; k_++) {
        iDx_1[i_2] += iDx[10 * k_ + i_2] * tspan[k_];
      }

      ES[i_2 + i] = iDx_1[i_2];
    }

    /* '<S6>:1:204' AR(Nx*k+(1:Nx))                 = iDx*Ad*reshape(RF,Nx,1); */
    P0_3 = &P0[10];
    for (i_2 = 0; i_2 < 10; i_2++) {
      iDx_1[i_2] = 0.0;
      for (k_ = 0; k_ < 10; k_++) {
        iDx_tmp = i_2 + 10 * k_;
        iDx_0[iDx_tmp] = 0.0;
        for (i_0 = 0; i_0 < 10; i_0++) {
          iDx_0[iDx_tmp] = iDx[10 * i_0 + i_2] * P0_3[10 * k_ + i_0] + iDx_0[10 *
            k_ + i_2];
        }

        iDx_1[i_2] += iDx_0[10 * k_ + i_2] * P0[180 + k_];
      }

      AR[i_2 + i] = iDx_1[i_2];
    }
  }
}
