uint fn_A(uint A, volatile __local uint* B, int C) {
  int D = get_local_id(0);
  int E = 2 * D - (D & (32 - 1));
  B[E] = 0;
  E += 32;
  B[E] = A;

  if (0 <= C) {
    B[E] += B[E - 1];
  }
  if (1 <= C) {
    B[E] += B[E - 2];
  }
  if (2 <= C) {
    B[E] += B[E - 4];
  }
  if (3 <= C) {
    B[E] += B[E - 8];
  }
  if (4 <= C) {
    B[E] += B[E - 16];
  }

  return B[E] - A;
}

uint4 fn_B(uint4 A, __local uint* B) {
  uint C = get_local_id(0);

  uint4 D = A;
  uint E[3];
  E[0] = D.x;
  E[1] = D.y + E[0];
  E[2] = D.z + E[1];

  uint F = D.w + E[2];

  F = fn_A(F, B, 4);
  barrier(1);

  if ((C & (32 - 1)) == 32 - 1) {
    B[C >> 5] = F + D.w + E[2];
  }
  barrier(1);

  if (C < 32)
    B[C] = fn_A(B[C], B, 2);

  barrier(1);

  F += B[C >> 5];

  D.x = F;
  D.y = F + E[0];
  D.z = F + E[1];
  D.w = F + E[2];

  return D;
}

uint4 fn_C(uint4 A, __local uint* B, __local uint* C) {
  int D = get_local_id(0);
  int E = get_local_size(0);

  uint4 F = fn_B(A, B);

  if (D == E - 1) {
    C[0] = F.w + A.w;
  }
  barrier(1);

  uint4 G;
  int H = D * 4;
  G.x = (A.x) ? F.x : C[0] + H - F.x;
  G.y = (A.y) ? F.y : C[0] + H + 1 - F.y;
  G.z = (A.z) ? F.z : C[0] + H + 2 - F.z;
  G.w = (A.w) ? F.w : C[0] + H + 3 - F.w;

  return G;
}

void fn_D(uint4* A, uint B, uint C, __local uint* D, __local uint* E) {
  int F = get_local_id(0);
  int G = get_local_size(0);

  for (uint H = C; H < (C + B); ++H) {
    uint4 I;
    I.x = !(((*A).x >> H) & 0x1);
    I.y = !(((*A).y >> H) & 0x1);
    I.z = !(((*A).z >> H) & 0x1);
    I.w = !(((*A).w >> H) & 0x1);

    uint4 J;

    J = fn_C(I, D, E);

    D[(J.x & 3) * G + (J.x >> 2)] = (*A).x;
    D[(J.y & 3) * G + (J.y >> 2)] = (*A).y;
    D[(J.z & 3) * G + (J.z >> 2)] = (*A).z;
    D[(J.w & 3) * G + (J.w >> 2)] = (*A).w;
    barrier(1);

    (*A).x = D[F];
    (*A).y = D[F + G];
    (*A).z = D[F + 2 * G];
    (*A).w = D[F + 3 * G];

    barrier(1);
  }
}

__kernel void fn_E(__global uint4* A, __global uint4* B, uint C, uint D, uint E, uint F, __local uint* G) {
  int H = get_global_id(0);
  __local uint I[1];

  uint4 J;
  J = A[H];

  barrier(1);

  fn_D(&J, C, D, G, I);

  B[H] = J;
}
__kernel void fn_F(__global uint2* A, __global uint* B, __global uint* C, uint D, uint E, uint F, __local uint* G) {
  __local uint H[16];

  uint I = get_group_id(0);
  uint J = get_local_id(0);
  uint K = get_local_size(0);

  uint2 L;

  L = A[get_global_id(0)];

  G[2 * J] = (L.x >> D) & 0xF;
  G[2 * J + 1] = (L.y >> D) & 0xF;

  if (J < 16) {
    H[J] = 0;
  }
  barrier(1);

  if ((J > 0) && (G[J] != G[J - 1])) {
    H[G[J]] = J;
  }
  if (G[J + K] != G[J + K - 1]) {
    H[G[J + K]] = J + K;
  }
  barrier(1);

  if (J < 16) {
    C[I * 16 + J] = H[J];
  }
  barrier(1);

  if ((J > 0) && (G[J] != G[J - 1])) {
    H[G[J - 1]] = J - H[G[J - 1]];
  }
  if (G[J + K] != G[J + K - 1]) {
    H[G[J + K - 1]] = J + K - H[G[J + K - 1]];
  }

  if (J == K - 1) {
    H[G[2 * K - 1]] = 2 * K - H[G[2 * K - 1]];
  }
  barrier(1);

  if (J < 16) {
    B[J * F + I] = H[J];
  }
}

__kernel void fn_G(__global uint* A, __global uint* B, uint C, __local uint* D) {
  int E = get_local_id(0);

  int F = 0;
  int G = 1;

  D[F * C + E] = (E > 0) ? B[E - 1] : 0;

  for (int H = 1; H < C; H *= 2) {
    F = 1 - F;
    G = 1 - F;
    barrier(1);

    D[F * C + E] = D[G * C + E];

    if (E >= H)
      D[F * C + E] += D[G * C + E - H];
  }

  barrier(1);

  A[E] = D[F * C + E];
}
__kernel void fn_H(__global uint* A, __global uint2* B, __global uint* C, __global uint* D, __global uint* E, uint F, uint G, uint H, __local uint2* I) {
  __local uint J[16];
  __local uint K[16];

  __local uint* L = (__local uint*)I;

  uint M = get_group_id(0);

  uint N = get_global_id(0);
  uint O = get_local_id(0);
  uint P = get_local_size(0);

  I[O] = B[N];

  if (O < 16) {
    J[O] = D[O * H + M];
    K[O] = C[M * 16 + O];
  }
  barrier(1);

  uint Q = (L[O] >> F) & 0xF;
  uint R = J[Q] + O - K[Q];

  if (R < G) {
    A[R] = L[O];
  }

  Q = (L[O + P] >> F) & 0xF;
  R = J[Q] + O + P - K[Q];

  if (R < G) {
    A[R] = L[O + P];
  }
}