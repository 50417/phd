__kernel void fn_A(__global float* restrict A, __global float* restrict const B, __global float* restrict C, const uint D, const float E, const float F) {
  const int G = get_global_id(1);
  const int H = get_global_id(0);
  float4 I = (float4)0.0f;
  float4 J;

  A += G * D;

  uint K = H;

  for (int L = 0; L < D; L += 4) {
    J.x = B[K];
    K += D;

    J.y = B[K];
    K += D;

    J.z = B[K];
    K += D;

    J.w = B[K];
    K += D;

    I += vload4(0, A) * J;
    A += 4;
  }

  C[G * D + H] = E * (I.x + I.y + I.z + I.w) + F * C[G * D + H];
}