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
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 1;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 1;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 1;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 0;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = -1;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = -1;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = -1;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 0;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 1;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 2;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 2;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 2;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 2;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 2;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 1;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = 0;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = -1;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = -2;
  K = 2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = -2;
  K = 1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = -2;
  K = 0;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = -2;
  K = -1;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = -2;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  J = -1;
  K = -2;
  H = ((F + J) & (A - 1)) + ((E * A + A * K) & (I - 1));
  if (B[H] != 0) {
    G += B[H];
  }

  int L = B[F];
  if (G >= 6 || G <= -6) {
    if (B[F] == -1 && ((G >= -7 && G <= -6) || (G >= -28 && G <= -24))) {
      L = B[F] * -1;
    }
    if (B[F] == 1 && ((G >= 6 && G <= 7) || (G >= 24 && G <= 28))) {
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