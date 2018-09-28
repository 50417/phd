kernel void fn_A(local int* A, global int* B) {
  int C = get_local_id(0);
  A[C] = C;
  barrier(1);
  event_t D = async_work_group_copy(B + 1, A, get_local_size(0), 0);
  wait_group_events(1, &D);
}