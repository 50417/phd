kernel void fn_A(global int* A, global int* B, int C) {
  int D = A[get_global_id(0)];

  for (int E = 0; E < 8; E++) {
    barrier(2);
  }

  B[get_global_id(0)] = D;
}