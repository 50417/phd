__kernel void fn_A(__global float* A, __global float* B, __global float* C, __global int* D) {
  int E = get_global_id(0);
  float F = (float)(B[E * (*D) + 0]);
  float G = (float)(C[E * (*D) + 0]);

  float H;
  H = __clc_pow(F, G);
  A[E] = H;
};