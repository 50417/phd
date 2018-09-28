__kernel void fn_A(__global float* A, __global float* B, __global int* C, int D, int E, int F, int G, int H) {
  unsigned int I = get_global_id(0);
  int J = 0;
  if (I < D) {
    float K = 0x1.fffffep127f;
    for (int L = 0; L < E; L++) {
      float M = 0;
      float N = 0;
      for (int O = 0; O < F; O++) {
        N += (A[O * D + I] - B[L * F + O]) * (A[O * D + I] - B[L * F + O]);
      }

      M = N;
      if (M < K) {
        K = M;
        J = L;
      }
    }
    C[I] = J;
  }

  return;
}

__kernel void fn_B(__global float* A, __global float* B, int C, int D) {
  unsigned int E = get_global_id(0);
  for (int F = 0; F < D; F++)
    B[F * C + E] = A[E * D + F];
}