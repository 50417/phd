__kernel void fn_A(__global int* A, __global int* B, int C) {
  B[get_global_id(0)] = A[get_global_id(0)] / C;
}