__kernel void fn_A(__global const unsigned char* A, __global const float* B, const int C, const int D, const int E, __global unsigned char* F) {
  unsigned int G, H, I;
  float J;
  int K, L, M, N;

  K = get_global_id(0);

  I = C * 3;
  N = E / 2;

  if (K >= I * (E - N) + N * 3 && K < C * D * 3 - I * (E - N) - N * 3) {
    J = 0;
    for (H = 0; H < E; H++) {
      M = I * (H - N);
      for (G = 0; G < E; G++) {
        L = 3 * (G - N);
        J += B[H * E + G] * A[K + L + M];
      }
    }
    F[K] = J;
  } else {
    F[K] = A[K];
  }
}