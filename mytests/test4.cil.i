# 1 "./test4.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./test4.cil.c"
# 1 "test4.o"
#pragma merger("0","./test4.i","")
# 318 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 3 "test4.c"
int plus(int a , int b )
{


  {
# 5 "test4.c"
  a += b;
# 6 "test4.c"
  return (a);
}
}
# 9 "test4.c"
int main(void)
{
  int x ;
  int y ;
  int res ;
  int tmp ;

  {
# 10 "test4.c"
  x = 1;
# 10 "test4.c"
  y = 3;
# 11 "test4.c"
  tmp = plus(x, y);
# 11 "test4.c"
  res = tmp;
# 12 "test4.c"
  printf((char const * __restrict )"res: %d + %d = %d\n", x, y, res);
# 13 "test4.c"
  return (0);
}
}
