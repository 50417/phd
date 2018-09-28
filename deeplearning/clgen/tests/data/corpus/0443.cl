__kernel void fn_A(__global float* A, __global float* B, const int C, const int D, const int E, const int F) {
  const int G = get_global_id(0);
  const int H = get_global_id(1);

  if (G < F && H < E) {
    const int I = G * C;
    const int J = H * D;

    const int K = I + J;

    float L = 0.0F;

    for (int M = 0; M < D; M++) {
      L += B[K + M];
    }
    L /= D;

    int N = G * E + H;
    A[N] = L;
  }
}

__kernel void fn_B(__global float* A, __global float* B, const int C, const int D, const int E, const int F) {
  const int G = get_global_id(0);
  const int H = get_global_id(1);

  if (G < F && H < C) {
    int I = H / D;

    float J = B[G * E + I];
    float K = J / D;

    int L = G * C + H;

    A[L] = K;
  }
}