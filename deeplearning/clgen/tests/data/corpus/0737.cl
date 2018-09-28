__kernel void fn_A(__global float* A, __global float* B, __global float* C) {
  int D = get_global_id(0);

  C[D] = A[D] + B[D];
}