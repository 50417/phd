__kernel void fn_A(__local int* A) {
  __requires(A[get_local_id(0)] == 0);

  barrier(1);

  __assert(A[get_local_id(0)] == 0);
}