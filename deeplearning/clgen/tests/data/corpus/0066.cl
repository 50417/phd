typedef struct {
  unsigned long H[8];
  unsigned int buffer[32];
  unsigned int buflen;
} sha512_ctx;

typedef struct {
  unsigned long target;
  char v[72 + 1];
} sha512_key;

__constant unsigned long gb_A[] = {
    0x428a2f98d728ae22UL, 0x7137449123ef65cdUL, 0xb5c0fbcfec4d3b2fUL, 0xe9b5dba58189dbbcUL, 0x3956c25bf348b538UL, 0x59f111f1b605d019UL, 0x923f82a4af194f9bUL, 0xab1c5ed5da6d8118UL, 0xd807aa98a3030242UL, 0x12835b0145706fbeUL, 0x243185be4ee4b28cUL, 0x550c7dc3d5ffb4e2UL, 0x72be5d74f27b896fUL, 0x80deb1fe3b1696b1UL, 0x9bdc06a725c71235UL, 0xc19bf174cf692694UL, 0xe49b69c19ef14ad2UL, 0xefbe4786384f25e3UL, 0x0fc19dc68b8cd5b5UL, 0x240ca1cc77ac9c65UL,
    0x2de92c6f592b0275UL, 0x4a7484aa6ea6e483UL, 0x5cb0a9dcbd41fbd4UL, 0x76f988da831153b5UL, 0x983e5152ee66dfabUL, 0xa831c66d2db43210UL, 0xb00327c898fb213fUL, 0xbf597fc7beef0ee4UL, 0xc6e00bf33da88fc2UL, 0xd5a79147930aa725UL, 0x06ca6351e003826fUL, 0x142929670a0e6e70UL, 0x27b70a8546d22ffcUL, 0x2e1b21385c26c926UL, 0x4d2c6dfc5ac42aedUL, 0x53380d139d95b3dfUL, 0x650a73548baf63deUL, 0x766a0abb3c77b2a8UL, 0x81c2c92e47edaee6UL, 0x92722c851482353bUL,
    0xa2bfe8a14cf10364UL, 0xa81a664bbc423001UL, 0xc24b8b70d0f89791UL, 0xc76c51a30654be30UL, 0xd192e819d6ef5218UL, 0xd69906245565a910UL, 0xf40e35855771202aUL, 0x106aa07032bbd1b8UL, 0x19a4c116b8d2d0c8UL, 0x1e376c085141ab53UL, 0x2748774cdf8eeb99UL, 0x34b0bcb5e19b48a8UL, 0x391c0cb3c5c95a63UL, 0x4ed8aa4ae3418acbUL, 0x5b9cca4f7763e373UL, 0x682e6ff3d6b2b8a3UL, 0x748f82ee5defb2fcUL, 0x78a5636f43172f60UL, 0x84c87814a1f0ab72UL, 0x8cc702081a6439ecUL,
    0x90befffa23631e28UL, 0xa4506cebde82bde9UL, 0xbef9a3f7b2c67915UL, 0xc67178f2e372532bUL, 0xca273eceea26619cUL, 0xd186b8c721c0c207UL, 0xeada7dd6cde0eb1eUL, 0xf57d4f7fee6ed178UL, 0x06f067aa72176fbaUL, 0x0a637dc5a2c898a6UL, 0x113f9804bef90daeUL, 0x1b710b35131c471bUL, 0x28db77f523047d84UL, 0x32caab7b40c72493UL, 0x3c9ebe0a15c9bebcUL, 0x431d67c49c100d4cUL, 0x4cc5d4becb3e42b6UL, 0x597f299cfc657e2aUL, 0x5fcb6fab3ad6faecUL, 0x6c44198c4a475817UL,
};

void fn_A(sha512_ctx* A, const char* B, unsigned char C) {
  unsigned int* D = A->buffer;

  for (unsigned int E = 0; E < C; E++) {
    (D)[(E) >> 2] = ((D)[(E) >> 2] & ~(0xffU << (((E)&3) << 3))) + ((B[E]) << (((E)&3) << 3));
  }
  A->buflen = C;

  unsigned int F = A->buflen;
  (D)[(F) >> 2] = ((D)[(F) >> 2] & ~(0xffU << (((F)&3) << 3))) + ((0x80) << (((F)&3) << 3));
  while ((++F & 3) != 0) {
    (D)[(F) >> 2] = ((D)[(F) >> 2] & ~(0xffU << (((F)&3) << 3))) + ((0) << (((F)&3) << 3));
  }

  unsigned int* G = D + (F >> 2);
  for (unsigned int E = F; E < 128; E += 4) {
    *G++ = 0;
  }

  unsigned long* H = (unsigned long*)A->buffer;
  H[15] = __builtin_astype(__builtin_astype(((unsigned long)A->buflen) * 8, uchar8).s76543210, ulong);
}

inline unsigned long fn_B(char* A) {
  __private sha512_ctx B;
  fn_A(&B, A, 72);

  int C;

  unsigned long D = 0x6a09e667f3bcc908UL;
  unsigned long E = 0xbb67ae8584caa73bUL;
  unsigned long F = 0x3c6ef372fe94f82bUL;
  unsigned long G = 0xa54ff53a5f1d36f1UL;
  unsigned long H = 0x510e527fade682d1UL;
  unsigned long I = 0x9b05688c2b3e6c1fUL;
  unsigned long J = 0x1f83d9abfb41bd6bUL;
  unsigned long K = 0x5be0cd19137e2179UL;

  __private unsigned long L[16];

  unsigned long* M = (unsigned long*)B.buffer;

  for (C = 0; C < 16; C++)
    L[C] = __builtin_astype(__builtin_astype(M[C], uchar8).s76543210, ulong);

  unsigned long N, O;
  for (C = 0; C < 16; C++) {
    N = gb_A[C] + L[C] + K + ((((H >> 14) | (H << (64 - 14)))) ^ (((H >> 18) | (H << (64 - 18)))) ^ (((H >> 41) | (H << (64 - 41))))) + ((H & I) ^ ((~H) & J));
    O = ((D & E) ^ (D & F) ^ (E & F)) + ((((D >> 28) | (D << (64 - 28)))) ^ (((D >> 34) | (D << (64 - 34)))) ^ (((D >> 39) | (D << (64 - 39)))));

    K = J;
    J = I;
    I = H;
    H = G + N;
    G = F;
    F = E;
    E = D;
    D = N + O;
  }

  for (C = 16; C < 80; C++) {
    L[C & 15] = ((((L[(C - 2) & 15] >> 19) | (L[(C - 2) & 15] << (64 - 19)))) ^ (((L[(C - 2) & 15] >> 61) | (L[(C - 2) & 15] << (64 - 61)))) ^ (L[(C - 2) & 15] >> 6)) + ((((L[(C - 15) & 15] >> 1) | (L[(C - 15) & 15] << (64 - 1)))) ^ (((L[(C - 15) & 15] >> 8) | (L[(C - 15) & 15] << (64 - 8)))) ^ (L[(C - 15) & 15] >> 7)) + L[(C - 16) & 15] + L[(C - 7) & 15];
    N = gb_A[C] + L[C & 15] + K + ((((H >> 14) | (H << (64 - 14)))) ^ (((H >> 18) | (H << (64 - 18)))) ^ (((H >> 41) | (H << (64 - 41))))) + ((H & I) ^ ((~H) & J));
    O = ((D & E) ^ (D & F) ^ (E & F)) + ((((D >> 28) | (D << (64 - 28)))) ^ (((D >> 34) | (D << (64 - 34)))) ^ (((D >> 39) | (D << (64 - 39)))));

    K = J;
    J = I;
    I = H;
    H = G + N;
    G = F;
    F = E;
    E = D;
    D = N + O;
  }

  unsigned long P[8];

  P[0] = __builtin_astype(__builtin_astype(D + 0x6a09e667f3bcc908UL, uchar8).s76543210, ulong);
  P[1] = __builtin_astype(__builtin_astype(E + 0xbb67ae8584caa73bUL, uchar8).s76543210, ulong);
  P[2] = __builtin_astype(__builtin_astype(F + 0x3c6ef372fe94f82bUL, uchar8).s76543210, ulong);
  P[3] = __builtin_astype(__builtin_astype(G + 0xa54ff53a5f1d36f1UL, uchar8).s76543210, ulong);
  P[4] = __builtin_astype(__builtin_astype(H + 0x510e527fade682d1UL, uchar8).s76543210, ulong);
  P[5] = __builtin_astype(__builtin_astype(I + 0x9b05688c2b3e6c1fUL, uchar8).s76543210, ulong);
  P[6] = __builtin_astype(__builtin_astype(J + 0x1f83d9abfb41bd6bUL, uchar8).s76543210, ulong);
  P[7] = __builtin_astype(__builtin_astype(K + 0x5be0cd19137e2179UL, uchar8).s76543210, ulong);

  fn_A(&B, (char*)P, 64);

  D = 0x6a09e667f3bcc908UL;
  E = 0xbb67ae8584caa73bUL;
  F = 0x3c6ef372fe94f82bUL;
  G = 0xa54ff53a5f1d36f1UL;
  H = 0x510e527fade682d1UL;
  I = 0x9b05688c2b3e6c1fUL;
  J = 0x1f83d9abfb41bd6bUL;
  K = 0x5be0cd19137e2179UL;

  M = (unsigned long*)B.buffer;

  for (C = 0; C < 16; C++)
    L[C] = __builtin_astype(__builtin_astype(M[C], uchar8).s76543210, ulong);

  for (C = 0; C < 16; C++) {
    N = gb_A[C] + L[C] + K + ((((H >> 14) | (H << (64 - 14)))) ^ (((H >> 18) | (H << (64 - 18)))) ^ (((H >> 41) | (H << (64 - 41))))) + ((H & I) ^ ((~H) & J));
    O = ((D & E) ^ (D & F) ^ (E & F)) + ((((D >> 28) | (D << (64 - 28)))) ^ (((D >> 34) | (D << (64 - 34)))) ^ (((D >> 39) | (D << (64 - 39)))));

    K = J;
    J = I;
    I = H;
    H = G + N;
    G = F;
    F = E;
    E = D;
    D = N + O;
  }

  for (C = 16; C < 80; C++) {
    L[C & 15] = ((((L[(C - 2) & 15] >> 19) | (L[(C - 2) & 15] << (64 - 19)))) ^ (((L[(C - 2) & 15] >> 61) | (L[(C - 2) & 15] << (64 - 61)))) ^ (L[(C - 2) & 15] >> 6)) + ((((L[(C - 15) & 15] >> 1) | (L[(C - 15) & 15] << (64 - 1)))) ^ (((L[(C - 15) & 15] >> 8) | (L[(C - 15) & 15] << (64 - 8)))) ^ (L[(C - 15) & 15] >> 7)) + L[(C - 16) & 15] + L[(C - 7) & 15];
    N = gb_A[C] + L[C & 15] + K + ((((H >> 14) | (H << (64 - 14)))) ^ (((H >> 18) | (H << (64 - 18)))) ^ (((H >> 41) | (H << (64 - 41))))) + ((H & I) ^ ((~H) & J));
    O = ((D & E) ^ (D & F) ^ (E & F)) + ((((D >> 28) | (D << (64 - 28)))) ^ (((D >> 34) | (D << (64 - 34)))) ^ (((D >> 39) | (D << (64 - 39)))));

    K = J;
    J = I;
    I = H;
    H = G + N;
    G = F;
    F = E;
    E = D;
    D = N + O;
  }
  return __builtin_astype(__builtin_astype(D + 0x6a09e667f3bcc908UL, uchar8).s76543210, ulong);
}

__kernel void fn_C(__global const sha512_key* A, __global unsigned long* B, unsigned long C) {
  unsigned long D = get_global_id(0);
  if (D == 0 && C == 0) {
    *B = 0;
  }
  unsigned long E;

  unsigned long F[9];

  __global unsigned long* G = (__global unsigned long*)A->v;
  for (int H = 1; H < 9; H++) {
    F[H] = G[H];
  }

  F[0] = __builtin_astype(__builtin_astype(D + (C), uchar8).s76543210, ulong);

  E = fn_B((char*)F);
  if (__builtin_astype(__builtin_astype(E, uchar8).s76543210, ulong) < A->target) {
    *B = __builtin_astype(__builtin_astype(F[0], uchar8).s76543210, ulong);
  }
}