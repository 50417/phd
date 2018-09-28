typedef unsigned char u8; typedef unsigned short u16; typedef unsigned int u32; typedef char i8; typedef short i16; typedef int i32; __constant const u16 gb_A = (u16)-1; struct FLAT_HTREE {
  u32 weight;
  u16 lc;
  u16 rc;
  u32 code;
  u8 symbol;
  u8 bitlen;
};

void fn_A(u32* A, const struct FLAT_HTREE* B) {
  A[0] = B->weight;
  A[1] = (u32)((u32)(B->lc << 16) | B->rc);
  A[2] = B->code;
  A[3] = (u32)((u32)(B->symbol << 16) | B->bitlen);
}

void fn_B(const u32* A, struct FLAT_HTREE* B) {
  B->weight = A[0];
  B->lc = (u16)((A[1] >> 16) & 0xFFFF);
  B->rc = (u16)(A[1] & 0xFFFF);
  B->code = A[2];
  B->symbol = (u8)((u8)(A[3] >> 16) & 0xFF);
  B->bitlen = (u16)(A[3] & 0xFFFF);
}

int fn_C(u32* A, u32 B, const u8* C) {
  if (B == 0)
    return -1;

  u32 D = -1;
  u32 E = 0xffffffff;
  for (u32 F = 0; F < B; F++) {
    if (C[F] > 0)
      continue;

    struct FLAT_HTREE G;
    fn_B(&A[F * 4], &G);

    if (G.weight < E) {
      D = F;
      E = G.weight;
    }
  }

  return (int)D;
}

u8 fn_D(__global u8** A, u32* B, u8 C) {
  u8 D = (*B) % 8;

  if (C == 1)
    (**A) |= (1 << D);

  (*B)++;

  if (D == 7) {
    (*A)++;
    **A = 0;
    return 1;
  }

  return 0;
}

u8 fn_E(u8 A, u8 B) {
  return ((A & (1 << B)) & 0xFF) != 0;
}

u8 fn_F(__global u8** A, u32* B, u32 C, u32 D) {
  u8 E = 0;
  if (D == 0)
    return 0;

  for (int F = (int)D - 1; F >= 0; F--)

  {
    u8 G = (C >> F) & 0x01;
    E += fn_D(A, B, G);
  }

  return E;
}

int fn_G(__global u8** A, u32* B, u32 C) {
  if (C == 0)
    return 0;

  int D = 0;
  for (u32 E = 0; E < C; E++) {
    u32 F = (*B) % 8;
    (*B)++;

    u8 G = fn_E(**A, F);
    D = (D << 1) + G;

    if (F == 7) {
      (*A)++;
    }
  }

  return D;
}

void fn_H(__global u8** A, u32 B) {
  for (int C = 0; C < 4; C++) {
    **A = (u8)(B >> (C * 8)) & 0xffff;
    (*A)++;
  }
}

inline void fn_I(__global u8** A, u32* B) {
  *B = 0;
  for (int C = 0; C < 4; C++) {
    (*B) |= ((**A) << (C * 8));
    (*A)++;
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_J(__global uchar* A, uint B, __global uchar* C, __global uint* D, uchar E) {
  u32 F[256 * 2 * 4];
  u32 G = 0;

  u8 H[256 * 2];
  for (u32 I = 0; I < 256 * 2; I++) {
    H[I] = 0;
  }

  u32 J[256];
  u16 K[256];
  for (u32 I = 0; I < 256; I++) {
    J[I] = 0;
    K[I] = gb_A;
  }

  for (u32 I = 0; I < B; I++) {
    u8 L = A[I];
    J[L]++;
  }

  u8 M = 0;
  for (u16 I = 0; I < 256; I++) {
    if (J[I] > 0) {
      M++;

      struct FLAT_HTREE N;
      N.lc = N.rc = gb_A;
      N.code = N.bitlen = 0;
      N.symbol = (u16)I;
      N.weight = J[I];

      K[I] = G;

      fn_A(&F[G * 4], &N);
      G++;
    }
  }

  u32 O = M;
  while (O > 1) {
    int P = fn_C(&F[0], G, &H[0]);

    H[P] = 1;

    int Q = fn_C(&F[0], G, &H[0]);

    H[Q] = 1;

    struct FLAT_HTREE R;
    fn_B(&F[P * 4], &R);

    struct FLAT_HTREE S;
    fn_B(&F[Q * 4], &S);

    struct FLAT_HTREE N;
    N.lc = P;
    N.rc = Q;
    N.code = 0;
    N.bitlen = 0;
    N.symbol = S.symbol;
    N.weight = R.weight + S.weight;

    fn_A(&F[G * 4], &N);
    G++;

    O--;
  }

  u32 T = G - 1;

  u16 U[256];
  int V = 0;

  U[V] = T;

  while (V >= 0) {
    struct FLAT_HTREE N;
    struct FLAT_HTREE W;
    struct FLAT_HTREE X;

    u32 Y = U[V--];
    fn_B(&F[Y * 4], &N);

    if (N.lc != gb_A) {
      fn_B(&F[N.lc * 4], &W);
      W.code = (N.code << 1);
      W.bitlen = N.bitlen + 1;
      fn_A(&F[N.lc * 4], &W);

      U[++V] = N.lc;
    }

    if (N.rc != gb_A) {
      fn_B(&F[N.rc * 4], &X);
      X.code = (N.code << 1) + 1;
      X.bitlen = N.bitlen + 1;
      fn_A(&F[N.rc * 4], &X);

      U[++V] = N.rc;
    }
  }
  u32 Z = 0;
  for (u32 I = 0; I < M; I++) {
    struct FLAT_HTREE N;
    fn_B(&F[I * 4], &N);
    Z += N.bitlen;
  }

  u32 AA = (Z + 7) / 8;

  u32 AB = 0;
  for (u32 I = 0; I < B; I++) {
    u16 AC = K[A[I]];
    struct FLAT_HTREE N;

    fn_B(&F[AC * 4], &N);

    AB += N.bitlen;
  }

  u32 AD = (AB + 7) / 8;

  u32 AE = 10 + 2 * M + AA + AD + 2;

  if (E == 1) {
    *D = AE;
    return;
  } else if (*D < AE) {
    printf("Not enough output memory!");
    return;
  }

  __global u8* AF = &C[0];
  fn_H(&AF, B);

  *AF = M;
  AF++;

  for (int I = 0; I < M; I++) {
    struct FLAT_HTREE N;
    fn_B(&F[I * 4], &N);

    *AF = N.symbol;
    AF++;
    *AF = N.bitlen;
    AF++;
  }

  u32 AG = 0;
  u32 AH = 0;
  for (int I = 0; I < M; I++) {
    struct FLAT_HTREE N;
    fn_B(&F[I * 4], &N);

    AH += fn_F(&AF, &AG, N.code, N.bitlen);
  }

  if (AG % 8 != 0) {
    AF++;
  }

  u8 AI = AB % 8;

  fn_H(&AF, AD);

  *AF = AI;
  AF++;

  AG = 0;
  AH = 0;
  for (u32 I = 0; I < B; I++) {
    u16 AC = K[A[I]];
    struct FLAT_HTREE N;

    fn_B(&F[AC * 4], &N);

    AH += fn_F(&AF, &AG, N.code, N.bitlen);
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_K(__global uchar* A, uint B, __global uchar* C, __global uint* D, uchar E) {
  u32 F[256 * 2 * 4];
  u32 G = 0;

  u8 H[256];
  u8 I[256];
  u32 J[256];
  __global u8* K = &A[0];
  u32 L = 0;
  fn_I(&K, &L);

  if (E) {
    *D = L;
    return;
  } else if (*D < L) {
    printf("Not enough memory\n");
  }

  u8 M = *K;
  K++;

  u32 N = 0;
  for (u32 O = 0; O < M; O++) {
    H[O] = *K;
    K++;

    I[O] = *K;
    K++;

    N += I[O];
  }

  u32 P = 0;
  for (u32 O = 0; O < M; O++) {
    J[O] = fn_G(&K, &P, I[O]);

    if (P >= N)
      break;
  }

  if (P % 8 != 0)
    K++;

  u32 Q = G;

  {
    struct FLAT_HTREE R;
    R.lc = R.rc = gb_A;
    R.code = 0;
    R.weight = 0;
    R.symbol = 0;
    R.bitlen = 0;

    fn_A(&F[G * 4], &R);
    G++;
  }

  for (u32 O = 0; O < M; O++) {
    u8 S = I[O];
    u32 T = J[O];

    u32 U = Q;

    u8 V = 0;
    u8 W = 0;
    for (u32 X = 0; X < S; X++) {
      struct FLAT_HTREE Y;

      fn_B(&F[U * 4], &Y);

      u8 Z = (T >> (S - X - 1)) & 0x1;
      W = (W << 1) + Z;
      V++;

      bool AA = (X == (u32)(S - 1));
      bool AB = false;
      bool AC = false;

      if ((Z == 0) && (Y.lc == gb_A)) {
        AB = true;
        AC = true;
      } else if ((Z == 1) && (Y.rc == gb_A)) {
        AB = true;
      }

      if (AB) {
        struct FLAT_HTREE AD;
        AD.lc = AD.rc = gb_A;
        AD.weight = 0;
        AD.code = W;
        AD.bitlen = V;

        if (AA)
          AD.symbol = H[O];

        fn_A(&F[G * 4], &AD);

        if (AC)
          Y.lc = G;
        else
          Y.rc = G;

        fn_A(&F[U * 4], &Y);

        G++;
      }

      if (AA)
        break;

      if (Z)
        U = Y.rc;
      else
        U = Y.lc;
    }
  }

  u32 AE = 0;
  fn_I(&K, &AE);

  u8 AF = *K;
  K++;

  u32 AG = (AE - 1) * 8 + AF;

  P = 0;

  u32 U = Q;
  u32 AH = 0;

  struct FLAT_HTREE Y;

  fn_B(&F[U * 4], &Y);

  while (P < AG) {
    u8 AI = fn_G(&K, &P, 1);

    if (AI && (Y.rc != gb_A))
      U = Y.rc;
    else if (Y.lc != gb_A)
      U = Y.lc;

    fn_B(&F[U * 4], &Y);

    bool AJ = (Y.rc == gb_A) && (Y.lc == gb_A);
    if (AJ) {
      C[AH++] = Y.symbol;
      U = Q;
      fn_B(&F[U * 4], &Y);

      if (AH >= L)
        return;
    }
  }
}