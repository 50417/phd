struct Ray {
  float orgX, orgY, orgZ;
  float dirX, dirY, dirZ;
};
struct Sphere {
  float centerX, centerY, centerZ;
  float radius;
};
struct Plane {
  float pX, pY, pZ;
  float nX, nY, nZ;
};

struct Intersection {
  float t;
  float pX, pY, pZ;
  float nX, nY, nZ;
  int hit;
};

void fn_A(const struct Sphere* A, const struct Ray* B, struct Intersection* C) {
  const float D = B->orgX - A->centerX;
  const float E = B->orgY - A->centerY;
  const float F = B->orgZ - A->centerZ;
  const float G = D * B->dirX + E * B->dirY + F * B->dirZ;
  const float H = (D * D + E * E + F * F) - (A->radius * A->radius);
  const float I = G * G - H;

  if (I > 0.0f) {
    const float J = -G - sqrt(I);
    if ((J > 0.0f) && (J < C->t)) {
      C->t = J;
      C->hit = 1;

      const float K = B->orgX + B->dirX * J;
      const float L = B->orgY + B->dirY * J;
      const float M = B->orgZ + B->dirZ * J;
      float N = K - A->centerX;
      float O = L - A->centerY;
      float P = M - A->centerZ;

      const float Q = N * N + O * O + P * P;
      const float R = 1.0f / sqrt(Q);
      N = N * R;
      O = O * R;
      P = P * R;
      C->nX = N;
      C->nY = O;
      C->nZ = P;
      C->pX = K;
      C->pY = L;
      C->pZ = M;
    }
  }
}

void fn_B(const struct Plane* A, const struct Ray* B, struct Intersection* C) {
  const float D = 1.0f - (A->pX * A->nX + A->pY * A->nY + A->pZ * A->nZ);
  const float E = B->dirX * A->nX + B->dirY * A->nY + B->dirZ * A->nZ;

  if (__clc_fabs(E) < 1.0e-6f)
    return;

  const float F = (1.0f - (B->orgX * A->nX + B->orgY * A->nY + B->orgZ * A->nZ + D)) / E;

  if ((F > 0.0f) && (F < C->t)) {
    C->hit = 1;
    C->t = F;
    C->nX = A->nX;
    C->nY = A->nY;
    C->nZ = A->nZ;

    const float G = B->orgX + F * B->dirX;
    const float H = B->orgY + F * B->dirY;
    const float I = B->orgZ + F * B->dirZ;
    C->pX = G;
    C->pY = H;
    C->pZ = I;
  }
}

void fn_C(const struct Ray* A, struct Intersection* B) {
  struct Sphere C[3];
  C[0].centerX = -2.0f;
  C[0].centerY = 0.0f;
  C[0].centerZ = -3.5f;
  C[0].radius = 0.5f;
  C[1].centerX = -0.5f;
  C[1].centerY = 0.0f;
  C[1].centerZ = -3.0f;
  C[1].radius = 0.5f;
  C[2].centerX = 1.0f;
  C[2].centerY = 0.0f;
  C[2].centerZ = -2.2f;
  C[2].radius = 0.5f;
  struct Plane D;
  D.pX = 0.0f;
  D.pY = -0.5f;
  D.pZ = 0.0f;
  D.nX = 0.0f;
  D.nY = 1.0f;
  D.nZ = 0.0f;

  fn_A(&C[0], A, B);
  fn_A(&C[1], A, B);
  fn_A(&C[2], A, B);
  fn_B(&D, A, B);
}

void fn_D(float A[3], float B[3], float C[3], const float D, const float E, const float F) {
  A[2] = D;
  B[2] = E;
  C[2] = F;
  A[1] = 0.0f;
  B[1] = 0.0f;
  C[1] = 0.0f;

  if ((D < 0.6f) && (D > -0.6f))
    A[1] = 1.0f;
  else if ((E < 0.6f) && (E > -0.6f))
    B[1] = 1.0f;
  else if ((F < 0.6f) && (F > -0.6f))
    C[1] = 1.0f;
  else
    A[1] = 1.0f;

  A[0] = B[1] * C[2] - C[1] * B[2];
  B[0] = C[1] * A[2] - A[1] * C[2];
  C[0] = A[1] * B[2] - B[1] * A[2];

  const float G = A[0] * A[0] + B[0] * B[0] + C[0] * C[0];
  const float H = 1.0f / sqrt(G);
  A[0] = A[0] * H;
  B[0] = B[0] * H;
  C[0] = C[0] * H;

  A[1] = B[2] * C[0] - C[2] * B[0];
  B[1] = C[2] * A[0] - A[2] * C[0];
  C[1] = A[2] * B[0] - B[2] * A[0];

  const float I = A[1] * A[1] + B[1] * B[1] + C[1] * C[1];
  const float J = 1.0f / sqrt(I);
  A[1] = A[1] * J;
  B[1] = B[1] * J;
  C[1] = C[1] * J;
}

float fn_E(struct Intersection* A, float* B) {
  int C, D;
  const int E = 16;
  const int F = 16;
  float G = 0.0001f;

  float H = A->pX + G * A->nX;
  float I = A->pY + G * A->nY;
  float J = A->pZ + G * A->nZ;

  float K[3], L[3], M[3];
  fn_D(K, L, M, A->nX, A->nY, A->nZ);

  float N = 0.0f;

  for (D = 0; D < E; D++) {
    for (C = 0; C < F; C++) {
      *B = (int)(fmod((float)(*B) * 1364.0f + 626.0f, 509.0f));
      const float O = *B / 509.0f;
      *B = (int)(fmod((float)(*B) * 1364.0f + 626.0f, 509.0f));
      const float P = *B / 509.0f * 2.0f * 3.141592f;

      const float Q = cos(P) * sqrt(1.0f - O);
      const float R = sin(P) * sqrt(1.0f - O);
      const float S = sqrt(O);

      const float T = Q * K[0] + R * K[1] + S * K[2];
      const float U = Q * L[0] + R * L[1] + S * L[2];
      const float V = Q * M[0] + R * M[1] + S * M[2];

      struct Ray W;
      W.orgX = H;
      W.orgY = I;
      W.orgZ = J;
      W.dirX = T;
      W.dirY = U;
      W.dirZ = V;

      struct Intersection X;
      X.hit = 0;
      X.t = 1.0e+30f;
      X.nX = X.pX = 0.0f;
      X.nY = X.pY = 0.0f;
      X.nZ = X.pZ = 0.0f;
      fn_C(&W, &X);
      if (X.hit != 0)
        N += 1.0f;
    }
  }

  N = ((float)(E * F) - N) / (float)(E * F);
  return N;
}

__kernel void fn_F(__global uint* A, uint B, uint C) {
  const float D = B / 2.0f;
  const float E = C / 2.0f;

  struct Intersection F;
  F.hit = 0;
  F.t = 1.0e+30f;
  F.nX = F.pX = 0;
  F.nY = F.pY = 0;
  F.nZ = F.pZ = 0;

  const float G = ((float)(int)(get_global_id(0)) - D) / D;
  const float H = ((float)(int)(get_global_id(1)) - E) / E;

  const float I = G * G + H * H + 1.0f;
  const float J = 1.0f / sqrt(I);
  const float K = G * J;
  const float L = H * J;
  const float M = -1.0f * J;
  struct Ray N;
  N.orgX = 0;
  N.orgY = 0;
  N.orgZ = 0;
  N.dirX = K;
  N.dirY = L;
  N.dirZ = M;
  int O = (int)(fmod((K + D) * (L + E) * 4525434.0f, 65536.0f));

  int P = 0;
  fn_C(&N, &F);
  if (F.hit != 0) {
    float Q = O;
    P = (int)(fn_E(&F, &Q) * 255);
    O = Q;
  }

  A[get_global_id(0) + get_global_id(1) * get_global_size(0)] = (int)(P | (P << 8) | (P << 16) | (255 << 24));
}