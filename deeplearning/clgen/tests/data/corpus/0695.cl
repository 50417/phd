__kernel void fn_A(__local int* A, __local int* B) {
  A[get_local_id(0)] = B[get_local_id(0)];

  __assert(!__write(B));
}