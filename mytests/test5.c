#include <stdio.h>

int plusone (int c){
	int d = plus (c, 1);
	return d;
}
int plus (int a, int b)
{
	return a;
}

int main(){
	int x = 4;
	int res = plusone(x);
	printf("res: %d + 1 = %d\n",x,res);
	return 0;
}
