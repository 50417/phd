__kernel void fn_A(__global int* A, __local int* B) {
  B[get_local_id(0)] = get_local_id(0);
  barrier(1);
  A[get_global_id(0)] = B[15 - get_local_id(0)];
}