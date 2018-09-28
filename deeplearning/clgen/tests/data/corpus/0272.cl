int4 fn_A(int A, int B, int C, int D) {
  int4 E;
  E.x = A;
  E.y = B;
  E.z = C;
  E.w = D;
  return E;
}
float4 fn_B(float A, float B, float C, float D) {
  float4 E;
  E.x = A;
  E.y = B;
  E.z = C;
  E.w = D;
  return E;
}

int4 fn_C(__global int4* A, uint B, uint C) {
  int4 D = fn_A(0, 0, 0, 0);
  if (((B + 1) << 2) <= C)
    D = A[B];
  else {
    if ((B << 2) < C)
      D.x = A[B].x;
    if ((B << 2) + 1 < C)
      D.y = A[B].y;
    if ((B << 2) + 2 < C)
      D.z = A[B].z;
  }
  return D;
}
float4 fn_D(__global float4* A, uint B, uint C) {
  float4 D = fn_B(0, 0, 0, 0);
  if (((B + 1) << 2) <= C)
    D = A[B];
  else {
    if ((B << 2) < C)
      D.x = A[B].x;
    if ((B << 2) + 1 < C)
      D.y = A[B].y;
    if ((B << 2) + 2 < C)
      D.z = A[B].z;
  }
  return D;
}

void fn_E(int4 A, __global int4* B, uint C, uint D) {
  if ((C + 1) * 4 <= D)
    B[C] = A;
  else {
    if (C * 4 < D)
      B[C].x = A.x;
    if (C * 4 + 1 < D)
      B[C].y = A.y;
    if (C * 4 + 2 < D)
      B[C].z = A.z;
  }
}
void fn_F(float4 A, __global float4* B, uint C, uint D) {
  if ((C + 1) * 4 <= D)
    B[C] = A;
  else {
    if (C * 4 < D)
      B[C].x = A.x;
    if (C * 4 + 1 < D)
      B[C].y = A.y;
    if (C * 4 + 2 < D)
      B[C].z = A.z;
  }
}

void fn_G(int A, int B, __local int* C) {
  for (int D = 1; D <= (B >> 1); D <<= 1) {
    if (A < B / (2 * D)) {
      C[2 * (A + 1) * D - 1] = C[2 * (A + 1) * D - 1] + C[(2 * A + 1) * D - 1];
    }
    barrier(1);
  }
  if (A == 0)
    C[B - 1] = 0;
  barrier(1);
  for (int D = (B >> 1); D > 0; D >>= 1) {
    if (A < B / (2 * D)) {
      int E = C[(2 * A + 1) * D - 1];
      C[(2 * A + 1) * D - 1] = C[2 * (A + 1) * D - 1];
      C[2 * (A + 1) * D - 1] = C[2 * (A + 1) * D - 1] + E;
    }
    barrier(1);
  }
}
void fn_H(int A, int B, __local uint* C) {
  for (int D = 1; D <= (B >> 1); D <<= 1) {
    if (A < B / (2 * D)) {
      C[2 * (A + 1) * D - 1] = C[2 * (A + 1) * D - 1] + C[(2 * A + 1) * D - 1];
    }
    barrier(1);
  }
  if (A == 0)
    C[B - 1] = 0;
  barrier(1);
  for (int D = (B >> 1); D > 0; D >>= 1) {
    if (A < B / (2 * D)) {
      uint E = C[(2 * A + 1) * D - 1];
      C[(2 * A + 1) * D - 1] = C[2 * (A + 1) * D - 1];
      C[2 * (A + 1) * D - 1] = C[2 * (A + 1) * D - 1] + E;
    }
    barrier(1);
  }
}
void fn_I(int A, int B, __local float* C) {
  for (int D = 1; D <= (B >> 1); D <<= 1) {
    if (A < B / (2 * D)) {
      C[2 * (A + 1) * D - 1] = C[2 * (A + 1) * D - 1] + C[(2 * A + 1) * D - 1];
    }
    barrier(1);
  }
  if (A == 0)
    C[B - 1] = 0;
  barrier(1);
  for (int D = (B >> 1); D > 0; D >>= 1) {
    if (A < B / (2 * D)) {
      float E = C[(2 * A + 1) * D - 1];
      C[(2 * A + 1) * D - 1] = C[2 * (A + 1) * D - 1];
      C[2 * (A + 1) * D - 1] = C[2 * (A + 1) * D - 1] + E;
    }
    barrier(1);
  }
}
void fn_J(int A, int B, __local short* C) {
  for (int D = 1; D <= (B >> 1); D <<= 1) {
    if (A < B / (2 * D)) {
      C[2 * (A + 1) * D - 1] = C[2 * (A + 1) * D - 1] + C[(2 * A + 1) * D - 1];
    }
    barrier(1);
  }
  if (A == 0)
    C[B - 1] = 0;
  barrier(1);
  for (int D = (B >> 1); D > 0; D >>= 1) {
    if (A < B / (2 * D)) {
      short E = C[(2 * A + 1) * D - 1];
      C[(2 * A + 1) * D - 1] = C[2 * (A + 1) * D - 1];
      C[2 * (A + 1) * D - 1] = C[2 * (A + 1) * D - 1] + E;
    }
    barrier(1);
  }
}

void fn_K(int A, int B, __local uint* C, uint* D) {
  for (int E = 1; E <= (B >> 1); E <<= 1) {
    if (A < B / (2 * E)) {
      C[2 * (A + 1) * E - 1] = C[2 * (A + 1) * E - 1] + C[(2 * A + 1) * E - 1];
    }
    barrier(1);
  }
  *D = C[B - 1];
  barrier(1);
  if (A == 0) {
    C[B - 1] = 0;
  }
  barrier(1);
  for (int E = (B >> 1); E > 0; E >>= 1) {
    if (A < B / (2 * E)) {
      uint F = C[(2 * A + 1) * E - 1];
      C[(2 * A + 1) * E - 1] = C[2 * (A + 1) * E - 1];
      C[2 * (A + 1) * E - 1] = C[2 * (A + 1) * E - 1] + F;
    }
    barrier(1);
  }
}

int fn_L(int A, int B, __local int* C) {
  int D = 0;
  for (int E = 1; E <= (B >> 1); E <<= 1) {
    if (A < B / (2 * E)) {
      C[2 * (A + 1) * E - 1] = C[2 * (A + 1) * E - 1] + C[(2 * A + 1) * E - 1];
    }
    barrier(1);
  }
  if (A == 0) {
    D = C[B - 1];
    C[B - 1] = 0;
  }
  barrier(1);
  for (int E = (B >> 1); E > 0; E >>= 1) {
    if (A < B / (2 * E)) {
      int F = C[(2 * A + 1) * E - 1];
      C[(2 * A + 1) * E - 1] = C[2 * (A + 1) * E - 1];
      C[2 * (A + 1) * E - 1] = C[2 * (A + 1) * E - 1] + F;
    }
    barrier(1);
  }
  return D;
}
float fn_M(int A, int B, __local float* C) {
  float D = 0;
  for (int E = 1; E <= (B >> 1); E <<= 1) {
    if (A < B / (2 * E)) {
      C[2 * (A + 1) * E - 1] = C[2 * (A + 1) * E - 1] + C[(2 * A + 1) * E - 1];
    }
    barrier(1);
  }
  if (A == 0) {
    D = C[B - 1];
    C[B - 1] = 0;
  }
  barrier(1);
  for (int E = (B >> 1); E > 0; E >>= 1) {
    if (A < B / (2 * E)) {
      float F = C[(2 * A + 1) * E - 1];
      C[(2 * A + 1) * E - 1] = C[2 * (A + 1) * E - 1];
      C[2 * (A + 1) * E - 1] = C[2 * (A + 1) * E - 1] + F;
    }
    barrier(1);
  }
  return D;
}

__kernel void fn_N(__global int const* A, __global int* B, __local int* C) {
  int D = get_global_id(0);
  int E = get_local_id(0);
  int F = get_local_size(0);
  int G = get_group_id(0);
  C[E] = A[2 * D] + A[2 * D + 1];
  barrier(1);
  fn_G(E, F, C);
  B[2 * D + 1] = C[E] + A[2 * D];
  B[2 * D] = C[E];
}
__kernel void fn_O(__global float const* A, __global float* B, __local float* C) {
  int D = get_global_id(0);
  int E = get_local_id(0);
  int F = get_local_size(0);
  int G = get_group_id(0);
  C[E] = A[2 * D] + A[2 * D + 1];
  barrier(1);
  fn_I(E, F, C);
  B[2 * D + 1] = C[E] + A[2 * D];
  B[2 * D] = C[E];
}

__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void fn_P(__global int4 const* A, __global int4* B, uint C, __local int* D) {
  int E = get_global_id(0);
  int F = get_local_id(0);
  int G = get_local_size(0);
  int4 H = fn_C(A, 2 * E, C);
  int4 I = fn_C(A, 2 * E + 1, C);
  H.y += H.x;
  H.w += H.z;
  H.w += H.y;
  I.y += I.x;
  I.w += I.z;
  I.w += I.y;
  I.w += H.w;
  D[F] = I.w;
  barrier(1);
  fn_G(F, G, D);
  I.w = D[F];
  int J = H.w;
  H.w = I.w;
  I.w += J;
  J = H.y;
  H.y = H.w;
  H.w += J;
  J = I.y;
  I.y = I.w;
  I.w += J;
  J = H.x;
  H.x = H.y;
  H.y += J;
  J = I.x;
  I.x = I.y;
  I.y += J;
  J = H.z;
  H.z = H.w;
  H.w += J;
  J = I.z;
  I.z = I.w;
  I.w += J;
  fn_E(I, B, 2 * E + 1, C);
  fn_E(H, B, 2 * E, C);
}
__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void fn_Q(__global float4 const* A, __global float4* B, uint C, __local float* D) {
  int E = get_global_id(0);
  int F = get_local_id(0);
  int G = get_local_size(0);
  float4 H = fn_D(A, 2 * E, C);
  float4 I = fn_D(A, 2 * E + 1, C);
  H.y += H.x;
  H.w += H.z;
  H.w += H.y;
  I.y += I.x;
  I.w += I.z;
  I.w += I.y;
  I.w += H.w;
  D[F] = I.w;
  barrier(1);
  fn_I(F, G, D);
  I.w = D[F];
  float J = H.w;
  H.w = I.w;
  I.w += J;
  J = H.y;
  H.y = H.w;
  H.w += J;
  J = I.y;
  I.y = I.w;
  I.w += J;
  J = H.x;
  H.x = H.y;
  H.y += J;
  J = I.x;
  I.x = I.y;
  I.y += J;
  J = H.z;
  H.z = H.w;
  H.w += J;
  J = I.z;
  I.z = I.w;
  I.w += J;
  fn_F(I, B, 2 * E + 1, C);
  fn_F(H, B, 2 * E, C);
}

__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void fn_R(__global int4 const* A, __global int4* B, uint C, __global int* D, __local int* E) {
  int F = get_global_id(0);
  int G = get_local_id(0);
  int H = get_group_id(0);
  int I = get_local_size(0);
  int4 J = fn_C(A, 2 * F, C);
  int4 K = fn_C(A, 2 * F + 1, C);
  J.y += J.x;
  J.w += J.z;
  J.w += J.y;
  K.y += K.x;
  K.w += K.z;
  K.w += K.y;
  K.w += J.w;
  E[G] = K.w;
  barrier(1);
  int L = fn_L(G, I, E);
  if (G == 0)
    D[H] = L;
  K.w = E[G];
  int M = J.w;
  J.w = K.w;
  K.w += M;
  M = J.y;
  J.y = J.w;
  J.w += M;
  M = K.y;
  K.y = K.w;
  K.w += M;
  M = J.x;
  J.x = J.y;
  J.y += M;
  M = K.x;
  K.x = K.y;
  K.y += M;
  M = J.z;
  J.z = J.w;
  J.w += M;
  M = K.z;
  K.z = K.w;
  K.w += M;
  fn_E(K, B, 2 * F + 1, C);
  fn_E(J, B, 2 * F, C);
}
__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void fn_S(__global float4 const* A, __global float4* B, uint C, __global float* D, __local float* E) {
  int F = get_global_id(0);
  int G = get_local_id(0);
  int H = get_group_id(0);
  int I = get_local_size(0);
  float4 J = fn_D(A, 2 * F, C);
  float4 K = fn_D(A, 2 * F + 1, C);
  J.y += J.x;
  J.w += J.z;
  J.w += J.y;
  K.y += K.x;
  K.w += K.z;
  K.w += K.y;
  K.w += J.w;
  E[G] = K.w;
  barrier(1);
  float L = fn_M(G, I, E);
  if (G == 0)
    D[H] = L;
  K.w = E[G];
  float M = J.w;
  J.w = K.w;
  K.w += M;
  M = J.y;
  J.y = J.w;
  J.w += M;
  M = K.y;
  K.y = K.w;
  K.w += M;
  M = J.x;
  J.x = J.y;
  J.y += M;
  M = K.x;
  K.x = K.y;
  K.y += M;
  M = J.z;
  J.z = J.w;
  J.w += M;
  M = K.z;
  K.z = K.w;
  K.w += M;
  fn_F(K, B, 2 * F + 1, C);
  fn_F(J, B, 2 * F, C);
}

__kernel void fn_T(__global int* A, __global int4* B, uint C) {
  int D = get_global_id(0);
  int E = get_group_id(0);
  int4 F = fn_C(B, D, C);
  int G = A[E >> 1];
  F.xyzw += G;
  fn_E(F, B, D, C);
}
__kernel void fn_U(__global float* A, __global float4* B, uint C) {
  int D = get_global_id(0);
  int E = get_group_id(0);
  float4 F = fn_D(B, D, C);
  float G = A[E >> 1];
  F.xyzw += G;
  fn_F(F, B, D, C);
}

void fn_V(int A, int B, short4 C, short4 D, short4 E, short4 F, __local short* G, __local short* H, __local short* I, __local short* J, short4* K, short4* L, short4* M, short4* N, short4* O) {
  short4 P = C;
  P.y += P.x;
  P.w += P.z;
  P.w += P.y;
  G[A] = P.w;

  short4 Q = D;
  Q.y += Q.x;
  Q.w += Q.z;
  Q.w += Q.y;
  H[A] = Q.w;

  short4 R = E;
  R.y += R.x;
  R.w += R.z;
  R.w += R.y;
  I[A] = R.w;

  short4 S = F;
  S.y += S.x;
  S.w += S.z;
  S.w += S.y;
  J[A] = S.w;

  barrier(1);

  for (int T = 1; T <= (B >> 1); T <<= 1) {
    if (A < B / (2 * T)) {
      G[2 * (A + 1) * T - 1] = G[2 * (A + 1) * T - 1] + G[(2 * A + 1) * T - 1];
      H[2 * (A + 1) * T - 1] = H[2 * (A + 1) * T - 1] + H[(2 * A + 1) * T - 1];
      I[2 * (A + 1) * T - 1] = I[2 * (A + 1) * T - 1] + I[(2 * A + 1) * T - 1];
      J[2 * (A + 1) * T - 1] = J[2 * (A + 1) * T - 1] + J[(2 * A + 1) * T - 1];
    }
    barrier(1);
  }

  short4 U;
  U.s0 = G[B - 1];
  U.s1 = H[B - 1];
  U.s2 = I[B - 1];
  U.s3 = J[B - 1];

  barrier(1);

  if (A == 0) {
    G[B - 1] = 0;
    H[B - 1] = 0;
    I[B - 1] = 0;
    J[B - 1] = 0;
  }

  barrier(1);

  for (int T = (B >> 1); T > 0; T >>= 1) {
    if (A < B / (2 * T)) {
      int V = G[(2 * A + 1) * T - 1];
      G[(2 * A + 1) * T - 1] = G[2 * (A + 1) * T - 1];
      G[2 * (A + 1) * T - 1] = G[2 * (A + 1) * T - 1] + V;

      V = H[(2 * A + 1) * T - 1];
      H[(2 * A + 1) * T - 1] = H[2 * (A + 1) * T - 1];
      H[2 * (A + 1) * T - 1] = H[2 * (A + 1) * T - 1] + V;

      V = I[(2 * A + 1) * T - 1];
      I[(2 * A + 1) * T - 1] = I[2 * (A + 1) * T - 1];
      I[2 * (A + 1) * T - 1] = I[2 * (A + 1) * T - 1] + V;

      V = J[(2 * A + 1) * T - 1];
      J[(2 * A + 1) * T - 1] = J[2 * (A + 1) * T - 1];
      J[2 * (A + 1) * T - 1] = J[2 * (A + 1) * T - 1] + V;
    }

    barrier(1);
  }

  P.w = G[A];

  short W = P.y;
  P.y = P.w;
  P.w += W;
  W = P.x;
  P.x = P.y;
  P.y += W;
  W = P.z;
  P.z = P.w;
  P.w += W;
  *K = P;

  Q.w = H[A];

  W = Q.y;
  Q.y = Q.w;
  Q.w += W;
  W = Q.x;
  Q.x = Q.y;
  Q.y += W;
  W = Q.z;
  Q.z = Q.w;
  Q.w += W;
  *L = Q;

  R.w = I[A];

  W = R.y;
  R.y = R.w;
  R.w += W;
  W = R.x;
  R.x = R.y;
  R.y += W;
  W = R.z;
  R.z = R.w;
  R.w += W;
  *M = R;

  S.w = J[A];

  W = S.y;
  S.y = S.w;
  S.w += W;
  W = S.x;
  S.x = S.y;
  S.y += W;
  W = S.z;
  S.z = S.w;
  S.w += W;
  *N = S;

  barrier(1);

  *O = U;
}

short4 fn_W(int A, uchar B, int4 C) {
  short4 D;
  D.x = ((C.x >> A) & 3) == B ? 1 : 0;
  D.y = ((C.y >> A) & 3) == B ? 1 : 0;
  D.z = ((C.z >> A) & 3) == B ? 1 : 0;
  D.w = ((C.w >> A) & 3) == B ? 1 : 0;
  return D;
}

short fn_X(int A, int B, short C, short D, short E, short F, short4 G) {
  switch ((A >> B) & 3) {
    case 0:
      return C;
    case 1:
      return D + G.x;
    case 2:
      return E + G.x + G.y;
    case 3:
      return F + G.x + G.y + G.z;
  }

  return 0;
}

void fn_Y(int A, int B, int C, int4 D, __local short* E, int4* F, short4* G) {
  __local short* H = E;
  __local short* I = H + B;
  __local short* J = I + B;
  __local short* K = J + B;

  short4 L = fn_W(C, 0, D);
  short4 M = fn_W(C, 1, D);
  short4 N = fn_W(C, 2, D);
  short4 O = fn_W(C, 3, D);

  short4 P;
  short4 Q;
  short4 R;
  short4 S;

  fn_V(A, B, L, M, N, O, H, I, J, K, &P, &Q, &R, &S, G);

  (*F).x = fn_X(D.x, C, P.x, Q.x, R.x, S.x, *G);
  (*F).y = fn_X(D.y, C, P.y, Q.y, R.y, S.y, *G);
  (*F).z = fn_X(D.z, C, P.z, Q.z, R.z, S.z, *G);
  (*F).w = fn_X(D.w, C, P.w, Q.w, R.w, S.w, *G);
}

int4 fn_Z(__global int4* A, uint B, uint C) {
  int4 D = fn_A(2147483647, 2147483647, 2147483647, 2147483647);
  if (((B + 1) << 2) <= C)
    D = A[B];
  else {
    if ((B << 2) < C)
      D.x = A[B].x;
    if ((B << 2) + 1 < C)
      D.y = A[B].y;
    if ((B << 2) + 2 < C)
      D.z = A[B].z;
  }
  return D;
}

void fn_AA(int A, __global int* B, uint C, uint D) {
  if (C < D)
    B[C] = A;
}

__kernel void fn_AB(int A, __global int4* B, uint C, __global int* D, __global int4* E, __global int* F, __global int4* G, __local short* H) {
  int I = get_global_id(0);
  int J = get_local_id(0);
  int K = get_local_size(0);
  int L = get_group_id(0);
  int M = get_global_size(0) / K;

  int4 N = fn_Z(B, I, C);

  int4 O;
  short4 P;
  fn_Y(J, K, A, N, H, &O, &P);

  barrier(1);

  __local int* Q = (__local int*)H;
  __local int4* R = (__local int4*)H;

  Q[O.x] = N.x;
  Q[O.y] = N.y;
  Q[O.z] = N.z;
  Q[O.w] = N.w;

  barrier(1);

  if (((I + 1) << 2) <= C) {
    E[I] = R[J];
    G[I] = O;
  } else {
    if ((I << 2) < C)
      E[I].x = R[J].x;
    if ((I << 2) + 1 < C)
      E[I].y = R[J].y;
    if ((I << 2) + 2 < C)
      E[I].z = R[J].z;
  }

  if (J == 0) {
    D[L] = P.x;
    D[L + M] = P.y;
    D[L + 2 * M] = P.z;
    D[L + 3 * M] = P.w;

    F[L] = 0;
    F[L + M] = P.x;
    F[L + 2 * M] = P.x + P.y;
    F[L + 3 * M] = P.x + P.y + P.z;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void fn_AC(

    int A,

    __global int const* restrict B,

    uint C,

    __global int* restrict D) {
  __local int E[16 * 64];

  int F = get_global_id(0);
  int G = get_local_id(0);
  int H = get_local_size(0);
  int I = get_group_id(0);
  int J = get_global_size(0) / H;

  for (int K = 0; K < 16; ++K) {
    E[K * 64 + G] = 0;
  }

  barrier(1);

  const int L = 8;
  const int M = L * 64;

  int N = (C + 64 * 4 - 1) / (64 * 4);
  int O = N - I * L;

  int P = I * M + G;
  for (int Q = 0; Q < min(L, O); ++Q, P += 64) {
    int4 R = fn_Z(B, P, C);

    int4 S = ((R >> A) & 0xF);

    atom_inc(&E[S.x * 64 + G]);

    atom_inc(&E[S.y * 64 + G]);

    atom_inc(&E[S.z * 64 + G]);

    atom_inc(&E[S.w * 64 + G]);
  }

  barrier(1);

  int T = 0;
  if (G < 16) {
    for (int K = 0; K < 64; ++K) {
      T += E[G * 64 + K];
    }

    D[J * G + I] = T;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void fn_AD(int A,

                                                                    __global int4 const* restrict B,

                                                                    uint C,

                                                                    __global int const* restrict D,

                                                                    __global int* restrict E) {
  __local int F[64 * 4];
  __local int G[16];

  int H = get_global_id(0);
  int I = get_local_id(0);
  int J = get_local_size(0);
  int K = get_group_id(0);
  int L = get_global_size(0) / J;

  __local uint* M = (__local uint*)F;

  int N = 8;
  int O = N * 64;
  int P = (C + 64 * 4 - 1) / (64 * 4);
  int Q = P - K * N;

  if (I < 16) {
    G[I] = D[K + I * L];
  }

  barrier(1);

  int R = K * O + I;
  for (int S = 0; S < min(N, Q); ++S, R += 64) {
    int4 T = fn_Z(B, R, C);

    M[I] = 0;

    barrier(1);

    for (int U = 0; U <= 2; U += 2) {
      int4 V = ((T >> A) >> U) & 0x3;

      int4 W;
      W.x = 1 << (8 * V.x);
      W.y = 1 << (8 * V.y);
      W.z = 1 << (8 * V.z);
      W.w = 1 << (8 * V.w);

      uint X = (uint)(W.x + W.y + W.z + W.w);

      M[I] = X;

      barrier(1);

      uint Y = 0;
      fn_K(I, 64, M, &Y);

      X = M[I];

      barrier(1);

      Y = (Y << 8) + (Y << 16) + (Y << 24);
      uint Z = Y + X;

      int4 AA;

      int AB = W.y + W.x;
      W.w = W.z + AB;
      W.z = AB;
      W.y = W.x;
      W.x = 0;

      W += (int)Z;
      AA = (W >> (V * 8)) & 0xFF;

      F[AA.x] = T.x;
      F[AA.y] = T.y;
      F[AA.z] = T.z;
      F[AA.w] = T.w;

      barrier(1);

      T.x = F[I << 2];
      T.y = F[(I << 2) + 1];
      T.z = F[(I << 2) + 2];
      T.w = F[(I << 2) + 3];

      barrier(1);
    }

    M[I] = 0;

    barrier(1);

    int4 AC = (T >> A) & 0xF;
    atom_inc(&M[AC.x]);
    atom_inc(&M[AC.y]);
    atom_inc(&M[AC.z]);
    atom_inc(&M[AC.w]);

    barrier(1);

    int AD = 0;
    if (I < 16) {
      AD = M[I];
    }

    barrier(1);

    fn_H(I, 16, M);

    int Z = G[AC.x] + (I << 2) - M[AC.x];
    if (Z < C) {
      E[Z] = T.x;
    }

    Z = G[AC.y] + (I << 2) + 1 - M[AC.y];
    if (Z < C) {
      E[Z] = T.y;
    }

    Z = G[AC.z] + (I << 2) + 2 - M[AC.z];
    if (Z < C) {
      E[Z] = T.z;
    }

    Z = G[AC.w] + (I << 2) + 3 - M[AC.w];
    if (Z < C) {
      E[Z] = T.w;
    }

    barrier(1);

    if (I < 16) {
      G[I] += AD;
    }
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void fn_AE(int A,

                                                                    __global int4 const* restrict B,

                                                                    __global int4 const* restrict C,

                                                                    uint D,

                                                                    __global int const* restrict E,

                                                                    __global int* restrict F,

                                                                    __global int* restrict G) {
  __local int H[64 * 4];
  __local int I[16];

  int J = get_global_id(0);
  int K = get_local_id(0);
  int L = get_local_size(0);
  int M = get_group_id(0);
  int N = get_global_size(0) / L;

  __local uint* O = (__local uint*)H;

  int P = 8;
  int Q = P * 64;
  int R = (D + 64 * 4 - 1) / (64 * 4);
  int S = R - M * P;

  if (K < 16) {
    I[K] = E[M + K * N];
  }

  barrier(1);

  int T = M * Q + K;
  for (int U = 0; U < min(P, S); ++U, T += 64) {
    int4 V = fn_Z(B, T, D);
    int4 W = fn_Z(C, T, D);

    O[K] = 0;

    barrier(1);

    for (int X = 0; X <= 2; X += 2) {
      int4 Y = ((V >> A) >> X) & 0x3;

      int4 Z;
      Z.x = 1 << (8 * Y.x);
      Z.y = 1 << (8 * Y.y);
      Z.z = 1 << (8 * Y.z);
      Z.w = 1 << (8 * Y.w);

      uint AA = (uint)(Z.x + Z.y + Z.z + Z.w);

      O[K] = AA;

      barrier(1);

      uint AB = 0;
      fn_K(K, 64, O, &AB);

      AA = O[K];

      barrier(1);

      AB = (AB << 8) + (AB << 16) + (AB << 24);
      uint AC = AB + AA;

      int4 AD;

      int AE = Z.y + Z.x;
      Z.w = Z.z + AE;
      Z.z = AE;
      Z.y = Z.x;
      Z.x = 0;

      Z += (int)AC;
      AD = (Z >> (Y * 8)) & 0xFF;

      H[AD.x] = V.x;
      H[AD.y] = V.y;
      H[AD.z] = V.z;
      H[AD.w] = V.w;

      barrier(1);

      V = ((__local int4*)H)[K];

      barrier(1);

      H[AD.x] = W.x;
      H[AD.y] = W.y;
      H[AD.z] = W.z;
      H[AD.w] = W.w;

      barrier(1);

      W = ((__local int4*)H)[K];

      barrier(1);
    }

    O[K] = 0;

    barrier(1);

    int4 AF = (V >> A) & 0xF;
    atom_inc(&O[AF.x]);
    atom_inc(&O[AF.y]);
    atom_inc(&O[AF.z]);
    atom_inc(&O[AF.w]);

    barrier(1);

    int AG = 0;
    if (K < 16) {
      AG = O[K];
    }

    barrier(1);

    fn_H(K, 16, O);

    int AC = I[AF.x] + (K << 2) - O[AF.x];
    if (AC < D) {
      F[AC] = V.x;
      G[AC] = W.x;
    }

    AC = I[AF.y] + (K << 2) + 1 - O[AF.y];
    if (AC < D) {
      F[AC] = V.y;
      G[AC] = W.y;
    }

    AC = I[AF.z] + (K << 2) + 2 - O[AF.z];
    if (AC < D) {
      F[AC] = V.z;
      G[AC] = W.z;
    }

    AC = I[AF.w] + (K << 2) + 3 - O[AF.w];
    if (AC < D) {
      F[AC] = V.w;
      G[AC] = W.w;
    }

    barrier(1);

    I[K] += AG;
  }
}

__kernel void fn_AF(__global int* A, __global int* B, __global int* C, uint D, __global int* E) {
  int F = get_global_id(0);
  int G = get_group_id(0);

  if (F < D) {
    if (A[F]) {
      E[B[F]] = C[F];
    }
  }
}

__kernel void fn_AG(__global int* A, __global int* B, __global int* C, uint D, __global int* E, __global int* F) {
  int G = get_global_id(0);
  int H = get_group_id(0);

  if (G < D) {
    if (A[G]) {
      E[B[G]] = C[G];
    }
  }

  if (G == 0) {
    *F = B[D - 1] + A[D - 1];
  }
}

__kernel void fn_AH(__global int4* A, uint B, __global int4* C) {
  int D = get_global_id(0);
  int4 E = fn_C(A, D, B);
  fn_E(E, C, D, B);
}

void fn_AI(int A, int B, __local int* C, __local char* D) {
  for (int E = 1; E <= (B >> 1); E <<= 1) {
    if (A < B / (2 * E)) {
      if ((D[(2 * (A + 1) * E - 1)] & 0x1) == 0) {
        C[2 * (A + 1) * E - 1] = C[2 * (A + 1) * E - 1] + C[(2 * A + 1) * E - 1];
      }

      (D[(2 * (A + 1) * E - 1)]) = (D[(2 * (A + 1) * E - 1)]) | (D[((2 * A + 1) * E - 1)] & 0x1);
    }

    barrier(1);
  }

  if (A == 0)
    C[B - 1] = 0;

  barrier(1);

  for (int E = (B >> 1); E > 0; E >>= 1) {
    if (A < B / (2 * E)) {
      int F = C[(2 * A + 1) * E - 1];
      C[(2 * A + 1) * E - 1] = C[2 * (A + 1) * E - 1];

      if (((D[((2 * A + 1) * E)] >> 1) & 0x1) == 1) {
        C[2 * (A + 1) * E - 1] = 0;
      } else if ((D[((2 * A + 1) * E - 1)] & 0x1) == 1) {
        C[2 * (A + 1) * E - 1] = F;
      } else {
        C[2 * (A + 1) * E - 1] = C[2 * (A + 1) * E - 1] + F;
      }

      (D[((2 * A + 1) * E - 1)]) = (D[((2 * A + 1) * E - 1)]) & 2;
    }

    barrier(1);
  }
}

void fn_AJ(int A, int B, __local int* C, __local char* D) {
  for (int E = 1; E <= (B >> 1); E <<= 1) {
    if (A < B / (2 * E)) {
      if ((D[(2 * (A + 1) * E - 1)] & 0x1) == 0) {
        C[2 * (A + 1) * E - 1] = C[2 * (A + 1) * E - 1] + C[(2 * A + 1) * E - 1];
      }

      (D[(2 * (A + 1) * E - 1)]) = (D[(2 * (A + 1) * E - 1)]) | (D[((2 * A + 1) * E - 1)] & 0x1);
    }

    barrier(1);
  }

  if (A == 0)
    C[B - 1] = 0;

  barrier(1);

  for (int E = (B >> 1); E > 0; E >>= 1) {
    if (A < B / (2 * E)) {
      int F = C[(2 * A + 1) * E - 1];
      C[(2 * A + 1) * E - 1] = C[2 * (A + 1) * E - 1];

      if ((D[((2 * A + 1) * E - 1)] & 0x1) == 1) {
        C[2 * (A + 1) * E - 1] = F;
      } else {
        C[2 * (A + 1) * E - 1] = C[2 * (A + 1) * E - 1] + F;
      }

      (D[((2 * A + 1) * E - 1)]) = (D[((2 * A + 1) * E - 1)]) & 2;
    }

    barrier(1);
  }
}

void fn_AK(int A, int B, int C, __local int* D, __local char* E, __global int* F, __global int* G) {
  for (int H = 1; H <= (C >> 1); H <<= 1) {
    if (A < C / (2 * H)) {
      if ((E[(2 * (A + 1) * H - 1)] & 0x1) == 0) {
        D[2 * (A + 1) * H - 1] = D[2 * (A + 1) * H - 1] + D[(2 * A + 1) * H - 1];
      }

      (E[(2 * (A + 1) * H - 1)]) = (E[(2 * (A + 1) * H - 1)]) | (E[((2 * A + 1) * H - 1)] & 0x1);
    }

    barrier(1);
  }

  if (A == 0) {
    F[B] = D[C - 1];
    G[B] = (E[(C - 1)] & 0x1);
    D[C - 1] = 0;
  }

  barrier(1);

  for (int H = (C >> 1); H > 0; H >>= 1) {
    if (A < C / (2 * H)) {
      int I = D[(2 * A + 1) * H - 1];
      D[(2 * A + 1) * H - 1] = D[2 * (A + 1) * H - 1];

      if (((E[((2 * A + 1) * H)] >> 1) & 0x1) == 1) {
        D[2 * (A + 1) * H - 1] = 0;
      } else if ((E[((2 * A + 1) * H - 1)] & 0x1) == 1) {
        D[2 * (A + 1) * H - 1] = I;
      } else {
        D[2 * (A + 1) * H - 1] = D[2 * (A + 1) * H - 1] + I;
      }

      (E[((2 * A + 1) * H - 1)]) = (E[((2 * A + 1) * H - 1)]) & 2;
    }

    barrier(1);
  }
}

void fn_AL(int A, int B, int C, __local int* D, __local char* E, __global int* F, __global int* G) {
  for (int H = 1; H <= (C >> 1); H <<= 1) {
    if (A < C / (2 * H)) {
      if ((E[(2 * (A + 1) * H - 1)] & 0x1) == 0) {
        D[2 * (A + 1) * H - 1] = D[2 * (A + 1) * H - 1] + D[(2 * A + 1) * H - 1];
      }

      (E[(2 * (A + 1) * H - 1)]) = (E[(2 * (A + 1) * H - 1)]) | (E[((2 * A + 1) * H - 1)] & 0x1);
    }

    barrier(1);
  }

  if (A == 0) {
    F[B] = D[C - 1];
    G[B] = (E[(C - 1)] & 0x1);
    D[C - 1] = 0;
  }

  barrier(1);

  for (int H = (C >> 1); H > 0; H >>= 1) {
    if (A < C / (2 * H)) {
      int I = D[(2 * A + 1) * H - 1];
      D[(2 * A + 1) * H - 1] = D[2 * (A + 1) * H - 1];

      if ((E[((2 * A + 1) * H - 1)] & 0x1) == 1) {
        D[2 * (A + 1) * H - 1] = I;
      } else {
        D[2 * (A + 1) * H - 1] = D[2 * (A + 1) * H - 1] + I;
      }

      (E[((2 * A + 1) * H - 1)]) = (E[((2 * A + 1) * H - 1)]) & 2;
    }

    barrier(1);
  }
}

__kernel void fn_AM(__global int const* A, __global int const* B, int C, __global int* D, __local int* E) {
  int F = get_global_id(0);
  int G = get_local_id(0);
  int H = get_local_size(0);
  int I = get_group_id(0);

  __local int* J = E;
  __local char* K = (__local char*)(J + H);

  J[G] = F < C ? A[F] : 0;
  K[G] = F < C ? (B[F] ? 3 : 0) : 0;

  barrier(1);

  fn_AJ(G, H, J, K);

  D[F] = J[G];
}

__kernel void fn_AN(__global int const* A, __global int const* B, int C, __global int* D, __local int* E) {
  int F = get_global_id(0);
  int G = get_local_id(0);
  int H = get_local_size(0);
  int I = get_group_id(0);

  __local int* J = E;
  __local char* K = (__local char*)(J + H);

  J[G] = F < C ? A[F] : 0;
  K[G] = F < C ? (B[F] ? 3 : 0) : 0;

  barrier(1);

  fn_AI(G, H, J, K);

  D[F] = J[G];
}

__kernel void fn_AO(__global int const* A, __global int const* B, int C, __global int* D, __global int* E, __global int* F, __local int* G) {
  int H = get_global_id(0);
  int I = get_local_id(0);
  int J = get_local_size(0);
  int K = get_group_id(0);

  __local int* L = G;
  __local char* M = (__local char*)(L + J);

  L[I] = H < C ? A[H] : 0;
  M[I] = H < C ? (B[H] ? 3 : 0) : 0;

  barrier(1);

  fn_AK(I, K, J, L, M, E, F);

  D[H] = L[I];
}

__kernel void fn_AP(__global int const* A, __global int const* B, int C, __global int* D, __global int* E, __global int* F, __local int* G) {
  int H = get_global_id(0);
  int I = get_local_id(0);
  int J = get_local_size(0);
  int K = get_group_id(0);

  __local int* L = G;
  __local char* M = (__local char*)(L + J);

  L[I] = H < C ? A[H] : 0;
  M[I] = H < C ? (B[H] ? 3 : 0) : 0;

  barrier(1);

  fn_AL(I, K, J, L, M, E, F);

  D[H] = L[I];
}

__kernel void fn_AQ(__global int* A, __global int* B, int C, __global int* D) {
  int E = get_global_id(0);
  int F = get_local_id(0);
  int G = get_local_size(0);
  int H = get_group_id(0);

  int I = D[H];

  if (F == 0) {
    for (int J = 0; B[E + J] == 0 && J < G; ++J) {
      if (E + J < C) {
        A[E + J] += I;
      }
    }
  }
}

__kernel void fn_AR(__global int* A, __global int* B, int C, __global int* D) {
  int E = get_global_id(0);
  int F = get_local_id(0);
  int G = get_local_size(0);
  int H = get_group_id(0);

  int I = D[H];
  bool J = false;

  if (F == 0) {
    for (int K = 0; K < G; ++K) {
      if (E + K < C) {
        if (B[E + K] == 0) {
          A[E + K] += I;
        } else {
          if (J) {
            break;
          } else {
            A[E + K] += I;
            J = true;
          }
        }
      }
    }
  }
}