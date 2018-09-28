__kernel void fn_A(__global float* A, __global float* B, __global float* C, __global float* D) {
  D[0] = (1.f / sqrt(A[0]));
  D[1] = sin(A[1]);
  D[2] = sinh(A[2]);
  D[3] = sinpi(A[3]);
  D[4] = sqrt(A[4]);
  D[5] = tan(A[5]);
  D[6] = tanh(A[6]);
  D[7] = tanpi(A[7]);
  D[8] = tgamma(A[8]);
  D[9] = __clc_trunc(A[9]);
}