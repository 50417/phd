__kernel void fn_A(__global int* A) {
  A[get_global_id(0)] = get_global_id(0);

  barrier(2);

  if (get_local_id(0) < get_local_size(0) - 1) {
    A[get_global_id(0) + 1] = get_global_id(0);
  }
}