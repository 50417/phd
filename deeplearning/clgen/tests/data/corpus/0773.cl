__kernel void fn_A(__global unsigned char* A, __global int* B, __global int* C, __global unsigned char* D) {
  int E = get_global_id(0);
  int F = get_global_id(1);

  int G, H, I, J;
  int K, L, M, N, O, P;
  unsigned char Q;
  int R, S, T;
  int U = 10;
  R = 1 << C[5];
  S = 1 << (C[5] * 2 - U);
  T = S >> 1;
  if ((E < C[2]) && (F < C[3])) {
    I = C[0] + B[1] * E + B[0] * F;
    J = C[1] + B[4] * E + B[3] * F;
    G = (I >> C[5]) - 1;
    H = (J >> C[5]) - 1;
    K = I % R;
    L = J % R;
    M = (K * L) >> U;
    N = (R - L) * K >> U;
    O = (R - K) * L >> U;
    P = S - M - O - N;
    Q = (A[H * C[4] + G] * P + A[(H + 1) * C[4] + G] * O + A[H * C[4] + G + 1] * N + A[(H + 1) * C[4] + G + 1] * M + T) / S;
    D[E * C[3] + F] = Q;
  }
}