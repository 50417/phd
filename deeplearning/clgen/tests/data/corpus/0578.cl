typedef struct { float x, y, z; } A;
typedef private A* PA;
typedef global A* GA;

void fn_A(void) {
  global int* A;
  local int* B;
 private
  int* C;
  int* D;

  A = to_global(A);

  A = to_global(B);

  A = to_global(C);

  A = to_global(D);

  B = to_local(A);

  B = to_local(B);

  B = to_local(C);

  B = to_local(D);

  C = to_private(A);

  C = to_private(B);

  C = to_private(C);

  C = to_private(D);

  PA E;
  GA F = to_global(E);

  void* G;
  global void* H = to_global(G);
}