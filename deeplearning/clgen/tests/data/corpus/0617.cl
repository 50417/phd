kernel void fn_A(global float* __restrict A, global float* __restrict B) {
  local float C[64];
  local float D[64];

  event_t E;

  E = async_work_group_copy(C, A + 64 * get_group_id(0), 64, 0);
  async_work_group_copy(D, B + 64 * get_group_id(0), 64, E);

  if (get_local_id(0) > 13) {
    wait_group_events(1, &E);
  }
}