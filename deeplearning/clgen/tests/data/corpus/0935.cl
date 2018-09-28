__kernel void fn_A(__global float* A, __global float* B, const unsigned int C) {
  unsigned int D = get_global_id(0);
  if (D < C)
    B[D] = A[D] * A[D];
}