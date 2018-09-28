__kernel void fn_A(__global float* A, __global float* B, __global float* C) {
  unsigned int D = get_global_id(0);
  C[D] = A[D] + B[D];
}

__kernel void fn_B(__global float* A, __global float* B, __global float* C) {
  unsigned int D = get_global_id(0);
  C[D] = A[D] - B[D];
}

__kernel void fn_C(__global float* A, __global float* B, __global float* C) {
  unsigned int D = get_global_id(0);
  C[D] = A[D] * B[D];
}