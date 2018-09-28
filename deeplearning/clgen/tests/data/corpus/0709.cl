__kernel void fn_A(__global const float* A, __global const float* B, __global float* C) {
  int D = get_global_id(0);

  C[D] = A[D] + B[D];
}