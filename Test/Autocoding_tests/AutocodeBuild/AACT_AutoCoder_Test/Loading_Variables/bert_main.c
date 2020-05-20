#include <stdio.h>
#include <stdlib.h>

typedef struct {
    float JD_utc_J2000;
    float orbit_tle[9];
    double teme_to_gcrf[9];
} RTU;

int main (){
   RTU rt_U;

   printf("JD_utc_J2000: %f \n", rt_U.JD_utc_J2000);
   for(int k = 0; k<8; k++){
      printf("Obrit_TLE[%d]: %f \n",k, rt_U.orbit_tle[k]);

   }
   for(int k = 0; k<8; k++){
      printf("teme_to_gcrf[%d]: %f \n",k, rt_U.teme_to_gcrf[k]);
   }
   return(0);
}