__kernel void fn_A(__global float* A, __global float* B, const int C, const int D, const int E, const int F, const int G, __local float* H, __constant float* I) {
  const int J = (G - F) / 2;

  const int K = get_local_size(0);
  const int L = get_local_size(0) - F + 1;

  const int M = get_local_id(0);
  const int N = get_local_id(1);

  const int O = get_group_id(0) * L + M;
  const int P = get_group_id(1) * L + N;

  const int Q = D + G - 1;
  const int R = E + G - 1;

  for (int S = 0; S < 2 * C * C; S++) {
    if ((O < Q) && (P < R)) {
      H[M * K + N] = A[S * Q * R + (J + O) * R + J + P];
    }

    barrier(1);

    float T = 0;

    if ((M < L) && (N < L)) {
      for (int U = 0; U < F; U++) {
        for (int V = 0; V < F; V++) {
          T += I[U * F + V] * H[(M + U) * K + N + V];
        }
      }
      if (O < D && P < E) {
        B[S * D * E + O * E + P] = T;
      }
    }
  }
}