#include <stdio.h>
#include <string.h>

int main(void) {
    FILE *fp = fopen("input.txt", "r");

    if (!fp) {
        printf("Can't open file\n");
        return 0;
    }

    int num_var = 3;
    int var_length[3] = {1,9,9};

    char buf[1024];
    int row_count = 0;
    int value_count = 0;
    const char *nameof[3]; = {"JD_utc_J2000","orbit_tle","teme_to_gcrf"};

    struct rt_U {
        float JD_utc_J2000;
    };


    while (fgets(buf, 1024, fp)) {
        value_count = 0;
        row_count++; 
        //once at data   
        if (row_count > 3) {

            //pull line
            char *VALUES = strtok(buf, ",");
            
            
            for(int i =0; i<var_length[0]; i++){
                    rt_U.JD_utc_J2000[i] = atof(VALUES[i]);
            }



                
            VALUES = strtok(NULL, ",");
            value_count++;

            // rt_OneStep();
            printf("End of Row. Would Step Here \n")
        }
        

    }

    fclose(fp);

    return 0;
}