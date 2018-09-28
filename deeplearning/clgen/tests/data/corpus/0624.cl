void fn_A(__global int* A) {
  if (get_global_id(0) == 24) {
    A[0] = get_global_id(0);
  }
}

__kernel void fn_B(__global int* A) {
  fn_A(A);

  for (int B = 0; B < get_global_id(0); B++) {
  }
}