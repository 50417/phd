__kernel void fn_A(int A, int B, __local float* C, __local float* D, __local float* E, __global int* F, __global int* G, __global float* H, __global float* I, __global float* J) {
  local float K, L, M;

  int N = get_local_id(0);
  int O = 0;
  int P = 0;
  float Q, R;

  for (int S = N; S < B; S++) {
    if ((F[S] == N) && (O == 0))
      O = S;
    else if ((F[S] == N + 1) && (P == 0)) {
      P = S - 1;
      break;
    } else if ((S == B - 1) && (P == 0)) {
      P = S;
    }
  }

  C[N] = I[N];
  D[N] = 0.0f;
  barrier(1);

  M = 0;
  while ((M < 1000) && (L >= 0.01)) {
    E[N] = 0.0f;
    for (int S = O; S <= P; S++) {
      E[N] += H[S] * C[G[S]];
    }
    barrier(1);

    if (N == 0) {
      Q = 0.0f;
      R = 0.0f;
      for (int S = 0; S < A; S++) {
        Q += C[S] * C[S];
        R += E[S] * C[S];
      }
      K = Q / R;
    }
    barrier(1);

    D[N] += K * C[N];
    C[N] -= K * E[N];
    barrier(1);

    if (N == 0) {
      L = sqrt(Q);
      M++;
    }
    barrier(1);
  }

  J[0] = M * 1.0f;
  J[1] = L;
}