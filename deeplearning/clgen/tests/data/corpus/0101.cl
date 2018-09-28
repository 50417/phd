__kernel void fn_A(__global int2* A, __global int* B, __global uint2* C, int D) {
  int E, F, G;
  uint2 H;
  unsigned int I, J, K, L;
  int2 M;
  int N = get_global_id(0);
  F = B[N];
  int O = 0;
  M = A[F];
  for (E = 0; E < D; E++, O += 8) {
    if (O + 0 >= M.x) {
      F++;
      M = A[F];
    }
    I = M.y;
    if (O + 1 >= M.x) {
      F++;
      M = A[F];
    }
    J = M.y;
    if (O + 2 >= M.x) {
      F++;
      M = A[F];
    }
    K = M.y;
    if (O + 3 >= M.x) {
      F++;
      M = A[F];
    }
    L = M.y;
    H.x = (L << 24) | (K << 16) | (J << 8) | (I);
    if (O + 4 >= M.x) {
      F++;
      M = A[F];
    }
    I = M.y;
    if (O + 5 >= M.x) {
      F++;
      M = A[F];
    }
    J = M.y;
    if (O + 6 >= M.x) {
      F++;
      M = A[F];
    }
    K = M.y;
    if (O + 7 >= M.x) {
      F++;
      M = A[F];
    }
    L = M.y;
    H.y = (L << 24) | (K << 16) | (J << 8) | (I);

    C[N * D + E] = H;
  }
}