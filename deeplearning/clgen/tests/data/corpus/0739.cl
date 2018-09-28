__kernel void fn_A(__global float4* A, __global float4* B) {
  B[0] = __clc_rint(*A);
  B[1] = __clc_round(*A);
  B[2] = __clc_ceil(*A);
  B[3] = __clc_floor(*A);
  B[4] = __clc_trunc(*A);
}