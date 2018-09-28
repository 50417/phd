kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_A(global int* restrict A, global const int* restrict B, global const int* restrict C, const int D) {
vadd_loop:
  for (int E = 0; E < D; ++E) {
    A[E] = B[E] + C[E];
  }
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_B(global int* restrict A, global const int* restrict B, global const int* restrict C, const int D) {
  int E[128];
  int F = D / 128;

  for (int G = 0; G < F; G++) {
  read_a:
    __attribute__((xcl_pipeline_loop)) for (int H = 0; H < 128; ++H) {
      E[H] = B[G * 128 + H];
    }
  read_b:
    __attribute__((xcl_pipeline_loop)) for (int H = 0; H < 128; ++H) {
      E[H] += C[G * 128 + H];
    }
  write:
    __attribute__((xcl_pipeline_loop)) for (int H = 0; H < 128; ++H) {
      A[G * 128 + H] = E[H];
    }
  }
}