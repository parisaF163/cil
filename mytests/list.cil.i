# 1 "./list.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./list.cil.c"
# 212 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h"
typedef unsigned long size_t;
# 7 "list.c"
struct state_t {
   int list[5] ;
   int end ;
};
# 5 "list.c"
extern __attribute__((__nothrow__)) void *( __attribute__((__leaf__)) malloc)(size_t __size ) __attribute__((__malloc__)) ;
# 8 "list.c"
struct state_t *st ;
# 9 "list.c"
void o_new(void)
{
  void *tmp ;

  {
# 10 "list.c"
  tmp = malloc(sizeof(struct state_t ));
# 10 "list.c"
  st = (struct state_t *)tmp;
# 11 "list.c"
  st->end = -1;
# 12 "list.c"
  return;
}
}
# 13 "list.c"
int o_add(int v )
{
  int rv ;
  int i ;

  {
# 14 "list.c"
  rv = 1;
# 15 "list.c"
  i = 0;
# 15 "list.c"
  while (i <= st->end) {
# 16 "list.c"
    if (st->list[i] == v) {
# 16 "list.c"
      rv = 0;
# 16 "list.c"
      break;
    }
# 15 "list.c"
    i ++;
  }
# 18 "list.c"
  if (rv == 1) {
# 18 "list.c"
    if (st->end == 5) {
# 18 "list.c"
      rv = 0;
    } else {
# 19 "list.c"
      st->list[st->end + 1] = v;
# 19 "list.c"
      (st->end) ++;
    }
  } else {
# 19 "list.c"
    st->list[st->end + 1] = v;
# 19 "list.c"
    (st->end) ++;
  }
# 20 "list.c"
  return (rv);
}
}
# 22 "list.c"
int o_rm(int v )
{
  int rv ;
  int i ;

  {
# 23 "list.c"
  rv = 0;
# 24 "list.c"
  i = 0;
# 24 "list.c"
  while (i <= st->end) {
# 25 "list.c"
    if (st->list[i] == v) {
# 26 "list.c"
      st->list[i] = st->list[st->end];
# 26 "list.c"
      (st->end) --;
# 26 "list.c"
      rv = 1;
# 26 "list.c"
      break;
    }
# 24 "list.c"
    i ++;
  }
# 28 "list.c"
  return (rv);
}
}
# 30 "list.c"
int o_contains(int v )
{
  int rv ;
  int i ;

  {
# 31 "list.c"
  rv = 0;
# 32 "list.c"
  i = 0;
# 32 "list.c"
  while (i <= st->end) {
# 33 "list.c"
    if (st->list[i] == v) {
# 33 "list.c"
      rv = 1;
# 33 "list.c"
      break;
    }
# 32 "list.c"
    i ++;
  }
# 35 "list.c"
  return (rv);
}
}
# 37 "list.c"
int o_isempty(void)
{


  {
# 38 "list.c"
  return (st->end > -1);
}
}
# 40 "list.c"
int o_add4(int *t )
{


  {
# 41 "list.c"
  *t = 42;
# 42 "list.c"
  return (0);
}
}
# 44 "list.c"
int main(void)
{
  int *t ;

  {
# 45 "list.c"
  t = & st->end;
# 46 "list.c"
  o_add4(t);
# 47 "list.c"
  return (0);
}
}
