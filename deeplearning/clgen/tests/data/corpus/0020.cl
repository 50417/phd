__kernel void fn_A(__global float* A, __global int* B, int C, int D, int E) {
  const int F = C - 1;
  __global float* G;
  int H = D - 1;
  int I = 0;

  G = ((A) + ((H)*E));
  int J = I;
  float K = G[J];
  while (++J < C) {
    if (G[J] < K) {
      K = G[J];
      I = J;
    }
  }
  B[H] = I;

  while (H >= 0) {
    G = ((A) + ((H)*E));
    const float L = (I < 1) ? 0x1.fffffep127f : G[I - 1];
    const float M = G[I];
    const float N = (I >= F) ? 0x1.fffffep127f : G[I + 1];
    if (L < M) {
      I += (L < N) ? -1 : 1;
    } else {
      I += (M < N) ? 0 : 1;
    }
    B[H] = I;
  }
}