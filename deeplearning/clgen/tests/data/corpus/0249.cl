unsigned int fn_A(int A, unsigned int B) {
  return ((B << A) & 0xFFFFFFFF) | (B) >> (32 - (A));
}

__kernel void fn_B(__global uint* A, __global char* B, __global uint* C) {
  int D, E, F;
  int G, H;
  uint I, J, K, L;
  uint M[80], N, O, P, Q, R, S;
  uint T = A[1];
  int U;

  F = 0;

  J = A[2];
  L = J % 64 >= 56 ? 2 : 1 + J / 64;

  C[0] = 0x67452301;
  C[1] = 0xEFCDAB89;
  C[2] = 0x98BADCFE;
  C[3] = 0x10325476;
  C[4] = 0xC3D2E1F0;
  for (K = 0; K < L; K++) {
    O = C[0];
    P = C[1];
    Q = C[2];
    R = C[3];
    S = C[4];

    for (D = 0; D < 80; D++) {
      M[D] = 0x00000000;
    }
    F = K * 64;
    if (J > F) {
      U = (J - F) > 64 ? 64 : (J - F);
    } else {
      U = -1;
    }

    if (U > 0) {
      I = U;

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

      if (U < 56) {
        M[15] = J * 8;
      }
    } else if (U < 0) {
      if (J % 64 == 0)
        M[0] = 0x80000000;
      M[15] = J * 8;
    }

    for (D = 16; D < 80; D++) {
      M[D] = fn_A(1, M[D - 3] ^ M[D - 8] ^ M[D - 14] ^ M[D - 16]);
    }

    for (D = 0; D < 20; D++) {
      N = fn_A(5, O) + ((P & Q) | ((~P) & R)) + S + M[D] + 0x5A827999;
      N &= 0xFFFFFFFF;
      S = R;
      R = Q;
      Q = fn_A(30, P);
      P = O;
      O = N;
    }

    for (D = 20; D < 40; D++) {
      N = fn_A(5, O) + (P ^ Q ^ R) + S + M[D] + 0x6ED9EBA1;
      N &= 0xFFFFFFFF;
      S = R;
      R = Q;
      Q = fn_A(30, P);
      P = O;
      O = N;
    }

    for (D = 40; D < 60; D++) {
      N = fn_A(5, O) + ((P & Q) | (P & R) | (Q & R)) + S + M[D] + 0x8F1BBCDC;
      N &= 0xFFFFFFFF;
      S = R;
      R = Q;
      Q = fn_A(30, P);
      P = O;
      O = N;
    }

    for (D = 60; D < 80; D++) {
      N = fn_A(5, O) + (P ^ Q ^ R) + S + M[D] + 0xCA62C1D6;
      N &= 0xFFFFFFFF;
      S = R;
      R = Q;
      Q = fn_A(30, P);
      P = O;
      O = N;
    }

    C[0] = (C[0] + O) & 0xFFFFFFFF;
    C[1] = (C[1] + P) & 0xFFFFFFFF;
    C[2] = (C[2] + Q) & 0xFFFFFFFF;
    C[3] = (C[3] + R) & 0xFFFFFFFF;
    C[4] = (C[4] + S) & 0xFFFFFFFF;
  }
}