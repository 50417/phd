__kernel void fn_A(__global const float4* A, __global float4* B, float3 C, float3 D, int3 E) {
  int F = get_global_id(0);
  float4 G = A[F];
  float3 H = (float3)(1.0f, 1.0f, 1.0f);
  float3 I = 0.5f * (H + sin((2.0f * G.xyz - H) * C.xyz + D.xyz));
  float4 J;

  J.xyz = E.xyz ? G.xyz : I;
  J.w = G.w;
  B[F] = J;
}