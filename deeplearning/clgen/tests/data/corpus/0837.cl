kernel void fn_A(global const short4* A, global const short4* B, global short4* C) {
  int D = get_global_id(0);
  C[D] = A[D] + B[D];
}