__kernel void fn_A(uint A, __global uint* B, __global uint* C, __global float* D, __local float* E, __global float* F, __global float* G) {
  int H = get_global_id(0);
  int I = get_local_id(0);
  int J = H >> 6;
  int K = H & (64 - 1);
  int L = J;

  if (L < A) {
    G[L] = 0.0;
    int M = B[L];
    int N = B[L + 1];

    E[I] = 0;
    for (int O = M + K; O < N; O += 64)
      E[I] += D[O] * F[C[O]];

    if (K < 32)
      E[I] += E[I + 32];
    if (K < 16)
      E[I] += E[I + 16];
    if (K < 8)
      E[I] += E[I + 8];
    if (K < 4)
      E[I] += E[I + 4];
    if (K < 2)
      E[I] += E[I + 2];
    if (K < 1)
      E[I] += E[I + 1];
    if (K == 0)
      G[L] += E[I];
  }
}