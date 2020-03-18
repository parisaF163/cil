

#include <stdio.h>
#include <string.h>

int st; 


void o_add4(int * u) {
   *u = 42;  // u is a alias of a global variable
}

void temp(char* u){
	u = "Hello"; 
	printf("temp: %s\n", u);

}

int main() {
   int *t = &st;
   o_add4(t);
   temp("Hi");
   return 0;
}
