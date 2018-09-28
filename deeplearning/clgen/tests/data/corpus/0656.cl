float fn_A() {
  return 0;
}

__kernel void fn_B(const __global float* A, const __global float* B, const __global float* C, const __global float* D, const __global float* E, __global float* F, __global float* G) {
  int H = get_group_id(0);
  int I = get_local_id(0);

  __local float J[(256) + 1];
  __local float K[(256) + 1];

  int L = I;
  int M;

  for (M = L; M <= (2048); M += (256)) {
    int N = H * ((2048) + 16) + (M);
    G[N] = fn_A();
  }

  for (M = (2048); __invariant(__uniform_int(M)), M > 0; M -= (2 * (16))) {
    for (int O = 0; __invariant(__uniform_int(O)), O < M; O += ((256) - (2 * (16)))) {
      int P = (((256) - 1) < (M - O) ? ((256) - 1) : (M - O));
      int Q = P - (2 * (16));

      barrier(1 | 2);

      if (L <= P) {
        int R = H * ((2048) + 16) + (O + L);
        J[L] = G[R];
      }

      for (int S = P - 1; __invariant(__uniform_int(S)), S >= Q;) {
        barrier(1 | 2);
        K[L] = D[H] * J[L + 1] + E[H] * J[L];
        S--;

        barrier(1 | 2);
        J[L] = D[H] * K[L + 1] + E[H] * K[L];
        S--;
      }

      barrier(1 | 2);
      if (L <= Q) {
        int T = H * ((2048) + 16) + (O + L);
        G[T] = J[L];
      }
    }
  }

  if (L == 0)
    F[H] = J[0];
}