__kernel void fn_A(__global uint* A, __global const uint* B, __global const uint* C) {
  size_t D = get_global_id(0);
  A[D] = B[D] + C[D];
}

__kernel void fn_B(__global uint* A, __global const uint* B, __global const uint* C) {
  size_t D = get_global_id(0);
  A[D] = B[D] & C[D];
}