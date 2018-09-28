typedef double vT; inline void fn_A(__local int* A, __local vT* B, int C, vT D, int E, bool* F) {
  int G = 0;
  int H = E - 1;
  int I;
  int J;

  while (H >= G) {
    I = (H + G) / 2;
    J = A[I];

    if (C > J)
      G = I + 1;
    else if (C < J)
      H = I - 1;
    else {
      B[I] += D;
      *F = 0;
      break;
    }
  }
}

inline void fn_B(__local int* A, __local vT* B, int C, vT D, int E) {
  int F = 0;
  int G = E - 1;
  int H;
  int I;

  while (G >= F) {
    H = (G + F) / 2;
    I = A[H];

    if (C > I)
      F = H + 1;
    else if (C < I)
      G = H - 1;
    else {
      B[H] -= D;
      break;
    }
  }
}

inline void fn_C(__global int* A, __global vT* B, int C, vT D, int E, bool* F) {
  int G = 0;
  int H = E - 1;
  int I;
  int J;

  while (H >= G) {
    I = (H + G) / 2;
    J = A[I];

    if (C > J)
      G = I + 1;
    else if (C < J)
      H = I - 1;
    else {
      B[I] += D;
      *F = 0;
      break;
    }
  }
}

inline void fn_D(__global int* A, __global vT* B, int C, vT D, int E) {
  int F = 0;
  int G = E - 1;
  int H;
  int I;

  while (G >= F) {
    H = (G + F) / 2;
    I = A[H];

    if (C > I)
      F = H + 1;
    else if (C < I)
      G = H - 1;
    else {
      B[H] -= D;
      break;
    }
  }
}

inline void fn_E(__local volatile short* A, const int B) {
  int C, D;
  int E = 1 + 2 * B;
  int F = E + 1;
  short G;

  if (B < 16) {
    C = E - 1;
    D = F - 1;
    A[D] += A[C];
  }
  barrier(1);
  if (B < 8) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
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
  barrier(1);
  if (B < 16) {
    C = E - 1;
    D = F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
}

inline void fn_F(__local volatile short* A, const int B) {
  int C, D;
  int E = 1 + 2 * B;
  int F = E + 1;
  short G;

  if (B < 32) {
    C = E - 1;
    D = F - 1;
    A[D] += A[C];
  }
  barrier(1);
  if (B < 16) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
  if (B < 8) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
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
  barrier(1);
  if (B < 16) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  barrier(1);
  if (B < 32) {
    C = E - 1;
    D = F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
}

inline void fn_G(__local volatile short* A, const int B) {
  int C, D;
  int E = 1 + 2 * B;
  int F = E + 1;
  short G;

  if (B < 64) {
    C = E - 1;
    D = F - 1;
    A[D] += A[C];
  }
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
  barrier(1);
  if (B < 8) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
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
  barrier(1);
  if (B < 16) {
    C = 4 * E - 1;
    D = 4 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  barrier(1);
  if (B < 32) {
    C = 2 * E - 1;
    D = 2 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  barrier(1);
  if (B < 64) {
    C = E - 1;
    D = F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
}

inline void fn_H(__local volatile short* A, const int B) {
  int C, D;
  int E = 1 + 2 * B;
  int F = E + 1;
  short G;

  if (B < 128) {
    C = E - 1;
    D = F - 1;
    A[D] += A[C];
  }
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
  barrier(1);
  if (B < 8) {
    C = 16 * E - 1;
    D = 16 * F - 1;
    A[D] += A[C];
  }
  barrier(1);
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
  barrier(1);
  if (B < 16) {
    C = 8 * E - 1;
    D = 8 * F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
  barrier(1);
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
  if (B < 128) {
    C = E - 1;
    D = F - 1;
    G = A[C];
    A[C] = A[D];
    A[D] += G;
  }
}

inline void fn_I(__local volatile short* A, const int B, const int C) {
  switch (C) {
    case 32:
      fn_E(A, B);
      break;
    case 64:
      fn_F(A, B);
      break;
    case 128:
      fn_G(A, B);
      break;
    case 256:
      fn_H(A, B);
      break;
  }
}

inline bool fn_J(int A, int B) {
  return A < B ? true : false;
}

inline int fn_K(__local int* A, const int B, __local int* C, const int D, const int E) {
  int F = max(0, E - D);
  int G = min(E, B);
  int H;
  int I, J;
  bool K;

  while (F < G) {
    H = (F + G) >> 1;

    I = A[H];
    J = C[E - 1 - H];

    K = fn_J(I, J);

    if (K)
      F = H + 1;
    else
      G = H;
  }
  return F;
}

inline void fn_L(__local int* A, __local vT* B, int C, const int D, int E, const int F, int* G, vT* H, const int I) {
  int J = A[C];
  int K = A[E];
  bool L;

  for (int M = 0; M < I; ++M) {
    L = (E >= F) || ((C < D) && !fn_J(K, J));

    G[M] = L ? J : K;
    H[M] = L ? B[C] : B[E];

    if (L)
      J = A[++C];
    else
      K = A[++E];
  }
}

inline void fn_M(__local int* A, __local vT* B, int* C, vT* D, const int E, const int F) {
  int G = __clc_ceil((E + F) / (float)get_local_size(0));
  int H = G * get_local_id(0);
  int I = fn_K(A, E, &A[E], F, H);

  fn_L(A, B, I, E, E + H - I, E + F, C, D, G);
  barrier(1);

  for (int J = 0; J < G; J++) {
    A[H + J] = C[J];
    B[H + J] = D[J];
  }
}

inline int fn_N(__global int* A, const int B, __global int* C, const int D, const int E) {
  int F = max(0, E - D);
  int G = min(E, B);
  int H;
  int I, J;
  bool K;

  while (F < G) {
    H = (F + G) >> 1;

    I = A[H];
    J = C[E - 1 - H];

    K = fn_J(I, J);

    if (K)
      F = H + 1;
    else
      G = H;
  }
  return F;
}

inline void fn_O(__global int* A, __global vT* B, int C, const int D, int E, const int F, int* G, vT* H, const int I) {
  int J = A[C];
  int K = A[E];
  bool L;

  for (int M = 0; M < I; ++M) {
    L = (E >= F) || ((C < D) && !fn_J(K, J));

    G[M] = L ? J : K;
    H[M] = L ? B[C] : B[E];

    if (L)
      J = A[++C];
    else
      K = A[++E];
  }
}

inline void fn_P(__global int* A, __global vT* B, __local int* C, __local vT* D, const int E, const int F, const bool G) {
  int H = get_local_id(0);
  int I = get_local_size(0);

  int J, K, L;
  int M = __clc_ceil((float)E / (float)I);

  for (int N = 0; N < M; N++) {
    J = N != M - 1 ? I : E - N * I;
    K = N * I + H;
    L = F + K;

    if (H < J) {
      if (G) {
        A[L] = C[K];
        B[L] = D[K];
      } else {
        C[K] = A[L];
        D[K] = B[L];
      }
    }
  }
}

inline void fn_Q(__global int* A, __global vT* B, __global int* C, __global vT* D, const int E, const int F, const bool G) {
  int H = get_local_id(0);
  int I = get_local_size(0);

  int J, K, L;
  int M = __clc_ceil((float)E / (float)I);

  for (int N = 0; N < M; N++) {
    J = N != M - 1 ? I : E - N * I;
    K = N * I + H;
    L = F + K;

    if (H < J) {
      if (G) {
        A[L] = C[K];
        B[L] = D[K];
      } else {
        C[K] = A[L];
        D[K] = B[L];
      }
    }
  }
}

__kernel void fn_R(__global int* A, __global const int* B, __global const int* C, __global const vT* D, __global const int* E, __global const int* F, __global const vT* G, __global int* H, __global const int* I, __global int* J, __global vT* K, __local int* L, __local vT* M, __local volatile short* N, const int O, const int P) {
  int Q = 6 * (O + get_group_id(0));

  int R = A[Q + 2];

  int S = get_local_id(0);
  int T = A[Q];

  int U = get_local_size(0);
  float V = U;

  int W, X;
  int Y;

  int Z;
  vT AA;
  vT AB;

  int AC, AD;
  int AE, AF;

  int AG, AH;

  bool AI;
  bool AJ;
  int AK, AL, AM;
  int AN[16];
  vT AO[16];

  AC = B[T];
  AD = B[T + 1];

  if (R == 0) {
    AJ = false;

    Y = C[AC];
    AB = D[AC];

    AE = E[Y];
    AF = E[Y + 1];

    W = AF - AE;
    X = __clc_ceil(W / V);

    AE += S;

    for (AG = 0; AG < X; AG++) {
      Y = AG != X - 1 ? U : W - AG * U;

      if (R + Y > P) {
        if (S == 0) {
          A[Q + 2] = R;
          A[Q + 3] = AC;
          A[Q + 4] = AE;
        }

        Y = A[Q + 1];
        fn_P(J, K, L, M, R, Y, 1);

        return;
      }

      if (AE < AF) {
        Z = F[AE];
        AA = G[AE] * AB;

        L[R + S] = Z;
        M[R + S] = AA;
      }
      barrier(1);

      R += Y;
      AE += U;
    }

    AC++;
  } else {
    AJ = true;
    AC = A[Q + 3];

    Y = A[Q + 5];
    fn_P(J, K, L, M, R, Y, 0);
  }
  barrier(1);

  while (AC < AD) {
    Y = C[AC];
    AB = D[AC];

    AE = AJ ? A[Q + 4] : E[Y];
    AJ = false;
    AF = E[Y + 1];

    W = AF - AE;
    X = __clc_ceil(W / V);

    AE += S;

    for (AG = 0; AG < X; AG++) {
      barrier(1);
      AI = 0;

      if (AE < AF) {
        Z = F[AE];
        AA = G[AE] * AB;

        AI = 1;
        fn_A(L, M, Z, AA, R, &AI);
      }

      N[S] = AI;
      barrier(1);

      fn_I(N, S, U);
      barrier(1);

      if (N[U] == 0) {
        AE += U;
        continue;
      }

      if (R + N[U] > P) {
        if (AE < AF) {
          fn_B(L, M, Z, AA, R);
        }
        barrier(1);

        if (S == 0) {
          A[Q + 2] = R;
          A[Q + 3] = AC;
          A[Q + 4] = AE;
        }

        Y = A[Q + 1];
        fn_P(J, K, L, M, R, Y, 1);

        return;
      }

      if (AI) {
        Y = R + N[S];
        L[Y] = Z;
        M[Y] = AA;
      }
      barrier(1);

      Y = N[U];

      AK = __clc_ceil((R + Y) / V);

      AL = AK * S;
      AM = fn_K(L, R, &L[R], Y, AL);

      fn_L(L, M, AM, R, R + AL - AM, R + Y, AN, AO, AK);
      barrier(1);

      for (AH = 0; AH < AK; AH++) {
        L[AL + AH] = AN[AH];
        M[AL + AH] = AO[AH];
      }
      barrier(1);

      R += Y;
      AE += U;
    }

    AC++;
  }
  barrier(1);

  if (S == 0) {
    H[T] = R;
    A[Q + 2] = -1;
  }

  Y = A[Q + 1];
  fn_P(J, K, L, M, R, Y, 1);
}

__kernel void fn_S(__global int* A, __global const int* B, __global const int* C, __global const vT* D, __global const int* E, __global const int* F, __global const vT* G, __global int* H, __global const int* I, __global int* J, __global vT* K, __local int* L, __local vT* M, __local volatile short* N, const int O, const int P) {
  int Q = 6 * (O + get_group_id(0));

  int R = A[Q + 2];
  int S = 0;

  int T = get_local_id(0);
  int U = A[Q];

  int V = get_local_size(0);
  float W = V;

  int X, Y;
  int Z;

  int AA;
  vT AB;
  vT AC;

  int AD, AE;
  int AF, AG;

  int AH, AI;

  bool AJ;
  bool AK;
  int AL, AM, AN;
  int AO[80];
  vT AP[80];

  AD = B[U];
  AE = B[U + 1];

  AK = true;
  AD = A[Q + 3];

  Z = A[Q + 1];
  __global int* AQ = &J[Z];
  __global vT* AR = &K[Z];

  Z = A[Q + 5];
  fn_Q(J, K, AQ, AR, R, Z, 0);
  barrier(2);

  while (AD < AE) {
    Z = C[AD];
    AC = D[AD];

    AF = AK ? A[Q + 4] : E[Z];
    AK = false;
    AG = E[Z + 1];

    X = AG - AF;
    Y = __clc_ceil(X / W);

    AF += T;

    for (AH = 0; AH < Y; AH++) {
      barrier(1);
      AJ = 0;

      if (AF < AG) {
        AA = F[AF];
        AB = G[AF] * AC;

        AJ = 1;

        fn_C(AQ, AR, AA, AB, R, &AJ);

        if (AJ == 1)
          fn_A(L, M, AA, AB, S, &AJ);
      }

      N[T] = AJ;
      barrier(1);

      fn_I(N, T, V);
      barrier(1);

      if (N[V] == 0) {
        AF += V;
        continue;
      }

      if (S + N[V] > P) {
        if (AF < AG) {
          fn_D(AQ, AR, AA, AB, R);

          fn_B(L, M, AA, AB, S);
        }
        barrier(1);

        if (T == 0) {
          A[Q + 2] = R + S;
          A[Q + 3] = AD;
          A[Q + 4] = AF;
        }

        fn_P(AQ, AR, L, M, S, R, 1);
        barrier(2);

        AL = __clc_ceil((R + S) / W);
        AM = AL * T;
        AN = fn_N(AQ, R, &AQ[R], S, AM);

        fn_O(AQ, AR, AN, R, R + AM - AN, R + S, AO, AP, AL);
        barrier(2);

        for (AI = 0; AI < AL; AI++) {
          AQ[AM + AI] = AO[AI];
          AR[AM + AI] = AP[AI];
        }

        return;
      }

      if (AJ) {
        Z = S + N[T];
        L[Z] = AA;
        M[Z] = AB;
      }
      barrier(1);

      Z = N[V];

      AL = __clc_ceil((S + Z) / W);
      AM = AL * T;
      AN = fn_K(L, S, &L[S], Z, AM);

      fn_L(L, M, AN, S, S + AM - AN, S + Z, AO, AP, AL);
      barrier(1);

      for (AI = 0; AI < AL; AI++) {
        L[AM + AI] = AO[AI];
        M[AM + AI] = AP[AI];
      }
      barrier(1);

      S += Z;
      AF += V;
    }

    AD++;
  }
  barrier(1);

  if (T == 0) {
    H[U] = R + S;
    A[Q + 2] = -1;
  }

  fn_P(AQ, AR, L, M, S, R, 1);
  barrier(2);

  AL = __clc_ceil((R + S) / W);
  AM = AL * T;
  AN = fn_N(AQ, R, &AQ[R], S, AM);

  fn_O(AQ, AR, AN, R, R + AM - AN, R + S, AO, AP, AL);
  barrier(2);

  for (AI = 0; AI < AL; AI++) {
    AQ[AM + AI] = AO[AI];
    AR[AM + AI] = AP[AI];
  }
}