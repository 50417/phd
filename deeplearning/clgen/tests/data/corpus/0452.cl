__kernel void fn_A(__global float* A, __global float* B, __global float4* C, __global float4* D) {
  B[0] = fmod(A[0], A[1]);
  B[1] = remainder(A[0], A[1]);

  D[0] = __clc_rint(*C);
  D[1] = __clc_round(*C);
  D[2] = __clc_ceil(*C);
  D[3] = __clc_floor(*C);
  D[4] = __clc_trunc(*C);
}