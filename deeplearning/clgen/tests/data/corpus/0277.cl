__kernel void fn_A(__global float4* A, __global float4* B, int C, float D, float E, __local float4* F, __global float4* G, __global float4* H) {
  unsigned int I = get_local_id(0);
  unsigned int J = get_global_id(0);
  unsigned int K = get_local_size(0);

  unsigned int L = C / K;

  float4 M = A[J];
  float4 N = (float4)(0.0f, 0.0f, 0.0f, 0.0f);

  for (int O = 0; O < L; ++O) {
    int P = O * K + I;
    F[I] = A[P];

    barrier(1);

    for (int Q = 0; Q < K; ++Q) {
      float4 R = F[Q] - M;
      float S = R.x * R.x + R.y * R.y + R.z * R.z;
      float T = 1.0f / sqrt(S + E);
      float U = T * T * T;
      float V = F[Q].w * U;

      N += V * R;
    }

    barrier(1);
  }

  float4 W = B[J];

  float4 X = M + W * D + N * 0.5f * D * D;
  X.w = M.w;
  float4 Y = W + N * D;

  G[J] = X;
  H[J] = Y;
}