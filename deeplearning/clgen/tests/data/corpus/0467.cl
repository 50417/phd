kernel void fn_A(global float* A) {
  local float B[16];

  int C = get_local_id(0);
  if (C != get_local_size(0) / 2) {
    B[C] = C;
  }
  A[C] = B[C];
}