uint fn_A(uint A, int B) {
  if (B < 32)
    return (A >> B) | (A << (32 - B));
  return A;
}

uint fn_B(uint A, uint B, uint C) {
  return (A & B) ^ (~A & C);
}

uint fn_C(uint A, uint B, uint C) {
  return (A & B) ^ (A & C) ^ (B & C);
}

uint fn_D(uint A) {
  return fn_A(A, 2) ^ fn_A(A, 13) ^ fn_A(A, 22);
}

uint fn_E(uint A) {
  return fn_A(A, 6) ^ fn_A(A, 11) ^ fn_A(A, 25);
}

uint fn_F(uint A) {
  return fn_A(A, 7) ^ fn_A(A, 18) ^ (A >> 3);
}

uint fn_G(uint A) {
  return fn_A(A, 17) ^ fn_A(A, 19) ^ (A >> 10);
}

__kernel void fn_H(__global uint* A, __global char* B, __global uint* C) {
  int D, E, F;
  int G, H;
  uint I, J, K, L;
  uint M[80], N, O, P, Q, R, S, T, U, V, W, X;
  uint Y = A[1];
  int Z;

  uint AA[64] = {0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da, 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
                 0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070, 0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2};

  F = 0;

  J = A[2];
  L = J % 64 >= 56 ? 2 : 1 + J / 64;

  C[0] = 0x6a09e667;
  C[1] = 0xbb67ae85;
  C[2] = 0x3c6ef372;
  C[3] = 0xa54ff53a;
  C[4] = 0x510e527f;
  C[5] = 0x9b05688c;
  C[6] = 0x1f83d9ab;
  C[7] = 0x5be0cd19;
  for (K = 0; K < L; K++) {
    O = C[0];
    P = C[1];
    Q = C[2];
    R = C[3];
    S = C[4];
    T = C[5];
    U = C[6];
    V = C[7];

    for (D = 0; D < 80; D++) {
      M[D] = 0x00000000;
    }
    F = K * 64;
    if (J > F) {
      Z = (J - F) > 64 ? 64 : (J - F);
    } else {
      Z = -1;
    }

    if (Z > 0) {
      I = Z;

      G = I / 4;

      for (D = 0; D < G; D++) {
        M[D] = ((uchar)B[F + D * 4]) << 24;
        M[D] |= ((uchar)B[F + D * 4 + 1]) << 16;
        M[D] |= ((uchar)B[F + D * 4 + 2]) << 8;
        M[D] |= (uchar)B[F + D * 4 + 3];
      }
      H = I % 4;
      if (H == 3) {
        M[D] = ((uchar)B[F + D * 4]) << 24;
        M[D] |= ((uchar)B[F + D * 4 + 1]) << 16;
        M[D] |= ((uchar)B[F + D * 4 + 2]) << 8;
        M[D] |= ((uchar)0x80);
      } else if (H == 2) {
        M[D] = ((uchar)B[F + D * 4]) << 24;
        M[D] |= ((uchar)B[F + D * 4 + 1]) << 16;
        M[D] |= 0x8000;
      } else if (H == 1) {
        M[D] = ((uchar)B[F + D * 4]) << 24;
        M[D] |= 0x800000;
      } else {
        M[D] = 0x80000000;
      }

      if (Z < 56) {
        M[15] = J * 8;
      }
    } else if (Z < 0) {
      if (J % 64 == 0)
        M[0] = 0x80000000;
      M[15] = J * 8;
    }

    for (D = 0; D < 64; D++) {
      if (D >= 16)
        M[D] = fn_G(M[D - 2]) + M[D - 7] + fn_F(M[D - 15]) + M[D - 16];
      W = V + fn_E(S) + fn_B(S, T, U) + AA[D] + M[D];
      X = fn_D(O) + fn_C(O, P, Q);
      V = U;
      U = T;
      T = S;
      S = R + W;
      R = Q;
      Q = P;
      P = O;
      O = W + X;
    }
    C[0] += O;
    C[1] += P;
    C[2] += Q;
    C[3] += R;
    C[4] += S;
    C[5] += T;
    C[6] += U;
    C[7] += V;
  }
}