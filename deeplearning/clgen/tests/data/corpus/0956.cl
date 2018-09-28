kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_A(global int* A, global const int* B, global const int* C, const int D) {
  int E[256];
  int F[256];
  for (int G = 0; G < D; G += 256) {
    int H = 256;
    if (G + H > D)
      H = D - G;
  readA:
    for (int I = 0; I < H; I++)
      E[I] = B[G + I];
  readB:
    for (int I = 0; I < H; I++)
      F[I] = C[G + I];
  vadd_writeC:
    for (int I = 0; I < H; I++)
      A[G + I] = E[I] + F[I];
  }
}