__kernel void fn_A(__global float* A, __global float* B, __global int* C) {
  int D = get_global_id(0);
  float E = B[D];

  A[D * (*C) + 0] = acos(E);
  A[D * (*C) + 1] = acosh(E);
  A[D * (*C) + 2] = asin(E);
  A[D * (*C) + 3] = asinh(E);
  A[D * (*C) + 4] = E;
};