# 1 "./test7.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./test7.cil.c"
# 4 "test7.c"
int main(void)
{
  int x ;
  int y ;

  {
# 6 "test7.c"
  while (1) {
    vtrace0(x, y);
# 6 "test7.c"
    if (! (x < y)) {
# 6 "test7.c"
      break;
    }
# 7 "test7.c"
    x --;
# 8 "test7.c"
    while (1) {
      vtrace0(x);
# 8 "test7.c"
      if (! (x < 5)) {
# 8 "test7.c"
        break;
      }
# 9 "test7.c"
      x ++;
    }
  }
# 12 "test7.c"
  return (0);
}
}
