__kernel void fn_A(__global float* A, __global float* B, __global float* C, int D, int E) {
  int F = get_global_id(0);
  int G = get_global_id(1);
  int H;
  float I = 0;

  for (H = 0; H < D; H++)
    I += A[F * D + H] * B[H * E + G];
  C[F * E + G] = I;
}