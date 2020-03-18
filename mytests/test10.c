#include <stdio.h>

int main () {

    int i = 0, k = 0;
    float j = 0;
    int loop_count = 5;

    printf("Case1:\n");
    for (i=0; i < loop_count; i++) {
        printf("%d\n",i);
    }

    printf("Case2:\n");
    for (j=5.5; j > 0; j--) {
        printf("%f\n",j);
    }

    printf("Case3:\n");
    for (i=2; (i < 5 && i >=2); i++) {
        printf("%d\n",i);
    }

    printf("Case4:\n");
    for (i=0; (i != 5); i++) {
        printf("%d\n",i);
    }

    printf("Case5:\n");
    /* Blank loop  */
    for (i=0; i < loop_count; i++) ;

    printf("Case6:\n");
    for (i=0, k=0; (i < 5 && k < 3); i++, k++) {
        printf("%d\n",i);
    }

    printf("Case7:\n");
    i=5;
    for (; 0; i++) {
        printf("%d\n",i);
    }

    return 0;
}
