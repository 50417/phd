__kernel void fn_A(__local int* A) {
  A[get_local_id(0)] = get_local_id(0);
  __assert(!__write(A));
}