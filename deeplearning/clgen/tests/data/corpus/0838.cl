kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_A() {
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_B(int A, int B, int C, int D, int E, int F, double G, global double* H, int I, global double* J, int K, double L, global double* M, int N, int O, int P, global double* Q, local double* R, int S) {
  int T = get_global_size(0);
  int U = get_global_id(0);
  int V = D / T;
  int W = D - V * T;
  int X = V * U;

  double* Y = (double*)0x00F00000;
  if (S == 0)
    Q = (global double*)0;

  if (U < W) {
    V++;
    X += U;
  } else
    X += W;

  __cache_l1d_16k();
  dgemm(B, C, G, L, V, E, F, H + (B == 111 ? X : X * I), I, J, K, M + X, N, O, P, Y, R, Q, U);
  __cache_l1d_all();
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_C(int A, int B, int C, int D, int E, int F, double G, global double* H, int I, global double* J, int K, double L, global double* M, int N, int O, int P, global double* Q, local double* R, int S) {
  cblas_dgemm_omp(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S);
}