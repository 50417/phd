kernel void fn_A(global int* A, local int* B) {
  int C = get_local_id(0);

  event_t D = 0;
  for (int E = 0; E < get_local_size(0); E++) {
    int F = E;
    D = async_work_group_copy(B + F, A + F, 1, D);
  }
  wait_group_events(1, &D);

  A[get_local_size(0) - C - 1] = B[C];
}