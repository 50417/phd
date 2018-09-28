__kernel void fn_A(__global char* A, __global char* B, int C, int D) {
  unsigned int E = get_global_id(0);

  unsigned int F = E * 4;

  unsigned int G, H;

  H = E / C;

  G = E % C;

  if ((G < C - 1) && (G > 0) && (H > 0) && (H < D - 1)) {
    unsigned int I;
    I = -A[F - 4] + 8 * A[F] + -A[F + 4] +

        -A[F - 4 - 4 * C] + -A[F - 4 + 4 * C] +

        -A[F + 4 - 4 * C] + -A[F + 4 + 4 * C] +

        -A[F - 4 * C] + -A[F + 4 * C];

    I = I;
    if (I > 255) {
      B[F] = 255;
    } else {
      B[F] = I;
    }

    I = -A[F - 3] + 8 * A[F + 1] + -A[F + 5] +

        -A[F - 3 - 4 * C] + -A[F - 3 + 4 * C] +

        -A[F + 5 - 4 * C] + -A[F + 5 + 4 * C] +

        -A[F - 4 * C + 1] + -A[F + 4 * C + 1];

    I = I;
    if (I > 255) {
      B[F + 1] = 255;
    } else {
      B[F + 1] = I;
    }

    I = -A[F - 2] + 8 * A[F + 2] + -A[F + 6] +

        -A[F - 2 - 4 * C] + -A[F - 2 + 4 * C] +

        -A[F + 6 - 4 * C] + -A[F + 6 + 4 * C] +

        -A[F - 4 * C + 2] + -A[F + 4 * C + 2];

    I = I;
    if (I > 255) {
      B[F + 2] = 255;
    } else {
      B[F + 2] = I;
    }

  } else {
    B[F] = A[F];
    B[F + 1] = A[F + 1];
    B[F + 2] = A[F + 2];
  }

  B[F + 3] = A[F + 3];
}