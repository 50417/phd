typedef double2 magmaDoubleComplex; __kernel void fn_A(__global magmaDoubleComplex* A, int B, int C, __global magmaDoubleComplex* D, int E, int F, int G, int H, int I, int J) {
  __local magmaDoubleComplex K[32][32 + 1];

  int L = get_local_id(0);
  int M = get_local_id(1);
  int N = get_group_id(0) * 32;
  int O = get_group_id(1) * 32;

  D += E;
  A += B;

  D += N + L + ((O + M) * (F));
  A += O + L + ((N + M) * (C));

  int P = O + M;
  if (N + L < G) {
    if (P < I) {
      K[M + 0][L] = D[0 * F];
      if (P + 8 < I) {
        K[M + 8][L] = D[8 * F];
        if (P + 16 < I) {
          K[M + 16][L] = D[16 * F];
          if (P + 24 < I)
            K[M + 24][L] = D[24 * F];
        }
      }
    }
  }

  barrier(1);

  if (O + L < I) {
    if (N + M < G) {
      A[0 * C] = K[L][M + 0];
      if (N + M + 8 < G) {
        A[8 * C] = K[L][M + 8];
        if (N + M + 16 < G) {
          A[16 * C] = K[L][M + 16];
          if (N + M + 24 < G)
            A[24 * C] = K[L][M + 24];
        }
      }
    }
  }
}

__kernel void fn_B(__global magmaDoubleComplex* A, int B, int C, __global magmaDoubleComplex* D, int E, int F, int G, int H, int I, int J) {
  __local magmaDoubleComplex K[32][32 + 1];

  int L = get_local_id(0);
  int M = get_local_id(1);
  int N = get_group_id(0) * 32;
  int O = get_group_id(1) * 32;

  int P, Q;
  if (N + 32 < G)
    P = 0;
  else
    P = H;

  if (O + 32 < I)
    Q = 0;
  else
    Q = J;

  D += E;
  A += B;

  D += N + L - P + ((O + M - Q) * (F));
  A += O + L - Q + ((N + M - P) * (C));

  K[M + 0][L] = D[0 * F];
  K[M + 8][L] = D[8 * F];
  K[M + 16][L] = D[16 * F];
  K[M + 24][L] = D[24 * F];

  barrier(1);

  A[0 * C] = K[L][M + 0];
  A[8 * C] = K[L][M + 8];
  A[16 * C] = K[L][M + 16];
  A[24 * C] = K[L][M + 24];
}