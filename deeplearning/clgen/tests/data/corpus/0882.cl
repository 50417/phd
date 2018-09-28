typedef struct {
  unsigned int matrix_a;
  unsigned int mask_b;
  unsigned int mask_c;
  unsigned int seed;
} mt_struct_stripped;
__kernel void fn_A(__global float* A, __global mt_struct_stripped* B, int C) {
  int D = get_global_id(0);

  int E, F, G, H;
  unsigned int I, J, K, L;
  unsigned int M[19], N, O, P;

  N = B[D].matrix_a;
  O = B[D].mask_b;
  P = B[D].mask_c;

  M[0] = B[D].seed;
  for (E = 1; E < 19; E++)
    M[E] = (1812433253U * (M[E - 1] ^ (M[E - 1] >> 30)) + E) & 0xFFFFFFFFU;

  E = 0;
  J = M[0];
  for (H = 0; H < C; H++) {
    F = E + 1;
    G = E + 9;
    if (F >= 19)
      F -= 19;
    if (G >= 19)
      G -= 19;
    I = J;
    J = M[F];
    K = M[G];

    L = (I & 0xFFFFFFFEU) | (J & 0x1U);
    L = K ^ (L >> 1) ^ ((L & 1) ? N : 0);

    M[E] = L;
    E = F;

    L ^= (L >> 12);
    L ^= (L << 7) & O;
    L ^= (L << 15) & P;
    L ^= (L >> 18);

    A[D + H * 4096] = ((float)L + 1.0f) / 4294967296.0f;
  }
}