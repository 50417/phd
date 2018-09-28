kernel void fn_A(global int* A, global int* B, global int* C) {
  const int D = get_global_id(0);
  C[D] = C[D] + 7;
  B[D] = A[D] + 5;
  if (D == 2) {
    B[D] = 26;
    C[D] = 34;
  }
}