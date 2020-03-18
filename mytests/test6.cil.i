# 1 "./test6.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./test6.cil.c"
# 1 "./test6.cil.c"
#pragma merger("0","./lib.i","")
# 318 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 5 "lib.c"
void vtrace2(int a___0 , int b )
{


  {
# 6 "lib.c"
  printf((char const * __restrict )"done! %d - %d\n", a___0, b);
# 7 "lib.c"
  return;
}
}
# 1 "test6.o"
#pragma merger("0","./test6.i","")
# 10 "test6.c"
float a = (float )1.2;
# 12 "test6.c"
int main(void)
{
  int x ;
  int y ;

  {
# 13 "test6.c"
  x = 3;
# 13 "test6.c"
  y = 1;
# 14 "test6.c"
  printf((char const * __restrict )"hi\n");
  {
# 15 "test6.c"
  while (1) {
    vtrace2(x, y);
# 15 "test6.c"
    if (! (x > y)) {
# 15 "test6.c"
      break;
    }
# 16 "test6.c"
    x --;
  }
  }
# 18 "test6.c"
  return (0);
}
}
