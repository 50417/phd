__kernel void fn_A(int A, int B, int C, __global const float* D, __global const float* E, __global int* F) {
  const int G = get_local_id(0);
  const int H = get_local_id(1);
  const int I = get_group_id(0);

  const int J = 64;
  const int K = 4;
  const int L = 64 * H + G;
  const int M = 256 * I + (64 * H + G);
  int N = 0;
  float O = 3.0E+38;
  for (int P = 0; P < B; P++) {
    float Q = 0;
    for (int R = 0; R < C; R++) {
      const float S = D[256 * I + (64 * H + G) + R * A] - E[R + P * C];
      Q = Q + (D[256 * I + (64 * H + G) + R * A] - E[R + P * C]) * (D[256 * I + (64 * H + G) + R * A] - E[R + P * C]);
    }
    if (Q < O) {
      O = Q;
      N = P;
    }
  }
  F[256 * I + (64 * H + G)] = N;
}