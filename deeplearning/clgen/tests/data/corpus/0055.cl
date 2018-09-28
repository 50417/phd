typedef double vT; inline void fn_A(__local int* A, __local vT* B, const int C, const int D, const int E, const int F) {
  int G = C;
  int H, I;

  int J;
  vT K;

  while (G * 2 + 1 <= D) {
    H = G * 2 + 1;
    I = G;

    if (A[I * F + E] < A[H * F + E])
      I = H;

    if (H + 1 <= D && A[I * F + E] < A[(H + 1) * F + E])
      I = H + 1;

    if (I != G) {
      const int L = G * F + E;
      const int M = I * F + E;

      J = A[L];
      A[L] = A[M];
      A[M] = J;

      K = B[L];
      B[L] = B[M];
      B[M] = K;

      G = I;
    } else
      return;
  }
}

inline int fn_B(__local int* A, __local vT* B, const int C, const int D, const int E) {
  int F = (C - 1) / 2;
  int G = C - 1;

  int H, I;

  while (F >= 0) {
    fn_A(A, B, F, G, D, E);
    F--;
  }

  int J;
  vT K;

  H = G * E + D;

  J = A[D];
  A[D] = A[H];
  A[H] = J;

  K = B[D];
  B[D] = B[H];
  B[H] = K;

  G--;

  fn_A(A, B, 0, G, D, E);

  F = C - 1;

  while (G >= 0) {
    I = G * E + D;

    if (A[D] == A[F * E + D]) {
      B[F * E + D] += B[D];

      A[D] = A[I];
      B[D] = B[I];
    } else {
      F--;

      H = F * E + D;

      if (G == F) {
        J = A[D];
        A[D] = A[I];
        A[I] = J;

        K = B[D];
        B[D] = B[I];
        B[I] = K;
      } else {
        A[H] = A[D];
        B[H] = B[D];

        A[D] = A[I];
        B[D] = B[I];
      }
    }

    G--;

    fn_A(A, B, 0, G, D, E);
  }

  return F;
}

__kernel void fn_C(__global const int* A, __global const int* B, __global const int* C, __global const vT* D, __global const int* E, __global const int* F, __global const vT* G, __global int* H, __global const int* I, __global int* J, __global vT* K, __local int* L, __local vT* M, const int N, const int O) {
  const int P = get_local_id(0);
  const int Q = get_group_id(0);
  const int R = get_global_id(0);
  const int S = get_local_size(0);
  int T = 0;

  if (R < N) {
    int U, V = 0;
    int W, X;
    int Y, Z, AA;
    vT AB;

    int AC = A[6 * (O + R)];

    W = B[AC];
    X = B[AC + 1];

    for (U = W; U < X; U++) {
      Y = C[U];
      AB = D[U];

      Z = E[Y];
      AA = E[Y + 1];

      for (int AD = Z; AD < AA; AD++) {
        T = V * S + P;
        L[T] = F[AD];
        M[T] = G[AD] * AB;

        V++;
      }
    }

    int AE = fn_B(L, M, V, P, S);

    V -= AE;
    H[AC] = V;

    const int AF = A[6 * (O + Q * S + P) + 1];
    ;
    for (int U = 0; U < V; U++) {
      J[AF + U] = L[(AE + U) * S + P];
      K[AF + U] = M[(AE + U) * S + P];
    }
  }
}