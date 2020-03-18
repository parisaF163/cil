# 1 "./test1.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./test1.cil.c"
# 318 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 3 "test1.c"
int plusone(int a )
{
  int b ;

  {
# 5 "test1.c"
  b = a + 1;
# 6 "test1.c"
  return (b);
}
}
# 9 "test1.c"
int main(void)
{
  int num ;

  {
# 10 "test1.c"
  num = 10;
# 11 "test1.c"
  num = plusone(num);
# 12 "test1.c"
  printf((char const * __restrict )"num = %d\n", num);
# 13 "test1.c"
  return (0);
}
}
