/* Generated by CIL v. 1.7.3 */
/* print_CIL_Input is true */

#line 318 "/usr/include/stdio.h"
extern int printf(char const   * __restrict  __format  , ...) ;
#line 6 "aliasTest.c"
int st  ;
#line 9 "aliasTest.c"
void o_add4(int *u ) 
{ 


  {
#line 10
  *u = 42;
#line 11
  return;
}
}
#line 13 "aliasTest.c"
void temp(char *u ) 
{ 


  {
#line 14
  u = (char *)"Hello";
#line 15
  printf((char const   * __restrict  )"temp: %s\n", u);
#line 17
  return;
}
}
#line 19 "aliasTest.c"
int main(void) 
{ 
  int *t ;

  {
#line 20
  t = & st;
#line 21
  o_add4(t);
#line 22
  temp((char *)"Hi");
#line 23
  return (0);
}
}