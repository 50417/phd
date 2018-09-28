__kernel void fn_A(__global int* A, __global int* B) {
  B[get_local_size(0) * (2 * get_group_id(0)) + get_local_id(0)] = get_local_id(0);
  B[get_local_size(0) * (2 * get_group_id(0) + 1) + get_local_id(0)] = get_local_id(0);
  barrier(2);
  A[get_local_size(0) * (2 * get_group_id(0)) + get_local_id(0)] = B[get_local_size(0) * 2 * get_group_id(0) + get_local_size(0) - (get_local_id(0) + 1)];
  A[get_local_size(0) * (2 * get_group_id(0) + 1) + get_local_id(0)] = B[get_local_size(0) * (2 * get_group_id(0) + 1) + get_local_size(0) - (get_local_id(0) + 1)];
}