__kernel void fn_A(__global int* A, __global int* B) {
  A[get_global_id(0)] = B[get_global_id(0)];

  __assert(!__read(A));
}