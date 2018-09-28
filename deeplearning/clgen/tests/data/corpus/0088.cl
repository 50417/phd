kernel void fn_A(global long* A, global long* B, global long* C) {
  int D = get_global_id(0);
  if (D < 3)
    C[D] = A[D] + B[D];
  else
    C[D] = A[D] * B[D];
}