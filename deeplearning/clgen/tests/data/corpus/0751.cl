__kernel void fn_A(__global const char* A, __global const char* B, int C, __local char* D, __global const int* E, __local int* F, int G, int H, int I, __local int* J, __global const int* K, __global int* L) {
  int M;
  int N[20];
  for (M = 0; M < 20; M++) {
    N[M] = 0;
  }

  int O = get_local_id(0);
  if (O < I) {
    J[O] = 0;
  }
  if (O < 128) {
    F[O] = E[O];
  }
  if (O < C) {
    D[O] = B[O];
  }

  barrier(1 | 2);

  int P = get_global_id(0);
  int Q = 0;
  if (P != 0) {
    Q = P * H;
  }

  M = 0;
  while (M <= H) {
    int R;
    int S = G;
    int T = 0;
    for (R = 0; R < I; R++) {
      int U = 0;
      int V = K[R];
      while (U < V && D[U + T] == A[Q + U + M]) {
        U++;
      }
      if (U == V) {
        N[R]++;
      }
      int W = F[A[Q + M + V]];
      if (W >= 1 && S > W) {
        S = W;
      }
      T = T + V;
    }
    M += S;
  }

  for (M = 0; M < I; M++) {
    atomic_add(&J[M], N[M]);
  }

  barrier(1 | 2);

  if (O == 0) {
    size_t X = get_group_id(0);
    for (M = 0; M < I; M++) {
      L[M + X * I] = J[M];
    }
  }
}