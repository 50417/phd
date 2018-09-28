__kernel void fn_A(__global float* A, __global float* B, __global float* C) {
  *C = *A + *B;
}