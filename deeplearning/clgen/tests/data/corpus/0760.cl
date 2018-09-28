__kernel void fn_A(__global const float4* A, __global float2* B, const int C, float D, float E, float F) {
  int G = get_global_id(0);
  float4 H = A[G];
  float I = 1.0f;

  if (C) {
    float J = D + E + F;
    if (J == 0.0)
      I = 1.0f;
    else
      I = __clc_fabs(1.0f / J);
  }

  B[G].x = (H.x * D + H.y * E + H.z * F) * I;
  B[G].y = H.w;
}