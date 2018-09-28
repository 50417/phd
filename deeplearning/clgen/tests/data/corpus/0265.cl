__kernel void fn_A(__global float* A, __constant float* B, __global float* C, const int D, const float E) {
  const int F = get_global_size(0);

  const int G = get_global_id(0);
  const int H = get_global_id(1);

  float I = 0;
  int J = 0;

  for (int K = 0; K < D; K++) {
    for (J = 0; J < D; J++) {
      I += B[K * D + J] * A[(H + K) * F + G + J];
    }
  }
  C[H * F + G] = I + E;
}