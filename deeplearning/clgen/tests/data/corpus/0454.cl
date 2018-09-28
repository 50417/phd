__kernel void fn_A(float4 A, float4 B, __global float4* C) {
  float4 D[4];

  B *= 0x1.6a09e6p+0f / length(B);

  D[0] = (float4)(1.0f, 0.0f, 0.0f, 0.0f) - (B * B.x);
  D[1] = (float4)(0.0f, 1.0f, 0.0f, 0.0f) - (B * B.y);
  D[2] = (float4)(0.0f, 0.0f, 1.0f, 0.0f) - (B * B.z);
  D[3] = (float4)(0.0f, 0.0f, 0.0f, 1.0f) - (B * B.w);

  C[0].x = dot(D[0], A);
  C[0].y = dot(D[1], A);
  C[0].z = dot(D[2], A);
  C[0].w = dot(D[3], A);
}