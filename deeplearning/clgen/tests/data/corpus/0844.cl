__kernel void fn_A(const __global float* A, __constant float* B, __global float* C, const int D, const int E) {
  const int F = get_global_size(0);

  const int G = get_global_id(0);
  const int H = get_global_id(1);

  float I = 0;
  for (int J = 0; J < E; J++)
    for (int K = 0; K < E; K++)
      I += B[J * E + K] * A[H * D + G + K];
  C[H * F + G] = I;
}