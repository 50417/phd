typedef struct {
  char c;
  void* v;
  void* v2;
} my_st;

kernel void A(global long* a) {
  int b[sizeof(my_st) == 24 ? 1 : -1];
  int c[sizeof(void*) == 8 ? 1 : -1];
  int d[sizeof(a) == 8 ? 1 : -1];

  my_st* e = 0;
  a[3] = (long)(&e->v);

  a[4] = (long)(&e->v2);
}