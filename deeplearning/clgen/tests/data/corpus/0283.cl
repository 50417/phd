__kernel void fn_A(__global float* A, __global float* B, int C) {
  size_t D = get_global_id(0);

  for (unsigned int E = 0; E < C; ++E) {
    B[D * C + E] = A[D * C + E];
  }
}

__kernel void fn_B(__global float* A, __global float* B, int C) {
  size_t D = get_global_id(0);

  for (unsigned int E = 0; E < C; ++E) {
    B[E * C + D] = A[E * C + D];
  }
}