kernel void fn_A(global int* A, local int* B) {
  int C = get_local_id(0);
  size_t D = get_local_size(0);
  if (C == D - 1) {
    D = 1;
  }

  event_t E = async_work_group_copy(B, A, D, 0);
  wait_group_events(1, &E);

  A[get_local_size(0) - C - 1] = B[C];
}