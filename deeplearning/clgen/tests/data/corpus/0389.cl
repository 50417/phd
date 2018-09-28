__kernel void fn_A(__global char4* A, __global char4* B, __local char4* C, int D, int E) {
  event_t F;
  int G = D * get_local_size(0);
  int H;
  F = async_work_group_strided_copy((__local char4*)C, (__global const char4*)(B + G * E * get_group_id(0)), (size_t)G, (size_t)E, 0);
  wait_group_events(1, &F);

  for (H = 0; H < D; H++)
    C[get_local_id(0) * D + H] = C[get_local_id(0) * D + H] + (char4)(3);
  barrier(1);

  F = async_work_group_strided_copy((__global char4*)(A + G * E * get_group_id(0)), (__local const char4*)C, (size_t)G, (size_t)E, 0);
  wait_group_events(1, &F);
}