# 1 "./test5.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./test5.cil.c"
# 318 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 4 "test5.c"
int plus(int a , int b ) ;
# 3 "test5.c"
int plusone(int c )
{
  int d ;
  int tmp ;

  {
# 4 "test5.c"
  tmp = plus(c, 1);
# 4 "test5.c"
  d = tmp;
# 5 "test5.c"
  return (d);
}
}
# 7 "test5.c"
int plus(int a , int b )
{


  {
# 9 "test5.c"
  return (a);
}
}
# 12 "test5.c"
int main(void)
{
  int x ;
  int res ;
  int tmp ;

  {
# 13 "test5.c"
  x = 4;
# 14 "test5.c"
  tmp = plusone(x);
# 14 "test5.c"
  res = tmp;
# 15 "test5.c"
  printf((char const * __restrict )"res: %d + 1 = %d\n", x, res);
# 16 "test5.c"
  return (0);
}
}
