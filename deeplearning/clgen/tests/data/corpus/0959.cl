__kernel void __attribute__((reqd_work_group_size(1, 1, 1))) fn_A(__global int* A, __global int* B, const int C) {
  int D[256];
  int E[256];
  int F[256];
  int G[256];
  for (int H = 0; H < C; H += 256) {
    int I = 256;
    if (H + I > C)
      I = C - H;

    __attribute__((xcl_pipeline_loop)) readA : for (int J = 0; J < 4 * I; J++) {
      int K = A[H + J];
      switch (J % 4) {
        case 0:
          D[J / 4] = K;
          break;
        case 1:
          E[J / 4] = K;
          break;
        case 2:
          F[J / 4] = K;
          break;
        case 3:
          G[J / 4] = K;
          break;
      }
    }
  vadd_writeC:
    for (int J = 0; J < I; J++)
      B[J] = D[J] + E[J] + F[J] + G[J];
  }
  return;
}