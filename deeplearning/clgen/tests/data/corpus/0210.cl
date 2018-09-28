__kernel void fn_A(__global ulong8* A, __global long8* B) {
  int C = get_global_id(0);
  B[C] = !A[C];
}