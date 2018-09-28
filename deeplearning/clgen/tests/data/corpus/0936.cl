__kernel void fn_A(__global uint* A, __global uint* B, unsigned int C) {
  unsigned int D = get_global_id(0);
  if (D < C)
    B[D] = A[D] * A[D];
}