__kernel void fn_A(__global float* A, __global float* B, __global int* C, __global int* D, __global float* E, const int F, __constant int* G, __constant int* H, const int I) {
  int J = get_global_id(0);

  int K;

  float4 L;
  int4 M;
  float4 N;
  if (J < F) {
    int O = H[J / I];
    float4 P = (float4)0.0f;

    int Q = 0;
    while (Q < O) {
      K = G[Q];

      M = vload4(J, C + K);

      L = vload4(J, B + K);

      N.x = (M.x >= 0) ? E[M.x] : 0.0f;
      N.y = (M.y >= 0) ? E[M.y] : 0.0f;
      N.z = (M.z >= 0) ? E[M.z] : 0.0f;
      N.w = (M.w >= 0) ? E[M.w] : 0.0f;

      Q += 1;
      P += N * L;
    }

    A[D[J]] = P.x + P.y + P.z + P.w;
  }
}