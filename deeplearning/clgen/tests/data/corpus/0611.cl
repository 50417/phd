__kernel void fn_A(__global double* A, int B, int C, __global double* D, int E, int F) {
  __local double G[32][32 + 1];

  int H = get_local_id(0);
  int I = get_local_id(1);
  int J = get_group_id(0) * 32;
  int K = get_group_id(1) * 32;

  D += E;
  A += B;

  D += J + H + ((K + I) * (F));
  A += K + H + ((J + I) * (C));

  G[I + 0][H] = D[0 * F];
  G[I + 8][H] = D[8 * F];
  G[I + 16][H] = D[16 * F];
  G[I + 24][H] = D[24 * F];

  barrier(1);

  A[0 * C] = G[H][I + 0];
  A[8 * C] = G[H][I + 8];
  A[16 * C] = G[H][I + 16];
  A[24 * C] = G[H][I + 24];
}