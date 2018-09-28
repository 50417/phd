uint fn_A(local uint* A); uint fn_B(local const uint* A, local const uint* B, local uint* C, local uint* D); uint fn_C(local const uint* A, local uint* B); uint fn_A(local uint* A) {
  const uint B = get_local_id(0);
  if (B < 64)
    A[B] += A[B + 64];
  barrier(1);
  if (B < 32)
    A[B] += A[B + 32];
  barrier(1);
  if (B < 16)
    A[B] += A[B + 16];
  barrier(1);
  if (B < 8)
    A[B] += A[B + 8];
  barrier(1);
  if (B < 4)
    A[B] += A[B + 4];
  barrier(1);
  if (B < 2)
    A[B] += A[B + 2];
  barrier(1);
  if (B < 1)
    A[B] += A[B + 1];
  barrier(1);
  return A[0];
}

kernel void fn_D(global uint* restrict A, global uint* restrict B, global uint* restrict C, local uint* restrict D) {
  const uint E = A[0];
  const uint F = get_local_id(0);
  const uint G = get_group_id(0);
  const uint H = get_num_groups(0);
  const uint I = get_local_size(0);
  const uint J = E / H + ((E % H) ? 1 : 0);
  const uint K = (E < (G + 1) * J) ? E : ((G + 1) * J);
  D[F] = 0;
  for (uint L = G * J; L < (G + 1) * J; L += I) {
    if ((L + F) < K && C[L + F])
      D[F]++;
  }
  barrier(1);
  uint M = fn_A(D);
  if (F == 0)
    B[G] = M;
  return;
}

uint fn_C(local const uint* A, local uint* B) {
  const uint C = get_local_id(0);
  int D = 1;
  int E = 0;

  B[D * 128 + C] = (C > 0) ? A[C - 1] : 0;
  barrier(1);
  for (uint F = 1; F < 128; F *= 2) {
    D = 1 - D;
    E = 1 - D;
    barrier(1);
    B[D * 128 + C] = B[E * 128 + C];
    if (C >= F)
      B[D * 128 + C] += B[E * 128 + C - F];
  }
  barrier(1);
  return B[128 - 1] + A[128 - 1];
}

uint fn_B(local const uint* A, local const uint* B, local uint* C, local uint* D) {
  uint E = get_local_id(0);
  uint F = fn_C(B, D);
  if (B[E])
    C[D[E]] = A[E];
  return F;
}

kernel void fn_E(global uint* A, global const uint* B, global uint* restrict C, global const uint* D, global const uint* restrict E, local uint* restrict F, local uint* restrict G, local uint* restrict H) {
  uint I = A[0];
  uint J = get_local_id(0);
  uint K = get_group_id(0);
  uint L = get_num_groups(0);
  uint M = get_local_size(0);
  local uint N[256];
  uint O = 0;

  for (uint P = 0; P < K; P += M) {
    if ((P + J) < K)
      G[J] = E[P + J];
    else
      G[J] = 0;
    barrier(1);

    O += fn_A(G);
    barrier(1);
  }
  const uint Q = I / L + ((I % L) ? 1 : 0);
  const uint R = (I < (K + 1) * Q) ? I : ((K + 1) * Q);
  for (uint P = K * Q; P < (K + 1) * Q; P += M) {
    if ((P + J) < R) {
      G[J] = (D[P + J] != 0);
      F[J] = B[P + J];
    } else {
      G[J] = 0;
    }
    barrier(1);
    uint S = fn_B(F, G, H, N);
    barrier(1);
    if (J < S)
      C[O + J] = H[J];
    O += S;
  }
  if (K == (L - 1) && J == 0)
    A[1] = O;
}