kernel void fn_A(global long* A, global long* B, global long* C, long D) {
  int E = get_global_id(0);

  if (E < 5)
    C[E] = A[E] + B[E] + B[E] * D;
  if (E > 5)
    C[E] = A[E] - B[E] - D;
}