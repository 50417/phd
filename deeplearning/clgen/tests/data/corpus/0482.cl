kernel void fn_A(global int* A) {
  int B = get_global_id(0);
  if (B != 0) {
    barrier(2);
  }
  A[B] = B;
}