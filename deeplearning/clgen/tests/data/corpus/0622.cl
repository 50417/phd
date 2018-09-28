__kernel void fn_A(__local int* A) {
  A[0] = get_local_id(0);
}