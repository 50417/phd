__kernel void fn_A(__global const float* A, int B, __global const float* C, int D, __global float* E, int F, int G, float H, float I) {
  float J = 0.0f;
  int K = get_global_id(0);
  int L = get_global_id(1);

  for (int M = 0; M < G; ++M) {
    float N = A[K + M * B];
    float O = C[L + M * D];
    J += N * O;
  }
  E[K + L * F] = E[K + L * F] * I + H * J;
}