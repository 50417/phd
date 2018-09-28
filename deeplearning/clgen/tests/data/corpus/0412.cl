__kernel void fn_A(global int* A) {
  int B = get_local_linear_id();
  int C = get_local_size(0) * get_local_size(1) * get_local_size(2);
  int D = B + C * (get_num_groups(1) * get_num_groups(0) * get_group_id(2) + get_num_groups(0) * get_group_id(1) + get_group_id(0));
  A[D] = get_max_sub_group_size();
}