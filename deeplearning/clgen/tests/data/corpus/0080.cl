kernel void fn_A(global short* A, global short* B, global short* C, global short* D) {
  short E = get_global_id(0);
  D[E] = mad_sat(A[E], B[E], C[E]);
}