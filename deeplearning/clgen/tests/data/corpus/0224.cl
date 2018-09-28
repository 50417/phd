kernel void fn_A(global int* A, global uint* B, global long* C) {
  int D = get_global_id(0);
  C[D] = upsample(A[D], B[D]);
}