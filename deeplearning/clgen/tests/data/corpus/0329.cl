__kernel void fn_A(const int A, __global int* B, __global int* C) {
  unsigned int D = get_global_id(0);
  unsigned int E = get_global_id(1);
  unsigned int F = D + A * E;
  unsigned int G = 0;

  unsigned int H = 0;
  unsigned int I = A * A;

  int J = 0;
  int K = 0;

  J = -2;
  K = 0;
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

  J = -1;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += 1;
  }

  J = 0;
  K = -2;
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

  J = 2;
  K = 0;
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

  int L = B[F];
  if (G >= 4 && G <= 6) {
    L = B[F] + 1;
  }
  if (G >= 1 && G <= 3) {
    L = 0;
  }

  if (L >= 1278) {
    L = 1278;
  }

  C[F] = L;
}