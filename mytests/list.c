#include <stdio.h>

#define LISTCAP 5

extern void *malloc (size_t __size) __THROW __attribute_malloc__ __wur;

struct state_t { int list[LISTCAP]; int end; };
struct state_t* st;
void o_new() { 
  st = malloc(sizeof(struct state_t));
  st->end=-1;
}
int o_add(int v) {
  int rv = 1;
  for (int i=0; i<=(st)->end; i++) {
    if ((st)->list[i] == v) { rv = 0; break; }
  } 
  if (rv == 1 && (st)->end == LISTCAP) { rv = 0; } 
  else { (st)->list[(st)->end+1] = v;  (st)->end++; }
  return rv;
}
int o_rm(int v) {
  int rv = 0;
  for (int i =0; i<=(st)->end; i++) {
    if ( (st)->list[i] == v) {
      (st)->list[i] = (st)->list[(st)->end]; (st)->end--; rv = 1; break;
    } } 
  return rv;
}
int o_contains(int v) {
  int rv = 0;
  for (int i =0; i<=(st)->end; i++) {                             
    if ( (st)->list[i] == v) {  rv = 1; break; } 
  } 
  return rv;
}
int o_isempty() { 
  return ((st)->end > -1);
}
int o_add4(int * t) {
  *t = 42;  // t is a alias of a global variable
  return 0;
}
int main() {
  int *t = &(st->end);
  o_add4(t);
}

