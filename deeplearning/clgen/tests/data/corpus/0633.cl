kernel void fn_A(global float* A) {
  local float B[2 * 64];
  local float C[2 * 64];

  event_t D = async_work_group_copy(B, A + get_group_id(0) * 64, 64, 0);

  global char* E = (global char*)A;

  async_work_group_copy((local char*)C, E + get_group_id(0) * 64 * sizeof(float), sizeof(float) * 64, D);

  B[64 + get_local_id(0)] = get_global_id(0);
  C[64 + get_local_id(0)] = get_global_id(0);

  wait_group_events(1, &D);
  barrier(1 | 2);

  A[get_global_id(0)] = 2 * B[get_local_id(0)];
}