typedef float DATA_TYPE; __kernel void fn_A(__global DATA_TYPE* A, __global DATA_TYPE* B, int C, int D, int E, int F) {
  int G = get_global_id(0);
  int H = get_global_id(1);

  DATA_TYPE I, J, K, L, M, N, O, P, Q;
  I = +2;
  L = +5;
  O = -8;
  J = -3;
  M = +6;
  P = -9;
  K = +4;
  N = +7;
  Q = +10;

  if ((F < (C - 1)) && (H < (D - 1)) && (G < (E - 1)) && (F > 0) && (H > 0) && (G > 0)) {
    B[F * (E * D) + H * E + G] = I * A[(F - 1) * (E * D) + (H - 1) * E + (G - 1)] + K * A[(F + 1) * (E * D) + (H - 1) * E + (G - 1)] + L * A[(F - 1) * (E * D) + (H - 1) * E + (G - 1)] + N * A[(F + 1) * (E * D) + (H - 1) * E + (G - 1)] + O * A[(F - 1) * (E * D) + (H - 1) * E + (G - 1)] + Q * A[(F + 1) * (E * D) + (H - 1) * E + (G - 1)] + J * A[(F + 0) * (E * D) + (H - 1) * E + (G + 0)] + M * A[(F + 0) * (E * D) + (H + 0) * E + (G + 0)] + P * A[(F + 0) * (E * D) + (H + 1) * E + (G + 0)] +
                                 I * A[(F - 1) * (E * D) + (H - 1) * E + (G + 1)] + K * A[(F + 1) * (E * D) + (H - 1) * E + (G + 1)] + L * A[(F - 1) * (E * D) + (H + 0) * E + (G + 1)] + N * A[(F + 1) * (E * D) + (H + 0) * E + (G + 1)] + O * A[(F - 1) * (E * D) + (H + 1) * E + (G + 1)] + Q * A[(F + 1) * (E * D) + (H + 1) * E + (G + 1)];
  } else {
    B[F * (E * D) + H * E + G] = 0;
  }
}