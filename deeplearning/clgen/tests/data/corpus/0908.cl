__kernel void fn_A(__constant float4* A, __constant float4* B, __global float* C) {
  int D = get_global_id(0);
  int E = get_global_size(0) / 4;

  float F = 0.0f;
  for (int G = 0; G < E; ++G)
    F += dot(A[D * E + G], B[G]);

  C[D] = F;
}