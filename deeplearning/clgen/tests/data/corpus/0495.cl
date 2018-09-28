typedef struct {
  float x;
  float y;
  float z;
} FLOAT3;
__kernel void fn_A(__global char* A, short B, int C) {
  const int D = get_global_id(0);
  if (D >= C)
    return;
  A[D] = B;
}

inline void fn_B(float A, FLOAT3 B, FLOAT3* C) {
  C->x = B.x / A;
  C->y = B.y / A;
  C->z = B.z / A;
}

inline float fn_C(FLOAT3 A) {
  return A.x * A.x + A.y * A.y + A.z * A.z;
}

inline float fn_D(float A, float B, float C) {
  return ((float)((1.4f)) - (float)(1.0f)) * (B - (float)(0.5f) * A * C);
}
inline float fn_E(float A, float B) {
  return sqrt((float)((1.4f)) * B / A);
}
inline void fn_F(float A, FLOAT3 B, float C, float D, FLOAT3 E, FLOAT3* F, FLOAT3* G, FLOAT3* H, FLOAT3* I) {
  F->x = E.x * B.x + D;
  F->y = E.x * B.y;
  F->z = E.x * B.z;

  G->x = F->y;
  G->y = E.y * B.y + D;
  G->z = E.y * B.z;

  H->x = F->z;
  H->y = G->z;
  H->z = E.z * B.z + D;

  float J = C + D;
  I->x = E.x * J;
  I->y = E.y * J;
  I->z = E.z * J;
}
__kernel void fn_G(__global float* A, __constant float* B, int C) {
  const int D = get_global_id(0);
  if (D >= C)
    return;
  for (int E = 0; E < ((1 + 3) + 1); E++)
    A[D + E * C] = B[E];
}

__kernel void fn_H(__global float* A, __global float* B, __global float* C, int D) {
  const int E = get_global_id(0);
  if (E >= D)
    return;

  float F = A[E + 0 * D];
  FLOAT3 G;
  G.x = A[E + (1 + 0) * D];
  G.y = A[E + (1 + 1) * D];
  G.z = A[E + (1 + 2) * D];

  float H = A[E + (1 + 3) * D];

  FLOAT3 I;
  fn_B(F, G, &I);
  float J = fn_C(I);

  float K = fn_D(F, H, J);
  float L = fn_E(F, K);

  C[E] = (float)(0.5f) / (sqrt(B[E]) * (sqrt(J) + L));
}

__kernel void fn_I(__global int* A, __global float* B, __global float* C, __constant float* D, __global float* E, __constant FLOAT3* F, __constant FLOAT3* G, __constant FLOAT3* H, __constant FLOAT3* I, int J) {
  const float K = (float)(0.2f);

  const int L = get_global_id(0);
  if (L >= J)
    return;
  int M, N;
  FLOAT3 O;
  float P;
  float Q;

  float R = C[L + 0 * J];
  FLOAT3 S;
  S.x = C[L + (1 + 0) * J];
  S.y = C[L + (1 + 1) * J];
  S.z = C[L + (1 + 2) * J];

  float T = C[L + (1 + 3) * J];

  FLOAT3 U;
  fn_B(R, S, &U);
  float V = fn_C(U);

  float W = sqrt(V);
  float X = fn_D(R, T, V);
  float Y = fn_E(R, X);
  FLOAT3 Z, AA, AB;
  FLOAT3 AC;
  fn_F(R, S, T, X, U, &Z, &AA, &AB, &AC);

  float AD = (float)(0.0f);
  FLOAT3 AE;
  AE.x = (float)(0.0f);
  AE.y = (float)(0.0f);
  AE.z = (float)(0.0f);
  float AF = (float)(0.0f);

  FLOAT3 AG;
  float AH, AI;
  FLOAT3 AJ;
  FLOAT3 AK, AL, AM;
  FLOAT3 AN;
  float AO, AP, AQ;

  for (M = 0; M < 4; M++) {
    N = A[L + M * J];
    O.x = B[L + (M + 0 * 4) * J];
    O.y = B[L + (M + 1 * 4) * J];
    O.z = B[L + (M + 2 * 4) * J];

    P = sqrt(O.x * O.x + O.y * O.y + O.z * O.z);

    if (N >= 0) {
      AH = C[N + 0 * J];
      AJ.x = C[N + (1 + 0) * J];
      AJ.y = C[N + (1 + 1) * J];
      AJ.z = C[N + (1 + 2) * J];
      AI = C[N + (1 + 3) * J];
      fn_B(AH, AJ, &AG);
      AO = fn_C(AG);
      AQ = fn_D(AH, AI, AO);
      AP = fn_E(AH, AQ);
      fn_F(AH, AJ, AI, AQ, AG, &AK, &AL, &AM, &AN);

      Q = -P * K * (float)(0.5f) * (W + sqrt(AO) + Y + AP);
      AD += Q * (R - AH);
      AF += Q * (T - AI);
      AE.x += Q * (S.x - AJ.x);
      AE.y += Q * (S.y - AJ.y);
      AE.z += Q * (S.z - AJ.z);

      Q = (float)(0.5f) * O.x;
      AD += Q * (AJ.x + S.x);
      AF += Q * (AN.x + AC.x);
      AE.x += Q * (AK.x + Z.x);
      AE.y += Q * (AL.x + AA.x);
      AE.z += Q * (AM.x + AB.x);

      Q = (float)(0.5f) * O.y;
      AD += Q * (AJ.y + S.y);
      AF += Q * (AN.y + AC.y);
      AE.x += Q * (AK.y + Z.y);
      AE.y += Q * (AL.y + AA.y);
      AE.z += Q * (AM.y + AB.y);

      Q = (float)(0.5f) * O.z;
      AD += Q * (AJ.z + S.z);
      AF += Q * (AN.z + AC.z);
      AE.x += Q * (AK.z + Z.z);
      AE.y += Q * (AL.z + AA.z);
      AE.z += Q * (AM.z + AB.z);
    } else if (N == -1) {
      AE.x += O.x * X;
      AE.y += O.y * X;
      AE.z += O.z * X;
    } else if (N == -2) {
      Q = (float)(0.5f) * O.x;
      AD += Q * (D[1 + 0] + S.x);
      AF += Q * (F[0].x + AC.x);
      AE.x += Q * (G[0].x + Z.x);
      AE.y += Q * (H[0].x + AA.x);
      AE.z += Q * (I[0].x + AB.x);

      Q = (float)(0.5f) * O.y;
      AD += Q * (D[1 + 1] + S.y);
      AF += Q * (F[0].y + AC.y);
      AE.x += Q * (G[0].y + Z.y);
      AE.y += Q * (H[0].y + AA.y);
      AE.z += Q * (I[0].y + AB.y);

      Q = (float)(0.5f) * O.z;
      AD += Q * (D[1 + 2] + S.z);
      AF += Q * (F[0].z + AC.z);
      AE.x += Q * (G[0].z + Z.z);
      AE.y += Q * (H[0].z + AA.z);
      AE.z += Q * (I[0].z + AB.z);
    }
  }

  E[L + 0 * J] = AD;
  E[L + (1 + 0) * J] = AE.x;
  E[L + (1 + 1) * J] = AE.y;
  E[L + (1 + 2) * J] = AE.z;
  E[L + (1 + 3) * J] = AF;
}

__kernel void fn_J(int A, int B, __global float* C, __global float* D, __global float* E, __global float* F) {
  const int G = get_global_id(0);
  if (G >= B)
    return;

  float H = E[G] / (float)(3 + 1 - A);

  D[G + 0 * B] = C[G + 0 * B] + H * F[G + 0 * B];
  D[G + (1 + 3) * B] = C[G + (1 + 3) * B] + H * F[G + (1 + 3) * B];
  D[G + (1 + 0) * B] = C[G + (1 + 0) * B] + H * F[G + (1 + 0) * B];
  D[G + (1 + 1) * B] = C[G + (1 + 1) * B] + H * F[G + (1 + 1) * B];
  D[G + (1 + 2) * B] = C[G + (1 + 2) * B] + H * F[G + (1 + 2) * B];
}