__kernel void fn_A(__global uint* A, __global uint* B, __global uint* C, __global uint* D, uint E, __global uint* F, __global uint* G, uint H) {
  int I = get_global_id(0);
  int J = get_local_id(0);
  int K = get_num_groups(0);
  int L = get_group_id(0);

  __local uint M[256];
  __local uint N[256];

  M[J] = 0xFFFFFFFF;
  N[J] = 0xFFFFFFFF;
  if (I < H) {
    M[J] = A[I];
    N[J] = C[I];
  }
  barrier(1);

  __local uint O[256];
  for (uint P = E; P < (E + 4); P++) {
    uint Q = M[J];
    uint R = N[J];
    uint S = !((Q >> P) & 0x1);
    O[J] = S;
    barrier(1);
    if (J == 256 - 1) {
      for (int T = 1; T < 256; T++) {
        O[T] += O[T - 1];
      }
    }
    barrier(1);
    uint U = S ? O[J] - 1 : O[256 - 1] - O[J] + J;
    M[U] = Q;
    N[U] = R;
    barrier(1);
  }

  if (I < H) {
    B[I] = M[J];
    D[I] = N[J];
  }
  barrier(1);

  __local uint V[(1 << 4)];
  if (J < (1 << 4)) {
    V[J] = 0;
  }
  M[J] = (M[J] >> E) & 0xF;
  barrier(1);

  if (J > 0 && M[J] != M[J - 1]) {
    V[M[J]] = J;
  }
  barrier(1);

  if (J < (1 << 4)) {
    G[L * (1 << 4) + J] = V[J];
  }
  barrier(1);

  if (J > 0 && M[J] != M[J - 1]) {
    V[M[J - 1]] = J - V[M[J - 1]];
  }
  barrier(1);

  if (J == 256 - 1) {
    V[M[256 - 1]] = 256 - V[M[256 - 1]];
  }
  barrier(1);

  if (J < (1 << 4)) {
    F[J * K + L] = V[J];
  }
}

__kernel void fn_B(__global uint4* A, __global uint* B, uint C) {
  int D = get_global_id(0);
  int E = get_local_id(0);
  int F = get_group_id(0);

  uint4 G = 0;
  if (D < C) {
    G = A[D];
  }

  __local uint H[256];

  uint4 I;
  I.x = G.x;
  I.y = I.x + G.y;
  I.z = I.y + G.z;
  I.w = I.z + G.w;
  H[E] = I.w;
  barrier(1);

  if (E == 256 - 1) {
    for (int J = 1; J < 256; J++) {
      H[J] += H[J - 1];
    }
  }
  barrier(1);

  uint K = H[E] - I.w;
  if (D < C) {
    uint4 L;
    L.x = K;
    L.y = K + I.x;
    L.z = K + I.y;
    L.w = K + I.z;
    A[D] = L;
  }
  barrier(1);

  if (E == 256 - 1) {
    B[F] = K + I.w;
  }
}

__kernel void fn_C(__global uint4* A, __global uint* B, uint C) {
  int D = get_global_id(0);
  int E = get_local_id(0);
  int F = get_group_id(0);

  __local uint G[256];

  G[E] = B[E];
  barrier(1);

  if (E == 256 - 1) {
    for (int H = 1; H < 256; H++) {
      G[H] += G[H - 1];
    }
  }
  barrier(1);

  if (F > 0 && D < C) {
    A[D] = A[D] + G[F - 1];
  }
}

__kernel void fn_D(__global uint* A, __global uint* B, __global uint* C, __global uint* D, __global uint* E, __global uint* F, uint G, uint H) {
  int I = get_global_id(0);
  int J = get_local_id(0);
  int K = get_group_id(0);
  int L = get_num_groups(0);

  __local uint M[(1 << 4)];
  __local uint N[(1 << 4)];

  if (J < (1 << 4)) {
    N[J] = E[J * L + K];
    M[J] = F[K * (1 << 4) + J];
  }
  barrier(1);

  if (I >= H) {
    return;
  }

  uint O = A[I];
  uint P = C[I];
  uint Q = (O >> G) & 0xF;
  uint R = N[Q] + J - M[Q];

  B[R] = O;
  D[R] = P;
}