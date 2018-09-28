kernel void fn_A(global float* __restrict A, global float* __restrict B) {
  local float C[64];
  local float D[64];

  event_t E[2];

  E[0] = async_work_group_copy(C, A + 64 * get_group_id(0), 64, 0);
  E[1] = async_work_group_copy(D, B + 64 * get_group_id(0), 64, 0);

  wait_group_events(2, E);

  C[get_local_id(0)] = 2 * C[get_local_id(0)];
  D[get_local_id(0)] = 2 * D[get_local_id(0)];

  barrier(1);

  async_work_group_copy(A + 64 * get_group_id(0), C, 64, 0);
  async_work_group_copy(A + 64 * get_group_id(0), D, 64, 0);
}