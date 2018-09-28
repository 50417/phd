kernel void fn_A(global int* A, global int* B, global int* C) {
  int D = get_global_id(0);
  C[D] = mul24(A[D], B[D]);
}