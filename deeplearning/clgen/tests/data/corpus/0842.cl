__kernel void fn_A(__global float4* A, __global float2* B, __global float* C, __global float* D, __global float* E, float4 F, float G, unsigned int H, uint2 I) {
  unsigned int J = get_global_id(0);
  unsigned int K = get_global_id(1);
  if ((J >= I.x) || (K >= I.y))
    return;
  unsigned int L = K * I.x + J;

  float2 M = F.xz + A[L].xz;
  float N, O, P, Q;
  unsigned int R;
  for (R = 0; R < H; R++) {
    N = dot(B[R], M);
    O = 1.5625f * D[R] * D[R];
    A[L].y += C[R] * sin(2.f * 3.14 * (G / D[R] - N / O) + E[R]);
  }
}