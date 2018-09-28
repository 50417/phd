__kernel void fn_A(__global const float4* A, __global float4* B, float3 C, float3 D, float3 E) {
  int F = get_global_id(0);
  float4 G = A[F];
  float4 H;

  if (G.x > D.x && G.x < E.x && G.y > D.y && G.y < E.y && G.z > D.z && G.z < E.z) {
    H.x = clamp(G.x + C.x, 0.0f, 1.0f);
    H.y = clamp(G.y + C.y, 0.0f, 1.0f);
    H.z = clamp(G.z + C.z, 0.0f, 1.0f);
  } else {
    H.xyz = G.xyz;
  }

  H.w = G.w;
  B[F] = H;
}