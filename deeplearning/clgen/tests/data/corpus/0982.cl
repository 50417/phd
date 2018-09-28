float fn_A(float4 A, float4 B, float4 C, float4 D, float4 E) {
  float4 F = D - C;
  float4 G = E - C;
  float H, I, J, K;

  float4 L = cross(B, G);
  H = dot(F, L);

  if (H > -0.00001f && H < 0.00001f)
    return 99999.0;

  I = 1.0f / H;
  float4 M = A - C;
  J = I * dot(M, L);

  if (J < 0.0f || J > 1.0f)
    return 99999.0;

  float4 N = cross(M, F);
  K = I * dot(B, N);

  if (K < 0.0f || J + K > 1.0f)
    return 99999.0;

  float O = I * dot(G, N);

  if (O > 0.00001f)
    return O;

  else

    return 99999.0;
}

__kernel void fn_B(__global const uint3* A, __global const float4* B, __global const uint* C, __global const float4* D, __global const uint* E, const uint4 F, __global float* G) {
  const uint H = get_global_id(0);

  uint I = H;
  uint J = I / F.y;

  if (J >= F.w)
    return;

  float K = 99999.0;
  float L = 99999.0;
  float M = 0.0f;
  uint N = 0;

  const float4 O = D[I];
  float4 P = B[A[C[J]].x];
  float4 Q = B[A[C[J]].y];
  float4 R = B[A[C[J]].z];
  const float4 S = (P + Q + R) / 3.0f;
  const float4 T = normalize((-1.0f) * cross(Q - P, R - P));
  float4 U;

  for (N = 0; N < F.z; N++) {
    J = E[(I * F.z) + N];
    if (J == 0)
      break;

    J = J - 1;

    P = B[A[J].x];
    Q = B[A[J].y];
    R = B[A[J].z];

    L = fn_A(S, O, P, Q, R);
    if (L < 99999.0) {
      U = normalize(cross(Q - P, R - P));
      M = acos(dot(O, U) / length(O));
      M = M * (180.0f / 0x1.921fb6p+1f);
      if ((M < 90.0f) && (L < K))
        K = L;
    }
  }

  G[I] = K;
}