__kernel void fn_A(__global float* A, __global float* B) {
  int C = get_global_id(0);
  B[C] = A[C] * A[C];
}