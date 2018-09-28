typedef struct {
  char c;
  void* v;
  void* v2;
} my_st;

kernel void fn_A(global long* A) {
  int B[sizeof(my_st) == 24 ? 1 : -1];
  int C[sizeof(void*) == 8 ? 1 : -1];
  int D[sizeof(A) == 8 ? 1 : -1];

  my_st* E = 0;
  A[3] = (long)(&E->v);

  A[4] = (long)(&E->v2);
}