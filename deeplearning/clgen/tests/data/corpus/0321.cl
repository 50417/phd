__kernel void fn_A(const int A, __global int* B, __global int* C) {
  unsigned int D = get_global_id(0);
  unsigned int E = get_global_id(1);
  unsigned int F = D + A * E;
  unsigned int G = 0;

  unsigned int H = 0;
  unsigned int I = A * A;

  int J = 0;
  int K = 0;

  int L = 32;
  int M = A / L;

  int N = D / M;
  int O = E / M;

  int P = N % L;
  int Q = O % L;
  int R = 6;

  J = -3;
  K = -3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = 3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = 3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = -3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = 3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] == 1) {
    G += 1;
  }

  int S = B[F];

  if (G <= R) {
    S = 0;
  }
  if (G >= 10 && G <= 13) {
    S = 0;
  }
  if (G == Q) {
    S = 1;
  }
  if (G >= 18 && G <= 24) {
    S = 1;
  }
  if (G >= P) {
    S = 0;
  }

  C[F] = S;
}