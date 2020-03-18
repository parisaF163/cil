#include <stdio.h>

int plusone(int a){
	int b;
	b = a + 1;
	return b;
}

int main(){
	int num = 10;
	num = plusone(num);
	printf("num = %d\n", num);
	return 0;
}
