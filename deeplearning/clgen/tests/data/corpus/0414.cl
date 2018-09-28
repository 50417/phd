kernel void fn_A(global short* A, global ushort* B, global int* C) {
  int D = get_global_id(0);
  C[D] = upsample(A[D], B[D]);
}