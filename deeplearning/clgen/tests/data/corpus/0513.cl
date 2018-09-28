int fn_A(__private uint A[8], __private uint B[8]); int fn_B(__private uint A[8]); void fn_C(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8]); void fn_D(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8]); void fn_E(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8]); void fn_F(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8], __private uint E[8], __private uint F[8], __private uint G[8], __private uint H[8], __private uint I[8], __private uint J[8]); void fn_G(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8], __private uint E[8], __private uint F[8], __private uint G[8]); void fn_H(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8], __private uint E[8], __private uint F[8], __private uint G[8], __private uint H[8]); __kernel void fn_I(__global uint* A, __global uint* B) {
  __private uint C[8];
  __private uint D[8];
  __private uint E[8];
  __private uint F[8];
  __private uint G[8];
  __private uint H[8];
  __private uint I[8];
  __private uint J[8] = {0xffffffff, 0xffffffff, 0xffffffff, 0, 0, 0, 1, 0xffffffff};

  int K = get_global_id(0);
  A += K * 32;
  B += K * 24;

  for (uint L = 0; L < 8; L++) {
    C[L] = A[L];
    D[L] = A[L + 8];
    E[L] = A[L + 16];
    I[L] = A[L + 24];
  }

  fn_H(C, D, E, I, J, F, G, H);

  for (uint L = 0; L < 8; L++) {
    B[L] = F[L];
    B[L + 8] = G[L];
    B[L + 16] = H[L];
  }
}

void fn_H(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8], __private uint E[8], __private uint F[8], __private uint G[8], __private uint H[8]) {
  __private uint I[8];
  __private uint J[8];
  __private uint K[8];
  __private uint *L, *M, *N, *O, *P, *Q, *R;

  int S = 255;
  while (S >= 0 && ((D[S >> 5] >> (S & 31)) & 1) == 0)
    S--;
  for (int T = 0; T < 8; T++) {
    F[T] = A[T];
    G[T] = B[T];
    H[T] = C[T];
  }
  S--;

  L = F;
  M = G;
  N = H;
  O = I;
  P = J;
  Q = K;

  for (; S >= 0; S--) {
    fn_G(L, M, N, E, O, P, Q);
    if (((D[S >> 5] >> (S & 31)) & 1) == 1) {
      fn_F(O, P, Q, A, B, C, E, L, M, N);
    } else {
      R = L;
      L = O;
      O = R;
      R = M;
      M = P;
      P = R;
      R = N;
      N = Q;
      Q = R;
    }
  }
  for (int T = 0; T < 8; T++) {
    F[T] = L[T];
    G[T] = M[T];
    H[T] = N[T];
  }
}

void fn_F(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8], __private uint E[8], __private uint F[8], __private uint G[8], __private uint H[8], __private uint I[8], __private uint J[8]) {
  __private uint* K = I;

  __private uint* L = H;

  __private uint M[8];
  __private uint N[8];
  __private uint O[8];
  __private uint P[8];
  __private uint Q[8];
  fn_E(C, C, G, L);
  fn_E(C, L, G, P);
  fn_E(D, L, G, L);
  fn_E(E, P, G, P);
  fn_E(F, F, G, K);
  fn_E(F, K, G, O);
  fn_E(A, K, G, K);
  fn_E(B, O, G, O);
  fn_D(L, K, G, N);
  fn_E(C, F, G, J);
  fn_E(J, N, G, J);
  fn_E(N, N, G, M);
  fn_E(N, M, G, N);
  fn_D(P, O, G, Q);
  fn_E(Q, Q, G, P);
  fn_D(P, N, G, P);
  fn_C(K, K, G, L);
  fn_E(L, M, G, L);
  fn_D(P, L, G, H);
  fn_E(K, M, G, K);
  fn_D(K, H, G, K);
  fn_E(K, Q, G, K);
  fn_E(O, N, G, O);
  fn_D(K, O, G, I);
}

void fn_G(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8], __private uint E[8], __private uint F[8], __private uint G[8]) {
  __private uint H[8];
  __private uint I[8];
  __private uint* J = G;
  fn_E(C, C, D, H);
  fn_D(A, H, D, I);
  fn_C(A, H, D, H);
  fn_E(I, H, D, I);
  fn_C(I, I, D, H);
  fn_C(I, H, D, I);

  fn_E(B, B, D, H);
  fn_E(A, H, D, J);
  fn_C(J, J, D, J);
  fn_C(J, J, D, J);

  fn_E(I, I, D, E);
  fn_C(J, J, D, F);
  fn_D(E, F, D, E);

  fn_E(H, H, D, H);
  fn_C(H, H, D, H);
  fn_C(H, H, D, H);
  fn_C(H, H, D, H);

  fn_D(J, E, D, J);
  fn_E(I, J, D, I);
  fn_D(I, H, D, F);

  fn_E(B, C, D, G);
  fn_C(G, G, D, G);
}

void fn_C(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8]) {
  uint E, F = 0;
  ulong G = 0;
  for (uint H = 0; H < 8; H++) {
    G += ((ulong)A[H]) + ((ulong)B[H]);
    D[H] = (uint)(G & 0xffffffff);
    G >>= 32;
  }
  if (G == 0 && fn_A(D, C) < 0)
    return;

  for (uint H = 0; H < 7; H++) {
    E = C[H] + F;
    D[H] -= E;
    F = (E < F || D[H] > ~E ? 1 : 0);
  }
  D[7] -= C[7] + F;
}

void fn_D(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8]) {
  int E = fn_A(A, B);
  if (E >= 0) {
    uint F = B[0], G;
    G = ((D[0] = A[0] - B[0]) > ~F ? 1U : 0U);
    F = B[1] + G;
    G = (F<G | (D[1] = A[1] - F)> ~F ? 1U : 0U);
    F = B[2] + G;
    G = (F<G | (D[2] = A[2] - F)> ~F ? 1U : 0U);
    F = B[3] + G;
    G = (F<G | (D[3] = A[3] - F)> ~F ? 1U : 0U);
    F = B[4] + G;
    G = (F<G | (D[4] = A[4] - F)> ~F ? 1U : 0U);
    F = B[5] + G;
    G = (F<G | (D[5] = A[5] - F)> ~F ? 1U : 0U);
    F = B[6] + G;
    G = (F<G | (D[6] = A[6] - F)> ~F ? 1U : 0U);
    D[7] = A[7] - B[7] - G;
  } else {
    long F;
    int G = 0;
    D[0] = (uint)(F = ((long)A[0]) + ((long)C[0]) - B[0] - G);
    G = (F < 0 ? 1 : F > 0xFFFFFFFF ? -1 : 0);
    D[1] = (uint)(F = ((long)A[1]) + ((long)C[1]) - B[1] - G);
    G = (F < 0 ? 1 : F > 0xFFFFFFFF ? -1 : 0);
    D[2] = (uint)(F = ((long)A[2]) + ((long)C[2]) - B[2] - G);
    G = (F < 0 ? 1 : F > 0xFFFFFFFF ? -1 : 0);
    D[3] = (uint)(F = ((long)A[3]) + ((long)C[3]) - B[3] - G);
    G = (F < 0 ? 1 : F > 0xFFFFFFFF ? -1 : 0);
    D[4] = (uint)(F = ((long)A[4]) + ((long)C[4]) - B[4] - G);
    G = (F < 0 ? 1 : F > 0xFFFFFFFF ? -1 : 0);
    D[5] = (uint)(F = ((long)A[5]) + ((long)C[5]) - B[5] - G);
    G = (F < 0 ? 1 : F > 0xFFFFFFFF ? -1 : 0);
    D[6] = (uint)(F = ((long)A[6]) + ((long)C[6]) - B[6] - G);
    G = (F < 0 ? 1 : F > 0xFFFFFFFF ? -1 : 0);
    D[7] = (uint)(F = ((long)A[7]) + ((long)C[7]) - B[7] - G);
  }
}

void fn_E(__private uint A[8], __private uint B[8], __private uint C[8], __private uint D[8]) {
  ulong E, F, G, H, I, J, K, L;
  uint M;
  ulong N, O, P, Q, R, S, T, U;
  ulong V, W, X, Y, Z;
  ulong AA, AB;
  const ulong AC = 0xffffffff;
  const ulong AD = 0x100000000;
  const ulong AE = 0xffffff800000007f;

  N = ((ulong)A[0]) * ((ulong)B[0]);
  E = N & AC;
  F = N >> 32;
  N = ((ulong)A[1]) * ((ulong)B[0]);
  F += N & AC;
  G = N >> 32;
  N = ((ulong)A[2]) * ((ulong)B[0]);
  G += N & AC;
  H = N >> 32;
  N = ((ulong)A[3]) * ((ulong)B[0]);
  H += N & AC;
  I = N >> 32;
  N = ((ulong)A[4]) * ((ulong)B[0]);
  I += N & AC;
  J = N >> 32;
  N = ((ulong)A[5]) * ((ulong)B[0]);
  J += N & AC;
  K = N >> 32;
  N = ((ulong)A[6]) * ((ulong)B[0]);
  K += N & AC;
  L = N >> 32;
  N = ((ulong)A[7]) * ((ulong)B[0]);
  L += N & AC;
  M = (uint)(N >> 32);
  L += M;
  K -= M;
  H -= M;
  E += M;

  N = ((ulong)A[0]) * ((ulong)B[1]);
  F += N & AC;
  G += N >> 32;
  N = ((ulong)A[1]) * ((ulong)B[1]);
  G += N & AC;
  H += N >> 32;
  N = ((ulong)A[2]) * ((ulong)B[1]);
  H += N & AC;
  I += N >> 32;
  N = ((ulong)A[3]) * ((ulong)B[1]);
  I += N & AC;
  J += N >> 32;
  N = ((ulong)A[4]) * ((ulong)B[1]);
  J += N & AC;
  K += N >> 32;
  N = ((ulong)A[5]) * ((ulong)B[1]);
  K += N & AC;
  L += N >> 32;
  N = ((ulong)A[6]) * ((ulong)B[1]);
  L += N & AC;
  O = (uint)(N >> 32);
  N = ((ulong)A[7]) * ((ulong)B[1]);
  O += (uint)N;
  M = (uint)(N >> 32);
  L += O;
  K -= O + M;
  I -= M;
  H -= O + M;
  F += M;
  E += O + M;

  N = ((ulong)A[0]) * ((ulong)B[2]);
  G += N & AC;
  H += N >> 32;
  N = ((ulong)A[1]) * ((ulong)B[2]);
  H += N & AC;
  I += N >> 32;
  N = ((ulong)A[2]) * ((ulong)B[2]);
  I += N & AC;
  J += N >> 32;
  N = ((ulong)A[3]) * ((ulong)B[2]);
  J += N & AC;
  K += N >> 32;
  N = ((ulong)A[4]) * ((ulong)B[2]);
  K += N & AC;
  L += N >> 32;
  N = ((ulong)A[5]) * ((ulong)B[2]);
  L += N & AC;
  O = (uint)(N >> 32);
  N = ((ulong)A[6]) * ((ulong)B[2]);
  O += (uint)N;
  P = (uint)(N >> 32);
  N = ((ulong)A[7]) * ((ulong)B[2]);
  P += (uint)N;
  M = (uint)(N >> 32);
  L += O - M;
  K -= O + P;
  J -= M;
  I -= P + M;
  H -= O + P;
  G += M;
  F += P + M;
  E += O + P;

  N = ((ulong)A[0]) * ((ulong)B[3]);
  H += N & AC;
  I += N >> 32;
  N = ((ulong)A[1]) * ((ulong)B[3]);
  I += N & AC;
  J += N >> 32;
  N = ((ulong)A[2]) * ((ulong)B[3]);
  J += N & AC;
  K += N >> 32;
  N = ((ulong)A[3]) * ((ulong)B[3]);
  K += N & AC;
  L += N >> 32;
  N = ((ulong)A[4]) * ((ulong)B[3]);
  L += N & AC;
  O = (uint)(N >> 32);
  N = ((ulong)A[5]) * ((ulong)B[3]);
  O += (uint)N;
  P = (uint)(N >> 32);
  N = ((ulong)A[6]) * ((ulong)B[3]);
  P += (uint)N;
  Q = (uint)(N >> 32);
  N = ((ulong)A[7]) * ((ulong)B[3]);
  Q += (uint)N;
  M = (uint)(N >> 32);
  V = ((ulong)M) << 1;
  L += O - Q - M;
  K -= O + P;
  J -= Q + M;
  I -= P + Q;
  H -= O + P - V;
  G += Q + M;
  F += P + Q;
  E += O + P - M;

  N = ((ulong)A[0]) * ((ulong)B[4]);
  I += N & AC;
  J += N >> 32;
  N = ((ulong)A[1]) * ((ulong)B[4]);
  J += N & AC;
  K += N >> 32;
  N = ((ulong)A[2]) * ((ulong)B[4]);
  K += N & AC;
  L += N >> 32;
  N = ((ulong)A[3]) * ((ulong)B[4]);
  L += N & AC;
  O = (uint)(N >> 32);
  N = ((ulong)A[4]) * ((ulong)B[4]);
  O += (uint)N;
  P = (uint)(N >> 32);
  N = ((ulong)A[5]) * ((ulong)B[4]);
  P += (uint)N;
  Q = (uint)(N >> 32);
  N = ((ulong)A[6]) * ((ulong)B[4]);
  Q += (uint)N;
  R = (uint)(N >> 32);
  N = ((ulong)A[7]) * ((ulong)B[4]);
  R += (uint)N;
  M = (uint)(N >> 32);
  V = R << 1;
  W = ((ulong)M) << 1;
  L += O - Q - R - M;
  K -= O + P;
  J -= Q + R;
  I -= P + Q - W;
  H -= O + P - V - W;
  G += Q + R;
  F += P + Q - M;
  E += O + P - R - M;

  N = ((ulong)A[0]) * ((ulong)B[5]);
  J += N & AC;
  K += N >> 32;
  N = ((ulong)A[1]) * ((ulong)B[5]);
  K += N & AC;
  L += N >> 32;
  N = ((ulong)A[2]) * ((ulong)B[5]);
  L += N & AC;
  O = (uint)(N >> 32);
  N = ((ulong)A[3]) * ((ulong)B[5]);
  O += (uint)N;
  P = (uint)(N >> 32);
  N = ((ulong)A[4]) * ((ulong)B[5]);
  P += (uint)N;
  Q = (uint)(N >> 32);
  N = ((ulong)A[5]) * ((ulong)B[5]);
  Q += (uint)N;
  R = (uint)(N >> 32);
  N = ((ulong)A[6]) * ((ulong)B[5]);
  R += (uint)N;
  S = (uint)(N >> 32);
  N = ((ulong)A[7]) * ((ulong)B[5]);
  S += (uint)N;
  M = (uint)(N >> 32);
  V = R << 1;
  W = S << 1;
  X = ((ulong)M) << 1;
  L += O - Q - R - S - M;
  K -= O + P - M;
  J -= Q + R - X;
  I -= P + Q - W - X;
  H -= O + P - V - W - M;
  G += Q + R - M;
  F += P + Q - S - M;
  E += O + P - R - S - M;

  N = ((ulong)A[0]) * ((ulong)B[6]);
  K += N & AC;
  L += N >> 32;
  N = ((ulong)A[1]) * ((ulong)B[6]);
  L += N & AC;
  O = (uint)(N >> 32);
  N = ((ulong)A[2]) * ((ulong)B[6]);
  O += (uint)N;
  P = (uint)(N >> 32);
  N = ((ulong)A[3]) * ((ulong)B[6]);
  P += (uint)N;
  Q = (uint)(N >> 32);
  N = ((ulong)A[4]) * ((ulong)B[6]);
  Q += (uint)N;
  R = (uint)(N >> 32);
  N = ((ulong)A[5]) * ((ulong)B[6]);
  R += (uint)N;
  S = (uint)(N >> 32);
  N = ((ulong)A[6]) * ((ulong)B[6]);
  S += (uint)N;
  T = (uint)(N >> 32);
  N = ((ulong)A[7]) * ((ulong)B[6]);
  T += (uint)N;
  M = (uint)(N >> 32);
  V = R << 1;
  W = S << 1;
  X = T << 1;
  Y = ((ulong)M) << 1;
  AA = Y + M;
  L += O - Q - R - S - T;
  K -= O + P - T - AA;
  J -= Q + R - X - Y;
  I -= P + Q - W - X - M;
  H -= O + P - V - W - T;
  G += Q + R - T - M;
  F += P + Q - S - T - M;
  E += O + P - R - S - T - M;

  N = ((ulong)A[0]) * ((ulong)B[7]);
  L += N & AC;
  O = (uint)(N >> 32);
  N = ((ulong)A[1]) * ((ulong)B[7]);
  O += (uint)N;
  P = (uint)(N >> 32);
  N = ((ulong)A[2]) * ((ulong)B[7]);
  P += (uint)N;
  Q = (uint)(N >> 32);
  N = ((ulong)A[3]) * ((ulong)B[7]);
  Q += (uint)N;
  R = (uint)(N >> 32);
  N = ((ulong)A[4]) * ((ulong)B[7]);
  R += (uint)N;
  S = (uint)(N >> 32);
  N = ((ulong)A[5]) * ((ulong)B[7]);
  S += (uint)N;
  T = (uint)(N >> 32);
  N = ((ulong)A[6]) * ((ulong)B[7]);
  T += (uint)N;
  U = (uint)(N >> 32);
  N = ((ulong)A[7]) * ((ulong)B[7]);
  U += (uint)N;
  M = (uint)(N >> 32);
  V = R << 1;
  W = S << 1;
  X = T << 1;
  Y = U << 1;
  Z = ((ulong)M) << 1;
  AA = Y + U;
  AB = Z + M;
  L += O - Q - R - S - T + AB;
  K -= O + P - T - AA - Z;
  J -= Q + R - X - Y - M;
  I -= P + Q - W - X - U;
  H -= O + P - V - W - T + M;
  G += Q + R - T - U - M;
  F += P + Q - S - T - U - M;
  E += O + P - R - S - T - U;

  while (E >= AE) {
    F--;
    E += AD;
  }
  while (F >= AE) {
    G--;
    F += AD;
  }
  while (G >= AE) {
    H--;
    G += AD;
  }
  while (H >= AE) {
    I--;
    H += AD;
  }
  while (I >= AE) {
    J--;
    I += AD;
  }
  while (J >= AE) {
    K--;
    J += AD;
  }
  while (K >= AE) {
    L--;
    K += AD;
  }
  while (L >= AE) {
    E += C[0];
    F += C[1];
    G += C[2];
    H += C[3];
    I += C[4];
    J += C[5];
    K += C[6];
    L += C[7];
  }

  while (E > AC || F > AC || G > AC || H > AC || I > AC || J > AC || K > AC || L > AC) {
    if (L > AC) {
      M = (uint)(L >> 32);
      E += M;
      H -= M;
      K -= M;
      L = M + (ulong)((uint)L);

      while (H >= AE) {
        I--;
        H += AD;
      }
      while (I >= AE) {
        J--;
        I += AD;
      }
      while (J >= AE) {
        K--;
        J += AD;
      }
      while (K >= AE) {
        L--;
        K += AD;
      }
    }
    M = (uint)(E >> 32);
    E = (uint)E;
    F += M;
    M = (uint)(F >> 32);
    F = (uint)F;
    G += M;
    M = (uint)(G >> 32);
    G = (uint)G;
    H += M;
    M = (uint)(H >> 32);
    H = (uint)H;
    I += M;
    M = (uint)(I >> 32);
    I = (uint)I;
    J += M;
    M = (uint)(J >> 32);
    J = (uint)J;
    K += M;
    M = (uint)(K >> 32);
    K = (uint)K;
    L += M;
  }

  D[0] = E;
  D[1] = F;
  D[2] = G;
  D[3] = H;
  D[4] = I;
  D[5] = J;
  D[6] = K;
  D[7] = L;

  if (fn_A(A, C) >= 0) {
    D[0] -= C[0];
    uint AF = D[0] > ~M ? 1U : 0U;
    M = AF + C[0];
    D[1] -= M;
    AF = (M < AF || D[1] > ~M ? 1U : 0U);
    M = AF + C[0];
    D[2] -= M;
    AF = (M < AF || D[2] > ~M ? 1U : 0U);
    M = AF + C[0];
    D[3] -= M;
    AF = (M < AF || D[3] > ~M ? 1U : 0U);
    M = AF + C[0];
    D[4] -= M;
    AF = (M < AF || D[4] > ~M ? 1U : 0U);
    M = AF + C[0];
    D[5] -= M;
    AF = (M < AF || D[5] > ~M ? 1U : 0U);
    M = AF + C[0];
    D[6] -= M;
    AF = (M < AF || D[6] > ~M ? 1U : 0U);
    M = AF + C[0];
    D[7] -= M;
  }
}

int fn_A(__private uint A[8], __private uint B[8]) {
  int C = 7;
  while (C != 0 && A[C] == B[C])
    C--;
  if (A[C] > B[C])
    return 1;
  if (A[C] < B[C])
    return -1;
  return 0;
}

int fn_B(__private uint A[8]) {
  for (int B = 0; B < 8; B++)
    if (A[B] != 0)
      return 0;
  return 1;
}