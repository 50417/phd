__kernel void fn_A(__global const long* A, __global const long* B, __global long* C) {
  int D = get_global_id(0);
  C[D] = A[D] + B[D];
}