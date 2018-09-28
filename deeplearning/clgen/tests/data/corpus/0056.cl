typedef double vT; inline void fn_A(__local int* A, __local vT* B, __local int* C, __local vT* D, const int E) {
  int F;
  vT G;

  if ((*A > *C) == E) {
    F = *A;
    *A = *C;
    *C = F;
    G = *B;
    *B = *D;
    *D = G;
  }
}

inline void fn_B(__local int* A, __local vT* B, int C) {
  int D = 1;
  int E = get_local_id(0);

  for (int F = 2; F <= C; F <<= 1) {
    int G = F >> 1;
    int H = E & (G - 1);

    {
      barrier(1);
      int I = 2 * E - (E & (G - 1));
      fn_A(&A[I], &B[I], &A[I + G], &B[I + G], D);

      G >>= 1;
    }

    for (; G > 0; G >>= 1) {
      barrier(1);
      int I = 2 * E - (E & (G - 1));
      if (H >= G)
        fn_A(&A[I - G], &B[I - G], &A[I], &B[I], D);
    }
  }
}

inline void fn_C(__local volatile short* A) {
  int B = get_local_id(0);
  int C, D;
  int E = 1 + 2 * B;
  int F = E + 1;
  short G;

  C = E - 1;
  D = F - 1;
  A[D] += A[C];
  if (B < 8) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    A[D] += A[C];
  }
  if (B < 4) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    A[D] += A[C];
  }
  if (B < 2) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    A[D] += A[C];
  }
  if (B == 0) {
    A[31] += A[15];
    A[32] = A[31];
    A[31] = 0;
    G = A[15];
    A[15] = 0;
    A[31] += G;
  }
  if (B < 2) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 4) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 8) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  C = E - 1;
  D = F - 1;
  G = A[C];
  A[C] = A[D];
  A[D] += G;
}

inline void fn_D(__local volatile short* A) {
  int B = get_local_id(0);
  int C, D;
  int E = 1 + 2 * B;
  int F = E + 1;
  short G;

  C = E - 1;
  D = F - 1;
  A[D] += A[C];
  barrier(1);
  if (B < 16) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    A[D] += A[C];
  }
  if (B < 8) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    A[D] += A[C];
  }
  if (B < 4) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    A[D] += A[C];
  }
  if (B < 2) {
    C = 16 * E - 1;
    D = 16 * F - 1;
    A[D] += A[C];
  }
  if (B == 0) {
    A[63] += A[31];
    A[64] = A[63];
    A[63] = 0;
    G = A[31];
    A[31] = 0;
    A[63] += G;
  }
  if (B < 2) {
    C = 16 * E - 1;
    D = 16 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 4) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 8) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 16) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  C = E - 1;
  D = F - 1;
  G = A[C];
  A[C] = A[D];
  A[D] += G;
}

inline void fn_E(__local volatile short* A) {
  int B = get_local_id(0);
  int C, D;
  int E = 1 + 2 * B;
  int F = E + 1;
  short G;

  C = E - 1;
  D = F - 1;
  A[D] += A[C];
  barrier(1);
  if (B < 32) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
  if (B < 16) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    A[D] += A[C];
  }
  if (B < 8) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    A[D] += A[C];
  }
  if (B < 4) {
    C = 16 * E - 1;
    D = 16 * F - 1;
    A[D] += A[C];
  }
  if (B < 2) {
    C = 32 * E - 1;
    D = 32 * F - 1;
    A[D] += A[C];
  }
  if (B == 0) {
    A[127] += A[63];
    A[128] = A[127];
    A[127] = 0;
    G = A[63];
    A[63] = 0;
    A[127] += G;
  }
  if (B < 2) {
    C = 32 * E - 1;
    D = 32 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 4) {
    C = 16 * E - 1;
    D = 16 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 8) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 16) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 32) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  barrier(1);
  C = E - 1;
  D = F - 1;
  G = A[C];
  A[C] = A[D];
  A[D] += G;
}

inline void fn_F(__local volatile short* A) {
  int B = get_local_id(0);
  int C, D;
  int E = 1 + 2 * B;
  int F = E + 1;
  short G;

  C = E - 1;
  D = F - 1;
  A[D] += A[C];
  barrier(1);
  if (B < 64) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
  if (B < 32) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
  if (B < 16) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    A[D] += A[C];
  }
  if (B < 8) {
    C = 16 * E - 1;
    D = 16 * F - 1;
    A[D] += A[C];
  }
  if (B < 4) {
    C = 32 * E - 1;
    D = 32 * F - 1;
    A[D] += A[C];
  }
  if (B < 2) {
    C = 64 * E - 1;
    D = 64 * F - 1;
    A[D] += A[C];
  }
  if (B == 0) {
    A[255] += A[127];
    A[256] = A[255];
    A[255] = 0;
    G = A[127];
    A[127] = 0;
    A[255] += G;
  }
  if (B < 2) {
    C = 64 * E - 1;
    D = 64 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 4) {
    C = 32 * E - 1;
    D = 32 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 8) {
    C = 16 * E - 1;
    D = 16 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 16) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 32) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  barrier(1);
  if (B < 64) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  barrier(1);
  C = E - 1;
  D = F - 1;
  G = A[C];
  A[C] = A[D];
  A[D] += G;
}

inline void fn_G(__local volatile short* A) {
  int B = get_local_id(0);
  int C, D;
  int E = 1 + 2 * B;
  int F = E + 1;
  short G;

  C = E - 1;
  D = F - 1;
  A[D] += A[C];
  barrier(1);
  if (B < 128) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
  if (B < 64) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
  if (B < 32) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
  if (B < 16) {
    C = 16 * E - 1;
    D = 16 * F - 1;
    A[D] += A[C];
  }
  if (B < 8) {
    C = 32 * E - 1;
    D = 32 * F - 1;
    A[D] += A[C];
  }
  if (B < 4) {
    C = 64 * E - 1;
    D = 64 * F - 1;
    A[D] += A[C];
  }
  if (B < 2) {
    C = 128 * E - 1;
    D = 128 * F - 1;
    A[D] += A[C];
  }
  if (B == 0) {
    A[511] += A[255];
    A[512] = A[511];
    A[511] = 0;
    G = A[255];
    A[255] = 0;
    A[511] += G;
  }
  if (B < 2) {
    C = 128 * E - 1;
    D = 128 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 4) {
    C = 64 * E - 1;
    D = 64 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 8) {
    C = 32 * E - 1;
    D = 32 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 16) {
    C = 16 * E - 1;
    D = 16 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  if (B < 32) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  barrier(1);
  if (B < 64) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  barrier(1);
  if (B < 128) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  barrier(1);
  C = E - 1;
  D = F - 1;
  G = A[C];
  A[C] = A[D];
  A[D] += G;
}

inline void fn_H(__local volatile short* A, __local int* B, __local vT* C, const int D, const int E, const int F, const int G) {
  bool H = 1;
  bool I = 1;

  if (F < D && F > 0)
    H = (B[F] != B[F - 1]);
  if (G < D)
    I = (B[G] != B[G - 1]);

  A[F] = H;
  A[G] = I;
  barrier(1);

  switch (E) {
    case 16:
      fn_C(A);
      break;
    case 32:
      fn_D(A);
      break;
    case 64:
      fn_E(A);
      break;
    case 128:
      fn_F(A);
      break;
    case 256:
      fn_G(A);
      break;
  }
  barrier(1);

  int J;
  short K, L;
  int M, N;
  vT O, P;

  if (F < D && H == 1) {
    K = A[F];
    M = B[F];
    O = C[F];
    J = F + 1;

    while (A[J] == A[J + 1]) {
      O += C[J];
      J++;
    }
  }

  if (G < D && I == 1) {
    L = A[G];
    N = B[G];
    P = C[G];
    J = G + 1;

    while (A[J] == A[J + 1] && J < 2 * E) {
      P += C[J];
      J++;
    }
  }
  barrier(1);

  if (F < D && H == 1) {
    B[K] = M;
    C[K] = O;
  }
  if (G < D && I == 1) {
    B[L] = N;
    C[L] = P;
  }
}

__kernel void fn_I(__global const int* A, __global const int* B, __global const int* C, __global const vT* D, __global const int* E, __global const int* F, __global const vT* G, __global int* H, __global const int* I, __global int* J, __global vT* K, __local int* L, __local vT* M, __local volatile short* N, const int O, const int P) {
  int Q = get_local_id(0);
  int R = get_group_id(0);
  int S = get_local_size(0);
  int T = S * 2;

  int U, V = 0;
  int W, X, Y;
  int Z;
  int AA = Q + S;

  int AB;

  int AC;
  AC = A[6 * (O + R)];

  int AD, AE;
  int AF, AG;
  vT AH;

  AD = B[AC];
  AE = B[AC + 1];

  for (U = AD; U < AE; U++) {
    AB = C[U];
    AH = D[U];

    AF = E[AB];
    AG = E[AB + 1];

    W = AG - AF;

    if (Q < W) {
      X = V + Q;
      Y = AF + Q;

      L[X] = F[Y];
      M[X] = G[Y] * AH;
    }

    if (AA < W) {
      X = V + AA;
      Y = AF + AA;

      L[X] = F[Y];
      M[X] = G[Y] * AH;
    }

    V += W;
  }
  barrier(1);

  Z = T - V;

  if (Q < Z)
    L[V + Q] = P;

  barrier(1);

  fn_B(L, M, T);
  barrier(1);

  fn_H(N, L, M, V, S, Q, AA);
  barrier(1);

  V = N[T] - Z;
  if (Q == 0)
    H[AC] = V;

  int AI = A[6 * (O + R) + 1];

  if (Q < V) {
    Y = AI + Q;

    J[Y] = L[Q];
    K[Y] = M[Q];
  }
  if (AA < V) {
    Y = AI + AA;

    J[Y] = L[AA];
    K[Y] = M[AA];
  }
}