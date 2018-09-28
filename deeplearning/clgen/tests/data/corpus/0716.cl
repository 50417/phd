uint* fn_A(const uint* A, uint B, uint C[]) {
  uint D = (1 << 8) - 1;
  B *= 8;
  for (uint E = 0; E < B; E += 8) {
    C[E >> 5] |= (A[E / 8] & D) << (32 - 8 - E % 32);
  }
  return C;
}

uint* fn_B(const uint A[], uint* B) {
  const uint C[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
  for (uint D = 0; D < (8 * 4); ++D) {
    B[2 * D] = C[(A[D >> 2] >> ((3 - D % 4) * 8 + 4)) & 0xF];
    B[2 * D + 1] = C[(A[D >> 2] >> ((3 - D % 4) * 8)) & 0xF];
  }
  B[64] = 0;
  return B;
}

uint fn_C(uint A, int B) {
  if (B < 32)
    return (A >> B) | (A << (32 - B));
  return A;
}

uint fn_D(uint A, uint B, uint C) {
  return (A & B) ^ (~A & C);
}

uint fn_E(uint A, uint B, uint C) {
  return (A & B) ^ (A & C) ^ (B & C);
}

uint fn_F(uint A) {
  return fn_C(A, 2) ^ fn_C(A, 13) ^ fn_C(A, 22);
}

uint fn_G(uint A) {
  return fn_C(A, 6) ^ fn_C(A, 11) ^ fn_C(A, 25);
}

uint fn_H(uint A) {
  return fn_C(A, 7) ^ fn_C(A, 18) ^ (A >> 3);
}

uint fn_I(uint A) {
  return fn_C(A, 17) ^ fn_C(A, 19) ^ (A >> 10);
}

void fn_J(uint A[], uint B, uint C[]) {
  uint D[] = {0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1, 0x923F82A4, 0xAB1C5ED5, 0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3, 0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174, 0xE49B69C1, 0xEFBE4786, 0x0FC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA, 0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147, 0x06CA6351, 0x14292967,
              0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13, 0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85, 0xA2BFE8A1, 0xA81A664B, 0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070, 0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A, 0x5B9CCA4F, 0x682E6FF3, 0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208, 0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2};
  C[0] = 0x6A09E667;
  C[1] = 0xBB67AE85;
  C[2] = 0x3C6EF372;
  C[3] = 0xA54FF53A;
  C[4] = 0x510E527F;
  C[5] = 0x9B05688C;
  C[6] = 0x1F83D9AB;
  C[7] = 0x5BE0CD19;
  uint E[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  uint F, G, H, I, J, K, L, M;
  uint N, O;
  const uint P = 16;
  A[B >> 5] |= 0x80 << (24 - B % 32);
  A[P - 1] = B;
  for (uint Q = 0; Q < P; Q += 16) {
    F = C[0];
    G = C[1];
    H = C[2];
    I = C[3];
    J = C[4];
    K = C[5];
    L = C[6];
    M = C[7];
    for (uint R = 0; R < 64; R++) {
      if (R < 16)
        E[R] = A[R + Q];
      else
        E[R] = fn_I(E[R - 2]) + E[R - 7] + fn_H(E[R - 15]) + E[R - 16];
      N = M + fn_G(J) + fn_D(J, K, L) + D[R] + E[R];
      O = fn_F(F) + fn_E(F, G, H);
      M = L;
      L = K;
      K = J;
      J = I + N;
      I = H;
      H = G;
      G = F;
      F = N + O;
    }
    C[0] += F;
    C[1] += G;
    C[2] += H;
    C[3] += I;
    C[4] += J;
    C[5] += K;
    C[6] += L;
    C[7] += M;
  }
}

uint* fn_K(const uint* A, uint B, uint* C) {
  uint D[8];
  uint E[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

  fn_J(fn_A(A, B, E), B * 8, D);
  return fn_B(D, C);
}

__kernel void fn_L(__global char* A, uint B, uint C, __global char* D, int E, uint F, __global char* G) {
  uint H[65];
  uint I[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  int J, K, L, M, N;
  size_t O = get_global_id(0) + F;
  int P = O == 0 ? 0 : (__clc_floor(log((float)O) / log((float)E)) + 1);
  if (P > C)
    P = C;
  int Q = 2 * C - P - 1;

  for (J = 0; J < C - P; ++J)
    I[J] = D[0];

  for (M = O; M && J < C; ++J) {
    I[Q - J] = D[M % E];
    M /= E;
  }

  L = C - (P > B ? P : B);
  for (J = 0; J <= L; ++J) {
    N = 1;

    fn_K(I + J, C - J, H);
    for (K = 0; K < 64; ++K) {
      if (A[K] != H[K]) {
        N = 0;
        break;
      }
    }

    if (N)
      for (K = 0; K < C - J; ++K)
        G[K] = I[J + K];
  }
}