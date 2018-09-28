__kernel void fn_A(const int A, __global int* B, __global int* C) {
  unsigned int D = get_global_id(0);
  unsigned int E = get_global_id(1);
  unsigned int F = D + A * E;
  unsigned int G = 0;

  unsigned int H = 0;
  unsigned int I = A * A;

  int J = 0;
  int K = 0;

  int L = 8;
  int M = A / L;

  int N = D / M;
  int O = E / M;

  int P = N % L;
  int Q = O % L;
  int R = 0;

  int S = 2;

  int T = B[F];

  J = -1;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = 1;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = -1;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = 1;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  if (G >= Q && G <= Q + S) {
    T = B[F] + 1;
  }
  if (G >= P) {
    T = 0;
  }

  if (G == 2) {
    T = 0;
  }

  if (T >= 1278) {
    T = 1278;
  }
  C[F] = T;
}