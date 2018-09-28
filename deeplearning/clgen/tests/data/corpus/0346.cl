__kernel void fn_A(const int A, __global int* B, __global int* C) {
  unsigned int D = get_global_id(0);
  unsigned int E = get_global_id(1);
  unsigned int F = D + A * E;
  unsigned int G = 0;

  unsigned int H = 0;
  unsigned int I = A * A;

  int J = 0;
  int K = 0;

  J = 0;
  K = -1;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -1;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -2;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -1;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  int L = B[F];
  if (G >= 3) {
    L = 0;
  }
  if (G == 2) {
    L = 1;
  }
  if (G == 1) {
    L = 0;
  }
  C[F] = L;
}