kernel void fn_A(global uint A[]) {
  A[0] = 0;
}

kernel void fn_B(global uint A[]) {
  const size_t B = get_local_id(0);
  A[B] = B;
}

kernel void fn_C(global uint A[]) {
  const size_t B = get_global_id(0);
  A[B] = B;
}

kernel void fn_D(global uint A[], global const uint B[]) {
  A[0] = B[0];
}

kernel __attribute__((reqd_work_group_size(256, 1, 1))) void fn_E(global uint A[]) {
  A[0] = 0;
}

kernel __attribute__((reqd_work_group_size(192, 1, 1))) void fn_F(global uint A[]) {
  A[0] = 0;
}

kernel __attribute__((reqd_work_group_size(128, 1, 1))) void fn_G(global uint A[]) {
  A[0] = 0;
}

kernel __attribute__((reqd_work_group_size(64, 1, 1))) void fn_H(global uint A[]) {
  A[0] = 0;
}