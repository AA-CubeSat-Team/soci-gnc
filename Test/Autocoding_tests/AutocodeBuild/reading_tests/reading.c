#include <stdio.h>
#include <stdlib.h>

typedef struct {
    float JD_utc_J2000;
    float orbit_tle[9];
    double teme_to_gcrf[9];
} RTU;


int main () {
   //char str1[10], str2[10], str3[10];
   RTU rt_U;
   FILE * fp;
   char ch;
   int num_in;
   char buffer[1024];
   float jd_utc;
   float orbit_tle[9];
   float teme_to_gcrf[9];


   //JD_utc_J2000,orbit_tle,teme_to_gcrf,

   fp = fopen ("input.txt", "r");
   
   fscanf(fp, "%s", buffer);
   fscanf(fp, "%s", buffer);
   fscanf(fp, "%s", buffer);
   fscanf(fp, "%s", buffer);
   fscanf(fp, "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f", &rt_U.JD_utc_J2000, 
   &orbit_tle[0],&orbit_tle[1],&orbit_tle[2],&orbit_tle[3],&orbit_tle[4],&orbit_tle[5],&orbit_tle[6],&orbit_tle[7],&orbit_tle[8],
   &teme_to_gcrf[0],&teme_to_gcrf[1],&teme_to_gcrf[2],&teme_to_gcrf[3],&teme_to_gcrf[4],&teme_to_gcrf[5],&teme_to_gcrf[6],&teme_to_gcrf[7],&teme_to_gcrf[8]);



   // fscanf(fp, "%d", num_in);
   
   printf("JD_utc_J2000: %f \n", rt_U.JD_utc_J2000);
   for(int k = 0; k<8; k++){
      printf("Obrit_TLE[%d]: %f \n",k, orbit_tle[k]);

   }
   for(int k = 0; k<8; k++){
      printf("teme_to_gcrf[%d]: %f \n",k, teme_to_gcrf[k]);
   }






   fclose(fp);
   
   return(0);
}