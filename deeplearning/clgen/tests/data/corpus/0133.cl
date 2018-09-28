__kernel void fn_A(__global const int* A, const long B, __global int* C) {
  unsigned long D = get_global_id(0) * 4;

  C[D] = A[D];
  C[D + 1] = A[D + 1];
  C[D + 2] = A[D + 2];
  C[D + 3] = A[D + 3];
}