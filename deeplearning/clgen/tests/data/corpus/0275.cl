__kernel void fn_A(__global const int* restrict const A, __global const int* restrict const B, __global int* restrict const C) {
  const size_t D = get_global_id(0);
  C[D] = A[D] + B[D];
}