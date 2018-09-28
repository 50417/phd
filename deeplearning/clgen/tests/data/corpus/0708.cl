kernel void fn_A(global float* A) {
  local float B[64];

  B[get_local_id(0)] = get_global_id(0);

  barrier(1);

  event_t C = async_work_group_copy(A, B, 64, 0);

  wait_group_events(1, &C);
}