__kernel void fn_A(__global float* A) {
  size_t B = get_global_id(0);
  size_t C = get_global_id(1);
  size_t D = get_global_size(0);
  size_t E = get_global_offset(0);
  size_t F = get_global_offset(1);
  size_t G = get_local_id(0);
  size_t H = get_local_id(1);

  int I = B - E;
  int J = C - F;
  int K = J * D + I;

  float L = B * 10.0f + C * 1.0f;
  L += G * 0.1f + H * 0.01f;

  A[K] = L;
}