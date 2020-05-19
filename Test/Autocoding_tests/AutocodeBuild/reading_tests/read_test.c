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
    while (fgets(buf, 1024, fp)) {
        value_count = 0;
        row_count++;
        if (row_count > 3) {
            printf("We are on Var %d\n", row_count-3);
            char *values = strtok(buf, ",");
            while(values){
                if (value_count < var_length[row_count-4]){
                    printf("%s\n", values);

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