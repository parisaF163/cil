#include <stdio.h>

int plus (int a, int b)
{
	a = a + b;
	return a;
}

int main(){
	int x = 1, y = 3;
	int res = plus(x,y);
	printf("res: %d + %d = %d\n",x,y,res);
	return 0;
}
