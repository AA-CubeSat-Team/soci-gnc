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
    const char *nameof[3] = {"JD_utc_J2000","orbit_tle","teme_to_gcrf"};

    struct rt_U {
        float orbit_tle[9];
    }

    float tle[9] = {1,2,3,4,5,6,7,8,9};
    
    rt_U.(nameof{1})[0] = 1 ;

    while (fgets(buf, 1024, fp)) {
        value_count = 0;
        row_count++;
        if (row_count > 3) {
            printf("We are on Var %d\n", row_count-3);
            char *values = strtok(buf, ",");
            while(values){
                if (value_count < var_length[row_count-4]){
                    // printf("%s\n", values);
                    switch(row_count){
                        case 4:
                            printf("JD_UT1 Val: %s \n",values);
                            //rt_U.JD_UT1[value_count] = atof(values); 
                            break;
                        case 5 :
                            printf("Var 2 Val: %s \n",values);
                            break;
                        case 6 :
                            printf("Var 3 Val: %s \n",values);

                    //rt_Onestep();
                }

                
                    

            }
                values = strtok(NULL, ",");
                value_count++;
            }
            printf("Value Count: %d \n",value_count - 1);
            printf("\n");
        }
        

    }

    fclose(fp);

    return 0;
}