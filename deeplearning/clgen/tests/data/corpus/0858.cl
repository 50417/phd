__kernel void fn_A(__global TYPE* A, __global TYPE* B) {
  B[get_global_id(0)] = A[get_global_id(0)] * 2;
}