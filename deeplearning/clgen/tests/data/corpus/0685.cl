__kernel void fn_A(__global int* A) {
  A[get_global_id(0)] = 0;

  __barrier_invariant_1(A[get_global_id(0)] == 0, get_local_id(0));
  barrier(2);

  __assert(A[get_global_id(0)] == 0);
}