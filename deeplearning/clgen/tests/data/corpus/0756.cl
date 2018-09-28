__kernel void fn_A(__global const float4* A, __global float4* B, float C) {
  int D = get_global_id(0);
  float4 E = A[D];

  E.xyz = __clc_trunc(E.xyz * C + (float3)(0.5f)) / C;
  B[D] = E;
}