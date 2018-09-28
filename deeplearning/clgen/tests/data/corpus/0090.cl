__kernel void fn_A(__global float* A, __global float* B, __global int* C) {
  int D = get_global_id(0);
  float E = (float)(B[D * (*C) + 0]);

  float F;
  F = acos(E);
  A[D] = F;
};