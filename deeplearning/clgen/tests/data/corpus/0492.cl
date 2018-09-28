__kernel void fn_A(const int A, const int B, const int C, __global float* D, __global float* E, __global float* F, __local float* G) {
  int H, I;
  int J = get_global_id(0);
  int K = get_local_id(0);
  int L = get_local_size(0);
  float M[1024];
  float N;
  if (J < B) {
    for (H = 0; H < C; H++)
      M[H] = D[J * B + H];
    for (I = 0; I < A; I++) {
      for (H = K; H < C; H += L)
        G[H] = E[H * C + I];
      barrier(1);
      N = 0.0f;
      for (H = 0; H < C; H++)
        N += M[H] * G[H];
      F[J * B + I] = N;
      barrier(1);
    }
  }
}