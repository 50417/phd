__kernel void fn_A(__global int* A) {
  __global_assert(__all(get_local_id(0) < get_local_size(0)));
}