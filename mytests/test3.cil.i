# 1 "./test3.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./test3.cil.c"
# 318 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 3 "test3.c"
int plus(int a , int b )
{
  int sum ;

  {
# 5 "test3.c"
  sum = a + b;
# 6 "test3.c"
  return (sum);
}
}
# 9 "test3.c"
int main(void)
{
  int x ;
  int y ;
  int res ;
  int tmp ;

  {
# 10 "test3.c"
  x = 1;
# 10 "test3.c"
  y = 3;
# 11 "test3.c"
  tmp = plus(x, y);
# 11 "test3.c"
  res = tmp;
# 12 "test3.c"
  printf((char const * __restrict )"res: %d + %d = %d\n", x, y, res);
# 13 "test3.c"
  return (0);
}
}
