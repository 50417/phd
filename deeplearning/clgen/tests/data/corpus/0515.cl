__kernel void fn_A(const __global float* A, __global float* B, __constant float* C __attribute__((max_constant_size(16384))), int D, int E, int F) {
  int G = (int)get_global_id(1);
  int H = (int)get_global_id(0);

  int I = (D % 2 == 1 ? (D) / 2 : (D + 1) / 2);

  if (G < F && H < E) {
    int J = G * E + H;
    int K = 0;
    float L = 0.0f;
    int M = 0;
    int N = 0;
    int O = 0;

    for (M = -I; M < D - I; M++) {
      N = J + M;
      if (H + M < 0) {
        N = J - 2 * H - M - 1;
      }

      else if (H + M > E - 1) {
        N = (G + 2) * E - H - M - 1;
      }
      L += A[N] * C[K];

      K += 1;
    }

    B[J] = L;
  }
}
__kernel void fn_B(const __global float* A, __global float* B, __constant float* C __attribute__((max_constant_size(16384))), int D, int E, int F) {
  int G = (int)get_global_id(1);
  int H = (int)get_global_id(0);

  if (G < F && H < E) {
    int I = (D % 2 == 1 ? (D) / 2 : (D + 1) / 2);

    int J = G * E + H;
    int K = 0;
    float L = 0.0f;
    int M = 0, N = 0;
    int O = 0;

    for (M = -I; M < D - I; M++) {
      N = J + M * (E);

      if (G + M < 0) {
        N = H - (M + 1) * E - G * E;

      } else if (G + M > F - 1) {
        N = (F - 1) * E + H + (F - M) * E - G * E;
      }
      L += A[N] * C[K];
      K += 1;
    }
    B[J] = L;
    if (O == 1)
      B[J] = 0;
  }
}