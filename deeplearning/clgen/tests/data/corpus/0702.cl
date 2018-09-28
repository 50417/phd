__kernel void fn_A(__global float* A) {
  if (get_group_id(0) == 0) {
    A[get_local_id(0)] = 42.f;
  }
}