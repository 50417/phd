__kernel void fn_A(__global unsigned char* A, __global int* B, __global int* C, __global unsigned char* D) {
  int E = get_group_id(0);
  int F = get_group_id(1);
  int G = get_local_id(0);
  int H = get_local_id(1);
  int I, J, K, L;
  int M, N, O, P, Q, R;
  unsigned char S;
  int T, U, V;
  int W = 10;
  int X = E * 32 + G;
  int Y = F * 32 + H;
  T = 1 << C[5];
  U = 1 << (C[5] * 2 - W);
  V = U >> 1;

  if ((X < C[2]) && (Y < C[3])) {
    K = C[0] + B[1] * X + B[0] * Y;
    L = C[1] + B[4] * X + B[3] * Y;
    I = (K >> C[5]) - 1;
    J = (L >> C[5]) - 1;
    M = K % T;
    N = L % T;
    O = (M * N) >> W;
    P = (T - N) * M >> W;
    Q = (T - M) * N >> W;
    R = U - O - Q - P;
    S = (A[J * C[4] + I] * R + A[(J + 1) * C[4] + I] * Q + A[J * C[4] + I + 1] * P + A[(J + 1) * C[4] + I + 1] * O + V) / U;
    D[X * C[3] + Y] = S;
  }
}