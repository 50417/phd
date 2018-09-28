kernel void fn_A(__global int* A) {
  int B = get_global_id(0) + get_global_id(1) * 3 + get_global_id(2) * 3 * 4;
  A[B] = B;
}