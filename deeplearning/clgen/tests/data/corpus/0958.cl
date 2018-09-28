kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_A(global int* A, const int B, const int C, const int D) {
mscale:
  for (int E = 0; E < C * D; ++E)
    A[E] = A[E] * B;
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_B(global int* A, global const int* B, global const int* C, const int D, const int E) {
  int F[64 * 64];
  int G[64 * 64];

madd_readA:
  for (int H = 0; H < D * E; ++H)
    F[H] = B[H];
madd_readB:
  for (int H = 0; H < D * E; ++H)
    G[H] = C[H];
madd_writeC:
  for (int H = 0; H < D * E; ++H)
    A[H] = F[H] + G[H];
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_C(global int* A, global const int* B, global const int* C, const int D, const int E) {
  int F[64 * 64];
  int G[64 * 64];
madd_readA:
  for (int H = 0; H < D * E; ++H)
    F[H] = B[H];
madd_readB:
  for (int H = 0; H < D * E; ++H)
    G[H] = C[H];

  for (int I = 0; I < E; ++I) {
    for (int H = 0; H < D; ++H) {
      int J = 0;
      for (int K = 0; K < E; ++K)
        J += F[K + H * D] * G[I + K * D];

      A[H + I * D] = J;
    }
  }
}