__kernel void fn_A(__global uint3* A, __global uint3* B) {
  int C = (int)get_global_id(0);
  B[C] = A[C];
}