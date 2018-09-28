__kernel void fn_A(const int A, __global int* B, __global int* C) {
  unsigned int D = get_global_id(0);
  unsigned int E = get_global_id(1);
  unsigned int F = D + A * E;
  int G = 0;

  unsigned int H = 0;
  unsigned int I = A * A;

  int J = 0;
  int K = 0;

  J = 0;
  K = -1;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] != 0) {
    G += B[H];
  }

  J = 1;
  K = -1;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] != 0) {
    G += B[H];
  }

  J = 1;
  K = 0;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] != 0) {
    G += B[H];
  }

  J = 1;
  K = 1;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] != 0) {
    G += B[H];
  }

  J = 0;
  K = 1;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] != 0) {
    G += B[H];
  }

  J = -1;
  K = 1;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] != 0) {
    G += B[H];
  }

  J = -1;
  K = 0;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] != 0) {
    G += B[H];
  }

  J = -1;
  K = -1;
  H = (F + J) % A + (E * A + A * K) % I;
  if (B[H] != 0) {
    G += B[H];
  }
  int L = B[F];
  if (G >= 3 || G <= -3) {
    if (B[F] == -1 && (G == -6 || G == 3 || G >= 7)) {
      L = B[F] * -1;
    }
    if (B[F] == 1 && (G <= -7 || G == -3 || G == 6)) {
      L = B[F] * -1;
    }
    if (B[F] == 0 && G < 0) {
      L = -1;
    }
    if (B[F] == 0 && G > 0) {
      L = 1;
    }
  } else {
    L = 0;
  }
  C[F] = L;
}