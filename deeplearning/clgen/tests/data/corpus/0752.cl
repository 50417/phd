__kernel void fn_A(__global int* A, __global int* B, __global int* C) {
  size_t D = get_global_id(0);
  C[D] = A[D] + B[D];
}