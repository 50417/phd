__kernel void fn_A(__global const float4* A, __global float4* B, float C, float D) {
  int E = get_global_id(0);
  float4 F = A[E];
  float4 G;
  G.xyz = (F.xyz - 0.5f) * C + D + 0.5f;
  G.w = F.w;
  B[E] = G;
}