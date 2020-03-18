# 1 "./test2.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./test2.cil.c"
# 318 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 2 "test2.c"
int g = 0;
# 4 "test2.c"
int plus(int a , int b )
{


  {
# 8 "test2.c"
  return (a + b);
}
}
# 11 "test2.c"
int main(void)
{
  int x ;
  int y ;
  int res ;
  int tmp ;

  {
# 12 "test2.c"
  x = 1;
# 12 "test2.c"
  y = 3;
# 13 "test2.c"
  tmp = plus(x, y);
# 13 "test2.c"
  res = tmp;
# 14 "test2.c"
  printf((char const * __restrict )"res: %d + %d = %d\n", x, y, res);
# 15 "test2.c"
  return (0);
}
}
