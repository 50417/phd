kernel void fn_A(global const double* A, global const double* B, global double* C) {
  unsigned int D = get_global_id(0);
  C[D] = A[D] + B[D];
}