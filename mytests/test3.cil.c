/* Generated by CIL v. 1.7.3 */
/* print_CIL_Input is true */

#line 318 "/usr/include/stdio.h"
extern int printf(char const   * __restrict  __format  , ...) ;
#line 3 "test3.c"
int plus(int a , int b ) 
{ 
  int sum ;

  {
#line 5
  sum = a + b;
#line 6
  return (sum);
}
}
#line 9 "test3.c"
int main(void) 
{ 
  int x ;
  int y ;
  int res ;
  int tmp ;

  {
#line 10
  x = 1;
#line 10
  y = 3;
#line 11
  tmp = plus(x, y);
#line 11
  res = tmp;
#line 12
  printf((char const   * __restrict  )"res: %d + %d = %d\n", x, y, res);
#line 13
  return (0);
}
}
