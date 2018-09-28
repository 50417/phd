inline void fn_A(__local int* A, __local int* B, int C) {
  int D = get_local_id(0);
  int E = (D * 2) + 1;

  int F = 1 + (int)log2((float)C);
  for (int G = 0; G < F; G++) {
    barrier(1);
    int H = (0x1 << G) - 1;
    if ((D & H) == H) {
      int I = (0x1 << G);
      int J = E - I;
      if (!B[E]) {
        A[E] += A[J];
      }
      B[E] = B[E] | B[J];
    }
  }
}

inline void fn_B(__local int* A, __local int* B, __local int* C, int D) {
  int E = get_local_id(0);
  int F = (E * 2) + 1;

  int G = (int)log2((float)D);
  for (int H = G; H > -1; H--) {
    barrier(1);
    int I = (0x1 << H) - 1;
    if ((E & I) == I) {
      int J = (0x1 << H);
      int K = F - J;
      int L = A[K];
      A[K] = A[F];
      if (C[K + 1]) {
        A[F] = 0;
      } else if (B[K]) {
        A[F] = L;
      } else {
        A[F] += L;
      }
      B[K] = 0;
    }
  }
}

inline void fn_C(__local int* A, __local int* B, __local int* C, int D) {
  int E = get_local_id(0);
  int F = (E * 2) + 1;
  fn_A(A, B, D);
  if (F == (D - 1)) {
    A[F] = 0;
  }
  fn_B(A, B, C, D);
}
__kernel void fn_D(__global int* A, __global int* B, __global int* C, __local int* D, __local int* E, __local int* F, int G) {
  int H = get_global_id(0);
  int I = (H * 2);
  int J = (H * 2) + 1;

  D[I] = A[I];
  D[J] = A[J];
  E[I] = B[I];
  E[J] = B[J];
  F[I] = C[I];
  F[J] = C[J];

  fn_C(D, E, F, G);

  A[I] = D[I];
  A[J] = D[J];
}
__kernel void fn_E(__global int* A, __global int* B, __global int* C, __local int* D, __local int* E, __local int* F, int G) {
  int H = get_global_id(0);
  int I = (H * 2);
  int J = (H * 2) + 1;
  int K = 2 * get_local_size(0);

  D[I] = I < G ? A[I] : 0;
  D[J] = J < G ? A[J] : 0;
  E[I] = I < G ? B[I] : 0;
  E[J] = J < G ? B[J] : 0;
  F[I] = I < G ? C[I] : 0;
  F[J] = J < G ? C[J] : 0;

  fn_C(D, E, F, K);

  if (I < G)
    A[I] = D[I];
  if (J < G)
    A[J] = D[J];
}
__kernel void fn_F(__global int* A, __global int* B, __global int* C, __global int* D, __global int* E, __global int* F, __local int* G, __local int* H, __local int* I, int J) {
  int K = get_local_size(0);

  int L = get_global_id(0);
  int M = (2 * L);
  int N = (2 * L) + 1;

  int O = get_local_id(0);
  int P = (2 * O);
  int Q = (2 * O) + 1;
  int R = get_group_id(0);

  int S = K * 2;
  int T = get_num_groups(0);

  G[P] = (M < J) ? A[M] : 0;
  G[Q] = (N < J) ? A[N] : 0;
  H[P] = (M < J) ? B[M] : 0;
  H[Q] = (N < J) ? B[N] : 0;
  I[P] = (M < J) ? C[M] : 0;
  I[Q] = (N < J) ? C[N] : 0;

  fn_A(G, H, S);

  if (O == (K - 1)) {
    D[R] = G[Q];
    E[R] = H[Q];
  }

  if (O == 0) {
    F[R] = I[P];
  }

  A[M] = G[P];
  A[N] = G[Q];
  B[M] = H[P];
  B[N] = H[Q];
}
__kernel void fn_G(__global int* A, __global int* B, __global int* C, __global int* D, __global int* E, __global int* F, __local int* G, __local int* H, __local int* I, int J) {
  int K = get_local_size(0);

  int L = get_global_id(0);
  int M = (2 * L);
  int N = (2 * L) + 1;

  int O = get_local_id(0);
  int P = (2 * O);
  int Q = (2 * O) + 1;
  int R = get_group_id(0);

  int S = K * 2;
  int T = get_num_groups(0);

  G[P] = A[M];
  G[Q] = A[N];
  H[P] = B[M];
  H[Q] = B[N];
  I[P] = C[M];
  I[Q] = C[N];

  if (O == (K - 1)) {
    G[Q] = D[R];
    H[Q] = E[R];
  }

  fn_B(G, H, I, S);

  if (M < J)
    A[M] = G[P];
  if (N < J)
    A[N] = G[Q];
}