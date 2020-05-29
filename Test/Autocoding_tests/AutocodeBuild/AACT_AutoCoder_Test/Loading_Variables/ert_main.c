#include <stdio.h>
#include <stdlib.h>

typedef struct {
    float JD_utc_J2000;
    float orbit_tle[9];
    double teme_to_gcrf[9];
} RTU;

int main (){
   RTU rt_U;

	char buffer[1024];
	int num_trials = 1;
	FILE * fp; 
	fp = fopen ("input.txt", "r");
	fscanf(fp, "%s", buffer);
	fscanf(fp, "%s", buffer);
	fscanf(fp, "%s", buffer);
	fscanf(fp, "%s", buffer);
	// This Line will pull in variables from text file 
	fscanf(fp,"%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf", &rt_U.JD_utc_J2000, &rt_U.orbit_tle[0], &rt_U.orbit_tle[1], &rt_U.orbit_tle[2], &rt_U.orbit_tle[3], &rt_U.orbit_tle[4], &rt_U.orbit_tle[5], &rt_U.orbit_tle[6], &rt_U.orbit_tle[7], &rt_U.orbit_tle[8], &rt_U.teme_to_gcrf[0], &rt_U.teme_to_gcrf[1], &rt_U.teme_to_gcrf[2], &rt_U.teme_to_gcrf[3], &rt_U.teme_to_gcrf[4], &rt_U.teme_to_gcrf[5], &rt_U.teme_to_gcrf[6], &rt_U.teme_to_gcrf[7], &rt_U.teme_to_gcrf[8]);

   printf("JD_utc_J2000: %f \n", rt_U.JD_utc_J2000);
   for(int k = 0; k<8; k++){
      printf("Obrit_TLE[%d]: %f \n",k, rt_U.orbit_tle[k]);

   }
   for(int k = 0; k<8; k++){
      printf("teme_to_gcrf[%d]: %f \n",k, rt_U.teme_to_gcrf[k]);
   }
   return(0);
}