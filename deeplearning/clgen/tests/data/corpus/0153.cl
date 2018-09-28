__kernel void fn_A(__global float* A, __global float* B, __global float* C, uint D, uint E, uint F, float G) {
  uint H = get_global_id(0);
  uint I = get_global_id(1);

  float J = 0;

  for (uint K = 0; K < F; K++) {
    const float L = A[I + K * D];
    const float M = C[H + K * E];
    J += L * M;
  }

  J *= G;

  B[I * E + H] = J;
}