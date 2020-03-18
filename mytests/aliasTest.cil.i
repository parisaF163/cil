# 1 "./aliasTest.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./aliasTest.cil.c"
# 318 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 6 "aliasTest.c"
int st ;
# 9 "aliasTest.c"
void o_add4(int *u )
{


  {
# 10 "aliasTest.c"
  *u = 42;
# 11 "aliasTest.c"
  return;
}
}
# 13 "aliasTest.c"
void temp(char *u )
{


  {
# 14 "aliasTest.c"
  u = (char *)"Hello";
# 15 "aliasTest.c"
  printf((char const * __restrict )"temp: %s\n", u);
# 17 "aliasTest.c"
  return;
}
}
# 19 "aliasTest.c"
int main(void)
{
  int *t ;

  {
# 20 "aliasTest.c"
  t = & st;
# 21 "aliasTest.c"
  o_add4(t);
# 22 "aliasTest.c"
  temp((char *)"Hi");
# 23 "aliasTest.c"
  return (0);
}
}
