/* Generated by CIL v. 1.7.3 */
/* print_CIL_Input is true */

#line 1
#pragma merger("0","./lib.i","")
#line 318 "/usr/include/stdio.h"
extern int printf(char const   * __restrict  __format  , ...) ;
#line 5 "lib.c"
void vtrace2(int a___0 , int b ) 
{ 


  {
#line 6
  printf((char const   * __restrict  )"done! %d - %d\n", a___0, b);
#line 7
  return;
}
}
#line 1 "test6.o"
#pragma merger("0","./test6.i","")
#line 10 "test6.c"
float a  =    (float )1.2;
#line 12 "test6.c"
int main(void) 
{ 
  int x ;
  int y ;

  {
#line 13
  x = 3;
#line 13
  y = 1;
#line 14
  printf((char const   * __restrict  )"hi\n");
  {
#line 15
  while (1) {
    vtrace2(x, y);
#line 15
    if (! (x > y)) {
#line 15
      break;
    }
#line 16
    x --;
  }
  }
#line 18
  return (0);
}
}
