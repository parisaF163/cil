#include <stdio.h>
int g = 0;

int plus (int a, int b)
{
	//int sum = a + b;
	//return sum;
return a + b;
}

int main(){
	int x = 1, y = 3;
	int res = plus(x,y);
	printf("res: %d + %d = %d\n",x,y,res);
	return 0;
}
