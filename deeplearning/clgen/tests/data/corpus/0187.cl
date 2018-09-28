__kernel void fn_A(__global float4* A, __global float4* B, __global float4* C, __global float4* D, __global float4* E, float F) {
  unsigned int G = get_global_id(0);

  float4 H = A[G];
  float4 I = C[G];

  float J = C[G].w;

  J -= F;

  if (J <= 0.f) {
    H = D[G];
    I = E[G];
    J = 1.0f;
  }

  I.z -= 9.8f * F;

  H.x += I.x * F;
  H.y += I.y * F;
  H.z += I.z * F;

  I.w = J;

  A[G] = H;
  C[G] = I;

  B[G].w = J;
}