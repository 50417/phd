__kernel void fn_A(const int A, __global int* B, __global int* C) {
  unsigned int D = get_global_id(0);
  unsigned int E = get_global_id(1);
  unsigned int F = D + A * E;
  unsigned int G = 0;

  unsigned int H = 0;
  unsigned int I = A * A;

  int J = 0;
  int K = 0;

  int L = 1;
  int M = 1;

  J = -3;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = -2;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = -2;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = -1;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = -1;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = 0;
  K = -3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = 0;
  K = 3;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = 1;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = 1;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = 2;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = 2;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = 3;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  int N = B[F];

  if (G >= L) {
    N = 0;
  };
  if (G == M) {
    N = B[F] + 1;
  }

  C[F] = N;
}