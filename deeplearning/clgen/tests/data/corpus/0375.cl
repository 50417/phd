kernel void fn_A(__global int* A) {
  int B = get_local_linear_id() + (get_group_id(0) + get_group_id(1) * 2 + get_group_id(2) * 6) * get_local_size(0) * get_local_size(1) * get_local_size(2);

  A[B] = B;
}