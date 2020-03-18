# 1 "./hello.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./hello.cil.c"
# 318 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 2 "hello.c"
int main(void)
{


  {
# 2 "hello.c"
  printf("enter main\n");
  {
# 4 "hello.c"
  printf("call printf\n");
# 4 "hello.c"
  printf((char const * __restrict )"Hello, World!");
# 4 "hello.c"
  printf("return from printf\n");
  {
# 5 "hello.c"
  printf("exit main\n");
# 5 "hello.c"
  return (0);
  }
  }
}
}
