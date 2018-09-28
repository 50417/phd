__kernel void fn_A(__global const float4* A, __global float4* B, float C, float D, float E) {
  int F = get_global_id(0);
  float4 G = A[F];
  float4 H;
  H.xyz = (G.xyz - C) * E + D;
  H.w = G.w;
  B[F] = H;
}