__kernel void fn_A(__global float* A) {
  int B = get_global_id(0);
  A[B] = A[B] * A[B];
}