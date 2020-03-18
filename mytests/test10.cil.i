# 1 "./test10.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./test10.cil.c"
# 318 "./test10.cil.c"
extern int printf(char const * __restrict __format , ...) ;
# 3 "test10.c"
int main(void)
{
  int i ;
  int k ;
  float j ;
  int loop_count ;

  {
# 5 "test10.c"
  i = 0;
# 5 "test10.c"
  k = 0;
# 6 "test10.c"
  j = (float )0;
# 7 "test10.c"
  loop_count = 5;
# 9 "test10.c"
  printf((char const * __restrict )"Case1:\n");
# 10 "test10.c"
  i = 0;
  {
# 10 "test10.c"
  while (1) {
    vtrace0(i, loop_count);
# 10 "test10.c"
    if (! (i < loop_count)) {
# 10 "test10.c"
      break;
    }
# 11 "test10.c"
    printf((char const * __restrict )"%d\n", i);
# 10 "test10.c"
    i ++;
  }
  }
# 14 "test10.c"
  printf((char const * __restrict )"Case2:\n");
# 15 "test10.c"
  j = (float )5.5;
  {
# 15 "test10.c"
  while (1) {
    vtrace0(j);
# 15 "test10.c"
    if (! (j > (float )0)) {
# 15 "test10.c"
      break;
    }
# 16 "test10.c"
    printf((char const * __restrict )"%f\n", (double )j);
# 15 "test10.c"
    j -= (float )1;
  }
  }
# 19 "test10.c"
  printf((char const * __restrict )"Case3:\n");
# 20 "test10.c"
  i = 2;
  {
# 20 "test10.c"
  while (1) {
    vtrace0(i);
# 20 "test10.c"
    if (i < 5) {
# 20 "test10.c"
      if (! (i >= 2)) {
# 20 "test10.c"
        break;
      }
    } else {
# 20 "test10.c"
      break;
    }
# 21 "test10.c"
    printf((char const * __restrict )"%d\n", i);
# 20 "test10.c"
    i ++;
  }
  }
# 24 "test10.c"
  printf((char const * __restrict )"Case4:\n");
# 25 "test10.c"
  i = 0;
  {
# 25 "test10.c"
  while (1) {
    vtrace0(i);
# 25 "test10.c"
    if (! (i != 5)) {
# 25 "test10.c"
      break;
    }
# 26 "test10.c"
    printf((char const * __restrict )"%d\n", i);
# 25 "test10.c"
    i ++;
  }
  }
# 29 "test10.c"
  printf((char const * __restrict )"Case5:\n");
# 31 "test10.c"
  i = 0;
  {
# 31 "test10.c"
  while (1) {
    vtrace0(i, loop_count);
# 31 "test10.c"
    if (! (i < loop_count)) {
# 31 "test10.c"
      break;
    }
# 31 "test10.c"
    i ++;
  }
  }
# 33 "test10.c"
  printf((char const * __restrict )"Case6:\n");
# 34 "test10.c"
  i = 0;
# 34 "test10.c"
  k = 0;
  {
# 34 "test10.c"
  while (1) {
    vtrace0(i);
# 34 "test10.c"
    if (i < 5) {
# 34 "test10.c"
      if (! (k < 3)) {
# 34 "test10.c"
        break;
      }
    } else {
# 34 "test10.c"
      break;
    }
# 35 "test10.c"
    printf((char const * __restrict )"%d\n", i);
# 34 "test10.c"
    i ++;
# 34 "test10.c"
    k ++;
  }
  }
# 38 "test10.c"
  printf((char const * __restrict )"Case7:\n");
# 39 "test10.c"
  i = 5;
  {
# 40 "test10.c"
  while (1) {
    vtrace0();
# 40 "test10.c"
    break;
# 41 "test10.c"
    printf((char const * __restrict )"%d\n", i);
# 40 "test10.c"
    i ++;
  }
  }
# 44 "test10.c"
  return (0);
}
}
