__kernel void fn_A(__global float* A, __global float* B, const int C, const int D, const int E, const int F, __local float* G, __local float* H) {
  const int I = (F - E) / 2;

  const int J = C - F + 1;
  const int K = D - F + 1;

  const int L = get_local_size(0) - E + 1;

  const int M = get_local_id(0);
  const int N = get_local_id(1);
  const int O = get_global_id(2);

  const int P = get_group_id(0) * L + M;
  const int Q = get_group_id(1) * L + N;

  if ((P < C) && (Q < D)) {
    G[M * get_local_size(1) + N] = A[O * C * D + (I + P) * D + I + Q];
  } else {
    G[M * get_local_size(1) + N] = 0;
  }

  barrier(1);

  float R = 0;

  if (N < L) {
    for (int S = 0; S < E; S++) {
      R += G[M * get_local_size(1) + N + S];
    }
    H[M * L + N] = R;
  }

  barrier(1);
  if (M < L) {
    for (int T = 1; T < E; T++) {
      R += H[(M + T) * L + N];
    }
  }

  if ((M < L) && (N < L)) {
    if (P < J && Q < K) {
      B[O * J * K + P * K + Q] = R;
    }
  }
}