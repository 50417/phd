__kernel void fn_A(__constant float4* A, __constant float4* B, __global float* C) {
  int D = get_global_size(0);
  int E = D / 4;
  int F = get_global_id(0) * E;
  A += F;
  C += F * 4;

  float G;

  for (int H = 0; H < D; ++H) {
    G = 0.0f;
    for (int I = 0; I < E; ++I)
      G += dot(A[I], B[H * E + I]);

    C[H] = G;
  }
}