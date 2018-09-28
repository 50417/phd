__kernel void fn_A(__global float* A, __global float* B, __global float* C) {
  int D = 0;

  C[D + 0] = A[D + 0] + B[D + 0];
  C[D + 4] = A[D + 4] + B[D + 4];
  C[D + 8] = A[D + 8] + B[D + 8];
  C[D + 12] = A[D + 12] + B[D + 12];
}

__kernel void fn_B(__global float* A, __global float* B, __global float* C) {
  int D = 1;

  C[D + 0] = A[D + 0] - B[D + 0];
  C[D + 4] = A[D + 4] - B[D + 4];
  C[D + 8] = A[D + 8] - B[D + 8];
  C[D + 12] = A[D + 12] - B[D + 12];
}

__kernel void fn_C(__global float* A, __global float* B, __global float* C) {
  int D = 2;

  C[D + 0] = A[D + 0] * B[D + 0];
  C[D + 4] = A[D + 4] * B[D + 4];
  C[D + 8] = A[D + 8] * B[D + 8];
  C[D + 12] = A[D + 12] * B[D + 12];
}

__kernel void fn_D(__global float* A, __global float* B, __global float* C) {
  int D = 3;

  C[D + 0] = A[D + 0] / B[D + 0];
  C[D + 4] = A[D + 4] / B[D + 4];
  C[D + 8] = A[D + 8] / B[D + 8];
  C[D + 12] = A[D + 12] / B[D + 12];
}