# 1 "./test8.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./test8.cil.c"
# 318 "./test8.cil.c"
extern int printf(char const * __restrict __format , ...) ;
# 3 "test8.c"
int g = 2;
# 5 "test8.c"
void f(void)
{
  int d ;

  {
# 6 "test8.c"
  d = 1;
# 7 "test8.c"
  return;
}
}
# 9 "test8.c"
int main(void)
{
  int x ;
  int y ;
  int z ;

  {
# 10 "test8.c"
  x = 3;
# 10 "test8.c"
  y = 1;
# 11 "test8.c"
  printf((char const * __restrict )"hi\n");
  {
# 12 "test8.c"
  while (1) {
    vtrace1(x, y);
# 12 "test8.c"
    if (! (x > y)) {
# 12 "test8.c"
      break;
    }
# 13 "test8.c"
    x --;
  }
  }
# 15 "test8.c"
  z = 0;
  {
# 15 "test8.c"
  while (1) {
    vtrace1(z);
# 15 "test8.c"
    if (! (z < 2)) {
# 15 "test8.c"
      break;
    }
# 16 "test8.c"
    printf((char const * __restrict )"%d\n", z);
# 15 "test8.c"
    z ++;
  }
  }
# 18 "test8.c"
  return (0);
}
}
