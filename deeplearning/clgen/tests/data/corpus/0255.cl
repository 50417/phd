__constant uint2 const gb_A[24] = {
    (uint2)(0x00000001, 0x00000000), (uint2)(0x00008082, 0x00000000), (uint2)(0x0000808a, 0x80000000), (uint2)(0x80008000, 0x80000000), (uint2)(0x0000808b, 0x00000000), (uint2)(0x80000001, 0x00000000), (uint2)(0x80008081, 0x80000000), (uint2)(0x00008009, 0x80000000), (uint2)(0x0000008a, 0x00000000), (uint2)(0x00000088, 0x00000000), (uint2)(0x80008009, 0x00000000), (uint2)(0x8000000a, 0x00000000),
    (uint2)(0x8000808b, 0x00000000), (uint2)(0x0000008b, 0x80000000), (uint2)(0x00008089, 0x80000000), (uint2)(0x00008003, 0x80000000), (uint2)(0x00008002, 0x80000000), (uint2)(0x00000080, 0x80000000), (uint2)(0x0000800a, 0x00000000), (uint2)(0x8000000a, 0x80000000), (uint2)(0x80008081, 0x80000000), (uint2)(0x00008080, 0x80000000), (uint2)(0x80000001, 0x00000000), (uint2)(0x80008008, 0x80000000),
};
uint2 fn_A(const uint2 A, const int B) {
  if (B <= 32) {
    return amd_bitalign((A).xy, (A).yx, 32 - B);
  } else {
    return amd_bitalign((A).yx, (A).xy, 64 - B);
  }
}
void fn_B(uint2* A, const uint B, const uint2* C) {
  A[B + 0] = bitselect(C[B + 0] ^ C[B + 2], C[B + 0], C[B + 1]);
  A[B + 1] = bitselect(C[B + 1] ^ C[B + 3], C[B + 1], C[B + 2]);
  A[B + 2] = bitselect(C[B + 2] ^ C[B + 4], C[B + 2], C[B + 3]);
  A[B + 3] = bitselect(C[B + 3] ^ C[B + 0], C[B + 3], C[B + 4]);
  A[B + 4] = bitselect(C[B + 4] ^ C[B + 1], C[B + 4], C[B + 0]);
}

void fn_C(uint2* A, uint B) {
  uint2 C[25];
  uint2 D;

  C[0] = A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20];
  C[1] = A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21];
  C[2] = A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22];
  C[3] = A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23];
  C[4] = A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24];
  D = C[4] ^ fn_A(C[1], 1);
  A[0] ^= D;
  A[5] ^= D;
  A[10] ^= D;
  A[15] ^= D;
  A[20] ^= D;
  D = C[0] ^ fn_A(C[2], 1);
  A[1] ^= D;
  A[6] ^= D;
  A[11] ^= D;
  A[16] ^= D;
  A[21] ^= D;
  D = C[1] ^ fn_A(C[3], 1);
  A[2] ^= D;
  A[7] ^= D;
  A[12] ^= D;
  A[17] ^= D;
  A[22] ^= D;
  D = C[2] ^ fn_A(C[4], 1);
  A[3] ^= D;
  A[8] ^= D;
  A[13] ^= D;
  A[18] ^= D;
  A[23] ^= D;
  D = C[3] ^ fn_A(C[0], 1);
  A[4] ^= D;
  A[9] ^= D;
  A[14] ^= D;
  A[19] ^= D;
  A[24] ^= D;

  C[0] = A[0];
  C[10] = fn_A(A[1], 1);
  C[20] = fn_A(A[2], 62);
  C[5] = fn_A(A[3], 28);
  C[15] = fn_A(A[4], 27);

  C[16] = fn_A(A[5], 36);
  C[1] = fn_A(A[6], 44);
  C[11] = fn_A(A[7], 6);
  C[21] = fn_A(A[8], 55);
  C[6] = fn_A(A[9], 20);

  C[7] = fn_A(A[10], 3);
  C[17] = fn_A(A[11], 10);
  C[2] = fn_A(A[12], 43);
  C[12] = fn_A(A[13], 25);
  C[22] = fn_A(A[14], 39);

  C[23] = fn_A(A[15], 41);
  C[8] = fn_A(A[16], 45);
  C[18] = fn_A(A[17], 15);
  C[3] = fn_A(A[18], 21);
  C[13] = fn_A(A[19], 8);

  C[14] = fn_A(A[20], 18);
  C[24] = fn_A(A[21], 2);
  C[9] = fn_A(A[22], 61);
  C[19] = fn_A(A[23], 56);
  C[4] = fn_A(A[24], 14);

  fn_B(A, 0, C);

  A[0] ^= gb_A[B];

  fn_B(A, 5, C);
  fn_B(A, 10, C);
  fn_B(A, 15, C);
  fn_B(A, 20, C);
}

void fn_D(uint2* A, uint B, uint C) {
  for (uint D = 0; D < 24;) {
    if (C) {
      fn_C(A, D++);
    }
  }
}

uint fn_E(uint A, uint B) {
  return A * 0x01000193 ^ B;
}

uint4 fn_F(uint4 A, uint4 B) {
  return A * 0x01000193 ^ B;
}

uint fn_G(uint4 A) {
  return fn_E(fn_E(fn_E(A.x, A.y), A.z), A.w);
}

typedef struct { ulong ulongs[32 / sizeof(ulong)]; } hash32_t;

typedef struct { uint4 uint4s[128 / sizeof(uint4)]; } hash128_t;

typedef union {
  uint4 uint4s[4];
  ulong ulongs[8];
  uint uints[16];
} compute_hash_share;

__attribute__((reqd_work_group_size(128, 1, 1)))

__kernel void
fn_H(__global volatile uint* restrict A, __constant hash32_t const* B, __global hash128_t const* C, uint D, ulong E, ulong F, uint G) {
  __local compute_hash_share H[(128 / (128 / 16))];

  uint const I = get_global_id(0);

  ulong J[25];
  for (uint K = 0; K != 4; ++K) {
    (J)[K] = (B->ulongs)[K];
  };
  J[4] = E + I;

  for (uint K = 6; K != 25; ++K) {
    J[K] = 0;
  }
  J[5] = 0x0000000000000001;
  J[8] = 0x8000000000000000;

  fn_D((uint2*)J, 8, G);

  uint const L = I & 7;
  uint const M = (I % 128) >> 3;

  for (int K = 0; K < (128 / 16); K++) {
    if (K == L)
      for (uint K = 0; K != 8; ++K) {
        (H[M].ulongs)[K] = (J)[K];
      };

    mem_fence(1);

    uint4 N = H[M].uint4s[L & 3];
    mem_fence(1);

    __local uint* O = H[M].uints;

    if (L == 0)
      *O = N.x;
    mem_fence(1);
    uint P = *O;

    for (uint Q = 0; Q < 64; Q += 4) {
      bool R = L == ((Q >> 2) & ((128 / 16) - 1));

      for (uint K = 0; K != 4; ++K) {
        if (R) {
          *O = fn_E(P ^ (Q + K), ((uint*)&N)[K]) % D;
        }
        mem_fence(1);

        N = fn_F(N, C[*O].uint4s[L]);
      }
    }

    H[M].uints[L] = fn_G(N);
    mem_fence(1);

    if (K == L)
      for (uint K = 0; K != 4; ++K) {
        (J + 8)[K] = (H[M].ulongs)[K];
      };

    mem_fence(1);
  }

  for (uint K = 13; K != 25; ++K) {
    J[K] = 0;
  }
  J[12] = 0x0000000000000001;
  J[16] = 0x8000000000000000;

  fn_D((uint2*)J, 1, G);

  if (__builtin_astype(__builtin_astype(J[0], uchar8).s76543210, ulong) < F) {
    uint S = min(0xFFu - 1u, atomic_add(&A[0xFFu], 1));
    A[S] = I;
  }
}

typedef union _Node {
  uint dwords[16];
  uint2 qwords[8];
  uint4 dqwords[4];
} Node;

void fn_I(uint2* A, uint B) {
  uint2 C[25];

  for (uint D = 0; D < 8; ++D)
    C[D] = A[D];

  for (uint D = 8; D != 25; ++D)
    C[D] = (uint2){0, 0};

  ((uint2*)C)[8].x = 0x00000001;
  ((uint2*)C)[8].y = 0x80000000;
  fn_D(C, 8, B);

  for (uint D = 0; D < 8; ++D)
    A[D] = C[D];
}

__kernel void fn_J(uint A, __global const uint16* B, __global uint16* C, uint D, uint E) {
  __global const Node* F = (__global const Node*)B;
  __global Node* G = (__global Node*)C;
  uint H = A + get_global_id(0);

  Node I = F[H % D];

  I.dwords[0] ^= H;
  fn_I(I.qwords, E);

  for (uint J = 0; J < 256; ++J) {
    uint K = fn_E(H ^ J, I.dwords[J & 15]) % D;
    __global const Node* L = F + K;

    for (uint M = 0; M < 4; ++M) {
      I.dqwords[M] *= (uint4)(0x01000193);
      I.dqwords[M] ^= L->dqwords[M];
    }
  }

  fn_I(I.qwords, E);
  G[H] = I;
}