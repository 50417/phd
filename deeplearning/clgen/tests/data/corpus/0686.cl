__kernel void fn_A(__local float* A) {
  A[get_local_id(0) ? 2 * get_local_id(0) : 1] = 2.4f;
}