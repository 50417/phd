typedef struct quat { float x, y, z, w; } quat;

typedef struct vec { float x, y, z; } vec;

typedef struct vec4 { float x, y, z, w; } vec4;

typedef struct mat4 { float m[16]; } mat4;

bool fn_A(mat4* A, const mat4* B) {
  mat4 C;
  float D;
  int E;

  C.m[0] = B->m[5] * B->m[10] * B->m[15] - B->m[5] * B->m[11] * B->m[14] - B->m[9] * B->m[6] * B->m[15] + B->m[9] * B->m[7] * B->m[14] + B->m[13] * B->m[6] * B->m[11] - B->m[13] * B->m[7] * B->m[10];

  C.m[4] = -B->m[4] * B->m[10] * B->m[15] + B->m[4] * B->m[11] * B->m[14] + B->m[8] * B->m[6] * B->m[15] - B->m[8] * B->m[7] * B->m[14] - B->m[12] * B->m[6] * B->m[11] + B->m[12] * B->m[7] * B->m[10];

  C.m[8] = B->m[4] * B->m[9] * B->m[15] - B->m[4] * B->m[11] * B->m[13] - B->m[8] * B->m[5] * B->m[15] + B->m[8] * B->m[7] * B->m[13] + B->m[12] * B->m[5] * B->m[11] - B->m[12] * B->m[7] * B->m[9];

  C.m[12] = -B->m[4] * B->m[9] * B->m[14] + B->m[4] * B->m[10] * B->m[13] + B->m[8] * B->m[5] * B->m[14] - B->m[8] * B->m[6] * B->m[13] - B->m[12] * B->m[5] * B->m[10] + B->m[12] * B->m[6] * B->m[9];

  C.m[1] = -B->m[1] * B->m[10] * B->m[15] + B->m[1] * B->m[11] * B->m[14] + B->m[9] * B->m[2] * B->m[15] - B->m[9] * B->m[3] * B->m[14] - B->m[13] * B->m[2] * B->m[11] + B->m[13] * B->m[3] * B->m[10];

  C.m[5] = B->m[0] * B->m[10] * B->m[15] - B->m[0] * B->m[11] * B->m[14] - B->m[8] * B->m[2] * B->m[15] + B->m[8] * B->m[3] * B->m[14] + B->m[12] * B->m[2] * B->m[11] - B->m[12] * B->m[3] * B->m[10];

  C.m[9] = -B->m[0] * B->m[9] * B->m[15] + B->m[0] * B->m[11] * B->m[13] + B->m[8] * B->m[1] * B->m[15] - B->m[8] * B->m[3] * B->m[13] - B->m[12] * B->m[1] * B->m[11] + B->m[12] * B->m[3] * B->m[9];

  C.m[13] = B->m[0] * B->m[9] * B->m[14] - B->m[0] * B->m[10] * B->m[13] - B->m[8] * B->m[1] * B->m[14] + B->m[8] * B->m[2] * B->m[13] + B->m[12] * B->m[1] * B->m[10] - B->m[12] * B->m[2] * B->m[9];

  C.m[2] = B->m[1] * B->m[6] * B->m[15] - B->m[1] * B->m[7] * B->m[14] - B->m[5] * B->m[2] * B->m[15] + B->m[5] * B->m[3] * B->m[14] + B->m[13] * B->m[2] * B->m[7] - B->m[13] * B->m[3] * B->m[6];

  C.m[6] = -B->m[0] * B->m[6] * B->m[15] + B->m[0] * B->m[7] * B->m[14] + B->m[4] * B->m[2] * B->m[15] - B->m[4] * B->m[3] * B->m[14] - B->m[12] * B->m[2] * B->m[7] + B->m[12] * B->m[3] * B->m[6];

  C.m[10] = B->m[0] * B->m[5] * B->m[15] - B->m[0] * B->m[7] * B->m[13] - B->m[4] * B->m[1] * B->m[15] + B->m[4] * B->m[3] * B->m[13] + B->m[12] * B->m[1] * B->m[7] - B->m[12] * B->m[3] * B->m[5];

  C.m[14] = -B->m[0] * B->m[5] * B->m[14] + B->m[0] * B->m[6] * B->m[13] + B->m[4] * B->m[1] * B->m[14] - B->m[4] * B->m[2] * B->m[13] - B->m[12] * B->m[1] * B->m[6] + B->m[12] * B->m[2] * B->m[5];

  C.m[3] = -B->m[1] * B->m[6] * B->m[11] + B->m[1] * B->m[7] * B->m[10] + B->m[5] * B->m[2] * B->m[11] - B->m[5] * B->m[3] * B->m[10] - B->m[9] * B->m[2] * B->m[7] + B->m[9] * B->m[3] * B->m[6];

  C.m[7] = B->m[0] * B->m[6] * B->m[11] - B->m[0] * B->m[7] * B->m[10] - B->m[4] * B->m[2] * B->m[11] + B->m[4] * B->m[3] * B->m[10] + B->m[8] * B->m[2] * B->m[7] - B->m[8] * B->m[3] * B->m[6];

  C.m[11] = -B->m[0] * B->m[5] * B->m[11] + B->m[0] * B->m[7] * B->m[9] + B->m[4] * B->m[1] * B->m[11] - B->m[4] * B->m[3] * B->m[9] - B->m[8] * B->m[1] * B->m[7] + B->m[8] * B->m[3] * B->m[5];

  C.m[15] = B->m[0] * B->m[5] * B->m[10] - B->m[0] * B->m[6] * B->m[9] - B->m[4] * B->m[1] * B->m[10] + B->m[4] * B->m[2] * B->m[9] + B->m[8] * B->m[1] * B->m[6] - B->m[8] * B->m[2] * B->m[5];

  D = B->m[0] * C.m[0] + B->m[1] * C.m[4] + B->m[2] * C.m[8] + B->m[3] * C.m[12];

  if (D == 0) {
    return false;
  }

  D = 1.0 / D;

  for (E = 0; E < 16; E++) {
    A->m[E] = C.m[E] * D;
  }

  return true;
}

vec* fn_B(vec* A, const vec* B, const mat4* C) {
  vec4 D;

  D.x = B->x * C->m[0] + B->y * C->m[4] + B->z * C->m[8] + C->m[12];
  D.y = B->x * C->m[1] + B->y * C->m[5] + B->z * C->m[9] + C->m[13];
  D.z = B->x * C->m[2] + B->y * C->m[6] + B->z * C->m[10] + C->m[14];
  D.w = B->x * C->m[3] + B->y * C->m[7] + B->z * C->m[11] + C->m[15];

  A->x = D.x / D.w;
  A->y = D.y / D.w;
  A->z = D.z / D.w;

  return A;
}

mat4* fn_C(mat4* A, const mat4* B, const mat4* C) {
  float D[16];

  const float *E = B->m, *F = C->m;

  A->m[0] = E[0] * F[0] + E[4] * F[1] + E[8] * F[2] + E[12] * F[3];
  A->m[1] = E[1] * F[0] + E[5] * F[1] + E[9] * F[2] + E[13] * F[3];
  A->m[2] = E[2] * F[0] + E[6] * F[1] + E[10] * F[2] + E[14] * F[3];
  A->m[3] = E[3] * F[0] + E[7] * F[1] + E[11] * F[2] + E[15] * F[3];

  A->m[4] = E[0] * F[4] + E[4] * F[5] + E[8] * F[6] + E[12] * F[7];
  A->m[5] = E[1] * F[4] + E[5] * F[5] + E[9] * F[6] + E[13] * F[7];
  A->m[6] = E[2] * F[4] + E[6] * F[5] + E[10] * F[6] + E[14] * F[7];
  A->m[7] = E[3] * F[4] + E[7] * F[5] + E[11] * F[6] + E[15] * F[7];

  A->m[8] = E[0] * F[8] + E[4] * F[9] + E[8] * F[10] + E[12] * F[11];
  A->m[9] = E[1] * F[8] + E[5] * F[9] + E[9] * F[10] + E[13] * F[11];
  A->m[10] = E[2] * F[8] + E[6] * F[9] + E[10] * F[10] + E[14] * F[11];
  A->m[11] = E[3] * F[8] + E[7] * F[9] + E[11] * F[10] + E[15] * F[11];

  A->m[12] = E[0] * F[12] + E[4] * F[13] + E[8] * F[14] + E[12] * F[15];
  A->m[13] = E[1] * F[12] + E[5] * F[13] + E[9] * F[14] + E[13] * F[15];
  A->m[14] = E[2] * F[12] + E[6] * F[13] + E[10] * F[14] + E[14] * F[15];
  A->m[15] = E[3] * F[12] + E[7] * F[13] + E[11] * F[14] + E[15] * F[15];

  return A;
}

void fn_D(mat4* A, vec* B) {
  A->m[12] += B->x;
  A->m[13] += B->y;
  A->m[14] += B->z;
}

void fn_E(mat4* A, quat* B) {
  float C = B->x * B->x;
  float D = B->x * B->y;
  float E = B->x * B->z;
  float F = B->x * B->w;

  float G = B->y * B->y;
  float H = B->y * B->z;
  float I = B->y * B->w;

  float J = B->z * B->z;
  float K = B->z * B->w;

  A->m[0] = 1 - 2 * (G + J);
  A->m[1] = 2 * (D + K);
  A->m[2] = 2 * (E - I);
  A->m[3] = 0;

  A->m[4] = 2 * (D - K);
  A->m[5] = 1 - 2 * (C + J);
  A->m[6] = 2 * (H + F);
  A->m[7] = 0.0;

  A->m[8] = 2 * (E + I);
  A->m[9] = 2 * (H - F);
  A->m[10] = 1 - 2 * (C + G);
  A->m[11] = 0.0;

  A->m[15] = 1.0;
}

__kernel void fn_F(global float* A, global float* B, global float* C, global float* D) {
  size_t E = get_global_id(0);

  mat4 F;
  mat4 G;
  for (int H = E * 16, I = 0; H < (E + 1) * 16; H++, I++) {
    F.m[I] = C[H];
    G.m[I] = D[I];
  }

  quat J;
  J.x = A[E * 4];
  J.y = A[E * 4 + 1];
  J.z = A[E * 4 + 2];
  J.w = A[E * 4 + 3];

  vec K;
  K.x = F.m[12];
  K.y = F.m[13];
  K.z = F.m[14];

  mat4 L;
  fn_C(&L, &G, &F);

  L.m[12] -= (2.5 * L.m[15]) * step(1.1f, L.m[12] / L.m[15]);
  L.m[13] += (2.5 * L.m[15]) * step(L.m[13] / L.m[15], -1.1f);
  L.m[14] += (1.5 * L.m[15]) * step(1.1f, L.m[14] / L.m[15]);

  mat4 M;
  fn_A(&M, &G);
  fn_C(&F, &M, &L);

  vec N;
  N.x = B[E * 3];
  N.y = B[E * 3 + 1];
  N.z = B[E * 3 + 2];

  mat4 O;

  fn_E(&O, &J);
  fn_C(&F, &F, &O);
  fn_D(&F, &N);

  for (int H = E * 16, I = 0; H < (E + 1) * 16; H++, I++) {
    C[H] = F.m[I];
  }
}