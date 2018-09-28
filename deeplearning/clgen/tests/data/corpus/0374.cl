kernel void fn_A(global int* A, global int* B) {
  int C = get_global_id(0);
  B[C] = A[C] >> 24;
}