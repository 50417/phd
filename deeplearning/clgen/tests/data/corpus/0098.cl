kernel void fn_A(global long* A, global long* B) {
  int C = get_global_id(0);
  if (C > 7)
    B[C] = A[C] >> C;
  else
    B[C] = A[C] + 1;
}