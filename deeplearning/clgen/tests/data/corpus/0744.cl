__constant uint16 gb_A = {0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636};

__constant uint16 gb_B = {0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c, 0x5c5c5c5c};

__constant uint16 gb_C = {0x00000001, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00002220};

__constant uint16 gb_D = {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x000004a0};

__constant uint16 gb_E = {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000280};

__constant uint8 gb_F = {0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000300};

__constant uint8 gb_G = {0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19};

inline uint8 fn_A(uint8 A) {
  uint8 B;
  B.s0 = (__builtin_astype(__builtin_astype(A.s0, uchar4).wzyx, uint));
  B.s1 = (__builtin_astype(__builtin_astype(A.s1, uchar4).wzyx, uint));
  B.s2 = (__builtin_astype(__builtin_astype(A.s2, uchar4).wzyx, uint));
  B.s3 = (__builtin_astype(__builtin_astype(A.s3, uchar4).wzyx, uint));
  B.s4 = (__builtin_astype(__builtin_astype(A.s4, uchar4).wzyx, uint));
  B.s5 = (__builtin_astype(__builtin_astype(A.s5, uchar4).wzyx, uint));
  B.s6 = (__builtin_astype(__builtin_astype(A.s6, uchar4).wzyx, uint));
  B.s7 = (__builtin_astype(__builtin_astype(A.s7, uchar4).wzyx, uint));
  return B;
}

inline uint16 fn_B(uint16 A) {
  uint16 B;
  B.s0 = (__builtin_astype(__builtin_astype(A.s0, uchar4).wzyx, uint));
  B.s1 = (__builtin_astype(__builtin_astype(A.s1, uchar4).wzyx, uint));
  B.s2 = (__builtin_astype(__builtin_astype(A.s2, uchar4).wzyx, uint));
  B.s3 = (__builtin_astype(__builtin_astype(A.s3, uchar4).wzyx, uint));
  B.s4 = (__builtin_astype(__builtin_astype(A.s4, uchar4).wzyx, uint));
  B.s5 = (__builtin_astype(__builtin_astype(A.s5, uchar4).wzyx, uint));
  B.s6 = (__builtin_astype(__builtin_astype(A.s6, uchar4).wzyx, uint));
  B.s7 = (__builtin_astype(__builtin_astype(A.s7, uchar4).wzyx, uint));
  B.s8 = (__builtin_astype(__builtin_astype(A.s8, uchar4).wzyx, uint));
  B.s9 = (__builtin_astype(__builtin_astype(A.s9, uchar4).wzyx, uint));
  B.sa = (__builtin_astype(__builtin_astype(A.sa, uchar4).wzyx, uint));
  B.sb = (__builtin_astype(__builtin_astype(A.sb, uchar4).wzyx, uint));
  B.sc = (__builtin_astype(__builtin_astype(A.sc, uchar4).wzyx, uint));
  B.sd = (__builtin_astype(__builtin_astype(A.sd, uchar4).wzyx, uint));
  B.se = (__builtin_astype(__builtin_astype(A.se, uchar4).wzyx, uint));
  B.sf = (__builtin_astype(__builtin_astype(A.sf, uchar4).wzyx, uint));
  return B;
}

ulong8 fn_C(uint16 A) {
  uint B;
  uint16 C = A;
  do {
    do {
      B = C.s0 + C.sc;
      C.s4 ^= rotate(B, (uint)7U);
      B = C.s4 + C.s0;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.s4;
      C.sc ^= rotate(B, (uint)13U);
      B = C.sc + C.s8;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s1 + C.sd;
      C.s5 ^= rotate(B, (uint)7U);
      B = C.s5 + C.s1;
      C.s9 ^= rotate(B, (uint)9U);
      B = C.s9 + C.s5;
      C.sd ^= rotate(B, (uint)13U);
      B = C.sd + C.s9;
      C.s1 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s2 + C.se;
      C.s6 ^= rotate(B, (uint)7U);
      B = C.s6 + C.s2;
      C.sa ^= rotate(B, (uint)9U);
      B = C.sa + C.s6;
      C.se ^= rotate(B, (uint)13U);
      B = C.se + C.sa;
      C.s2 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s3 + C.sf;
      C.s7 ^= rotate(B, (uint)7U);
      B = C.s7 + C.s3;
      C.sb ^= rotate(B, (uint)9U);
      B = C.sb + C.s7;
      C.sf ^= rotate(B, (uint)13U);
      B = C.sf + C.sb;
      C.s3 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s0 + C.s7;
      C.sd ^= rotate(B, (uint)7U);
      B = C.sd + C.s0;
      C.sa ^= rotate(B, (uint)9U);
      B = C.sa + C.sd;
      C.s7 ^= rotate(B, (uint)13U);
      B = C.s7 + C.sa;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s1 + C.s4;
      C.se ^= rotate(B, (uint)7U);
      B = C.se + C.s1;
      C.sb ^= rotate(B, (uint)9U);
      B = C.sb + C.se;
      C.s4 ^= rotate(B, (uint)13U);
      B = C.s4 + C.sb;
      C.s1 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s2 + C.s5;
      C.sf ^= rotate(B, (uint)7U);
      B = C.sf + C.s2;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.sf;
      C.s5 ^= rotate(B, (uint)13U);
      B = C.s5 + C.s8;
      C.s2 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s3 + C.s6;
      C.sc ^= rotate(B, (uint)7U);
      B = C.sc + C.s3;
      C.s9 ^= rotate(B, (uint)9U);
      B = C.s9 + C.sc;
      C.s6 ^= rotate(B, (uint)13U);
      B = C.s6 + C.s9;
      C.s3 ^= rotate(B, (uint)18U);
    } while (0);
  } while (0);
  do {
    do {
      B = C.s0 + C.sc;
      C.s4 ^= rotate(B, (uint)7U);
      B = C.s4 + C.s0;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.s4;
      C.sc ^= rotate(B, (uint)13U);
      B = C.sc + C.s8;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s1 + C.sd;
      C.s5 ^= rotate(B, (uint)7U);
      B = C.s5 + C.s1;
      C.s9 ^= rotate(B, (uint)9U);
      B = C.s9 + C.s5;
      C.sd ^= rotate(B, (uint)13U);
      B = C.sd + C.s9;
      C.s1 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s2 + C.se;
      C.s6 ^= rotate(B, (uint)7U);
      B = C.s6 + C.s2;
      C.sa ^= rotate(B, (uint)9U);
      B = C.sa + C.s6;
      C.se ^= rotate(B, (uint)13U);
      B = C.se + C.sa;
      C.s2 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s3 + C.sf;
      C.s7 ^= rotate(B, (uint)7U);
      B = C.s7 + C.s3;
      C.sb ^= rotate(B, (uint)9U);
      B = C.sb + C.s7;
      C.sf ^= rotate(B, (uint)13U);
      B = C.sf + C.sb;
      C.s3 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s0 + C.s7;
      C.sd ^= rotate(B, (uint)7U);
      B = C.sd + C.s0;
      C.sa ^= rotate(B, (uint)9U);
      B = C.sa + C.sd;
      C.s7 ^= rotate(B, (uint)13U);
      B = C.s7 + C.sa;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s1 + C.s4;
      C.se ^= rotate(B, (uint)7U);
      B = C.se + C.s1;
      C.sb ^= rotate(B, (uint)9U);
      B = C.sb + C.se;
      C.s4 ^= rotate(B, (uint)13U);
      B = C.s4 + C.sb;
      C.s1 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s2 + C.s5;
      C.sf ^= rotate(B, (uint)7U);
      B = C.sf + C.s2;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.sf;
      C.s5 ^= rotate(B, (uint)13U);
      B = C.s5 + C.s8;
      C.s2 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s3 + C.s6;
      C.sc ^= rotate(B, (uint)7U);
      B = C.sc + C.s3;
      C.s9 ^= rotate(B, (uint)9U);
      B = C.s9 + C.sc;
      C.s6 ^= rotate(B, (uint)13U);
      B = C.s6 + C.s9;
      C.s3 ^= rotate(B, (uint)18U);
    } while (0);
  } while (0);
  do {
    do {
      B = C.s0 + C.sc;
      C.s4 ^= rotate(B, (uint)7U);
      B = C.s4 + C.s0;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.s4;
      C.sc ^= rotate(B, (uint)13U);
      B = C.sc + C.s8;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s1 + C.sd;
      C.s5 ^= rotate(B, (uint)7U);
      B = C.s5 + C.s1;
      C.s9 ^= rotate(B, (uint)9U);
      B = C.s9 + C.s5;
      C.sd ^= rotate(B, (uint)13U);
      B = C.sd + C.s9;
      C.s1 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s2 + C.se;
      C.s6 ^= rotate(B, (uint)7U);
      B = C.s6 + C.s2;
      C.sa ^= rotate(B, (uint)9U);
      B = C.sa + C.s6;
      C.se ^= rotate(B, (uint)13U);
      B = C.se + C.sa;
      C.s2 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s3 + C.sf;
      C.s7 ^= rotate(B, (uint)7U);
      B = C.s7 + C.s3;
      C.sb ^= rotate(B, (uint)9U);
      B = C.sb + C.s7;
      C.sf ^= rotate(B, (uint)13U);
      B = C.sf + C.sb;
      C.s3 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s0 + C.s7;
      C.sd ^= rotate(B, (uint)7U);
      B = C.sd + C.s0;
      C.sa ^= rotate(B, (uint)9U);
      B = C.sa + C.sd;
      C.s7 ^= rotate(B, (uint)13U);
      B = C.s7 + C.sa;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s1 + C.s4;
      C.se ^= rotate(B, (uint)7U);
      B = C.se + C.s1;
      C.sb ^= rotate(B, (uint)9U);
      B = C.sb + C.se;
      C.s4 ^= rotate(B, (uint)13U);
      B = C.s4 + C.sb;
      C.s1 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s2 + C.s5;
      C.sf ^= rotate(B, (uint)7U);
      B = C.sf + C.s2;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.sf;
      C.s5 ^= rotate(B, (uint)13U);
      B = C.s5 + C.s8;
      C.s2 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s3 + C.s6;
      C.sc ^= rotate(B, (uint)7U);
      B = C.sc + C.s3;
      C.s9 ^= rotate(B, (uint)9U);
      B = C.s9 + C.sc;
      C.s6 ^= rotate(B, (uint)13U);
      B = C.s6 + C.s9;
      C.s3 ^= rotate(B, (uint)18U);
    } while (0);
  } while (0);
  do {
    do {
      B = C.s0 + C.sc;
      C.s4 ^= rotate(B, (uint)7U);
      B = C.s4 + C.s0;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.s4;
      C.sc ^= rotate(B, (uint)13U);
      B = C.sc + C.s8;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s1 + C.sd;
      C.s5 ^= rotate(B, (uint)7U);
      B = C.s5 + C.s1;
      C.s9 ^= rotate(B, (uint)9U);
      B = C.s9 + C.s5;
      C.sd ^= rotate(B, (uint)13U);
      B = C.sd + C.s9;
      C.s1 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s2 + C.se;
      C.s6 ^= rotate(B, (uint)7U);
      B = C.s6 + C.s2;
      C.sa ^= rotate(B, (uint)9U);
      B = C.sa + C.s6;
      C.se ^= rotate(B, (uint)13U);
      B = C.se + C.sa;
      C.s2 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s3 + C.sf;
      C.s7 ^= rotate(B, (uint)7U);
      B = C.s7 + C.s3;
      C.sb ^= rotate(B, (uint)9U);
      B = C.sb + C.s7;
      C.sf ^= rotate(B, (uint)13U);
      B = C.sf + C.sb;
      C.s3 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s0 + C.s7;
      C.sd ^= rotate(B, (uint)7U);
      B = C.sd + C.s0;
      C.sa ^= rotate(B, (uint)9U);
      B = C.sa + C.sd;
      C.s7 ^= rotate(B, (uint)13U);
      B = C.s7 + C.sa;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s1 + C.s4;
      C.se ^= rotate(B, (uint)7U);
      B = C.se + C.s1;
      C.sb ^= rotate(B, (uint)9U);
      B = C.sb + C.se;
      C.s4 ^= rotate(B, (uint)13U);
      B = C.s4 + C.sb;
      C.s1 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s2 + C.s5;
      C.sf ^= rotate(B, (uint)7U);
      B = C.sf + C.s2;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.sf;
      C.s5 ^= rotate(B, (uint)13U);
      B = C.s5 + C.s8;
      C.s2 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s3 + C.s6;
      C.sc ^= rotate(B, (uint)7U);
      B = C.sc + C.s3;
      C.s9 ^= rotate(B, (uint)9U);
      B = C.s9 + C.sc;
      C.s6 ^= rotate(B, (uint)13U);
      B = C.s6 + C.s9;
      C.s3 ^= rotate(B, (uint)18U);
    } while (0);
  } while (0);
  return (__builtin_astype(C + A, ulong8));
}

ulong8 fn_D(uint16 A) {
  uint B;
  uint16 C = A;
  do {
    do {
      B = C.s0 + C.sc;
      C.s4 ^= rotate(B, (uint)7U);
      B = C.s4 + C.s0;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.s4;
      C.sc ^= rotate(B, (uint)13U);
      B = C.sc + C.s8;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s5 + C.s1;
      C.s9 ^= rotate(B, (uint)7U);
      B = C.s9 + C.s5;
      C.sd ^= rotate(B, (uint)9U);
      B = C.sd + C.s9;
      C.s1 ^= rotate(B, (uint)13U);
      B = C.s1 + C.sd;
      C.s5 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sa + C.s6;
      C.se ^= rotate(B, (uint)7U);
      B = C.se + C.sa;
      C.s2 ^= rotate(B, (uint)9U);
      B = C.s2 + C.se;
      C.s6 ^= rotate(B, (uint)13U);
      B = C.s6 + C.s2;
      C.sa ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sf + C.sb;
      C.s3 ^= rotate(B, (uint)7U);
      B = C.s3 + C.sf;
      C.s7 ^= rotate(B, (uint)9U);
      B = C.s7 + C.s3;
      C.sb ^= rotate(B, (uint)13U);
      B = C.sb + C.s7;
      C.sf ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s0 + C.s3;
      C.s1 ^= rotate(B, (uint)7U);
      B = C.s1 + C.s0;
      C.s2 ^= rotate(B, (uint)9U);
      B = C.s2 + C.s1;
      C.s3 ^= rotate(B, (uint)13U);
      B = C.s3 + C.s2;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s5 + C.s4;
      C.s6 ^= rotate(B, (uint)7U);
      B = C.s6 + C.s5;
      C.s7 ^= rotate(B, (uint)9U);
      B = C.s7 + C.s6;
      C.s4 ^= rotate(B, (uint)13U);
      B = C.s4 + C.s7;
      C.s5 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sa + C.s9;
      C.sb ^= rotate(B, (uint)7U);
      B = C.sb + C.sa;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.sb;
      C.s9 ^= rotate(B, (uint)13U);
      B = C.s9 + C.s8;
      C.sa ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sf + C.se;
      C.sc ^= rotate(B, (uint)7U);
      B = C.sc + C.sf;
      C.sd ^= rotate(B, (uint)9U);
      B = C.sd + C.sc;
      C.se ^= rotate(B, (uint)13U);
      B = C.se + C.sd;
      C.sf ^= rotate(B, (uint)18U);
    } while (0);
  } while (0);
  do {
    do {
      B = C.s0 + C.sc;
      C.s4 ^= rotate(B, (uint)7U);
      B = C.s4 + C.s0;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.s4;
      C.sc ^= rotate(B, (uint)13U);
      B = C.sc + C.s8;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s5 + C.s1;
      C.s9 ^= rotate(B, (uint)7U);
      B = C.s9 + C.s5;
      C.sd ^= rotate(B, (uint)9U);
      B = C.sd + C.s9;
      C.s1 ^= rotate(B, (uint)13U);
      B = C.s1 + C.sd;
      C.s5 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sa + C.s6;
      C.se ^= rotate(B, (uint)7U);
      B = C.se + C.sa;
      C.s2 ^= rotate(B, (uint)9U);
      B = C.s2 + C.se;
      C.s6 ^= rotate(B, (uint)13U);
      B = C.s6 + C.s2;
      C.sa ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sf + C.sb;
      C.s3 ^= rotate(B, (uint)7U);
      B = C.s3 + C.sf;
      C.s7 ^= rotate(B, (uint)9U);
      B = C.s7 + C.s3;
      C.sb ^= rotate(B, (uint)13U);
      B = C.sb + C.s7;
      C.sf ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s0 + C.s3;
      C.s1 ^= rotate(B, (uint)7U);
      B = C.s1 + C.s0;
      C.s2 ^= rotate(B, (uint)9U);
      B = C.s2 + C.s1;
      C.s3 ^= rotate(B, (uint)13U);
      B = C.s3 + C.s2;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s5 + C.s4;
      C.s6 ^= rotate(B, (uint)7U);
      B = C.s6 + C.s5;
      C.s7 ^= rotate(B, (uint)9U);
      B = C.s7 + C.s6;
      C.s4 ^= rotate(B, (uint)13U);
      B = C.s4 + C.s7;
      C.s5 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sa + C.s9;
      C.sb ^= rotate(B, (uint)7U);
      B = C.sb + C.sa;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.sb;
      C.s9 ^= rotate(B, (uint)13U);
      B = C.s9 + C.s8;
      C.sa ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sf + C.se;
      C.sc ^= rotate(B, (uint)7U);
      B = C.sc + C.sf;
      C.sd ^= rotate(B, (uint)9U);
      B = C.sd + C.sc;
      C.se ^= rotate(B, (uint)13U);
      B = C.se + C.sd;
      C.sf ^= rotate(B, (uint)18U);
    } while (0);
  } while (0);
  do {
    do {
      B = C.s0 + C.sc;
      C.s4 ^= rotate(B, (uint)7U);
      B = C.s4 + C.s0;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.s4;
      C.sc ^= rotate(B, (uint)13U);
      B = C.sc + C.s8;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s5 + C.s1;
      C.s9 ^= rotate(B, (uint)7U);
      B = C.s9 + C.s5;
      C.sd ^= rotate(B, (uint)9U);
      B = C.sd + C.s9;
      C.s1 ^= rotate(B, (uint)13U);
      B = C.s1 + C.sd;
      C.s5 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sa + C.s6;
      C.se ^= rotate(B, (uint)7U);
      B = C.se + C.sa;
      C.s2 ^= rotate(B, (uint)9U);
      B = C.s2 + C.se;
      C.s6 ^= rotate(B, (uint)13U);
      B = C.s6 + C.s2;
      C.sa ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sf + C.sb;
      C.s3 ^= rotate(B, (uint)7U);
      B = C.s3 + C.sf;
      C.s7 ^= rotate(B, (uint)9U);
      B = C.s7 + C.s3;
      C.sb ^= rotate(B, (uint)13U);
      B = C.sb + C.s7;
      C.sf ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s0 + C.s3;
      C.s1 ^= rotate(B, (uint)7U);
      B = C.s1 + C.s0;
      C.s2 ^= rotate(B, (uint)9U);
      B = C.s2 + C.s1;
      C.s3 ^= rotate(B, (uint)13U);
      B = C.s3 + C.s2;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s5 + C.s4;
      C.s6 ^= rotate(B, (uint)7U);
      B = C.s6 + C.s5;
      C.s7 ^= rotate(B, (uint)9U);
      B = C.s7 + C.s6;
      C.s4 ^= rotate(B, (uint)13U);
      B = C.s4 + C.s7;
      C.s5 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sa + C.s9;
      C.sb ^= rotate(B, (uint)7U);
      B = C.sb + C.sa;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.sb;
      C.s9 ^= rotate(B, (uint)13U);
      B = C.s9 + C.s8;
      C.sa ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sf + C.se;
      C.sc ^= rotate(B, (uint)7U);
      B = C.sc + C.sf;
      C.sd ^= rotate(B, (uint)9U);
      B = C.sd + C.sc;
      C.se ^= rotate(B, (uint)13U);
      B = C.se + C.sd;
      C.sf ^= rotate(B, (uint)18U);
    } while (0);
  } while (0);
  do {
    do {
      B = C.s0 + C.sc;
      C.s4 ^= rotate(B, (uint)7U);
      B = C.s4 + C.s0;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.s4;
      C.sc ^= rotate(B, (uint)13U);
      B = C.sc + C.s8;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s5 + C.s1;
      C.s9 ^= rotate(B, (uint)7U);
      B = C.s9 + C.s5;
      C.sd ^= rotate(B, (uint)9U);
      B = C.sd + C.s9;
      C.s1 ^= rotate(B, (uint)13U);
      B = C.s1 + C.sd;
      C.s5 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sa + C.s6;
      C.se ^= rotate(B, (uint)7U);
      B = C.se + C.sa;
      C.s2 ^= rotate(B, (uint)9U);
      B = C.s2 + C.se;
      C.s6 ^= rotate(B, (uint)13U);
      B = C.s6 + C.s2;
      C.sa ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sf + C.sb;
      C.s3 ^= rotate(B, (uint)7U);
      B = C.s3 + C.sf;
      C.s7 ^= rotate(B, (uint)9U);
      B = C.s7 + C.s3;
      C.sb ^= rotate(B, (uint)13U);
      B = C.sb + C.s7;
      C.sf ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s0 + C.s3;
      C.s1 ^= rotate(B, (uint)7U);
      B = C.s1 + C.s0;
      C.s2 ^= rotate(B, (uint)9U);
      B = C.s2 + C.s1;
      C.s3 ^= rotate(B, (uint)13U);
      B = C.s3 + C.s2;
      C.s0 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.s5 + C.s4;
      C.s6 ^= rotate(B, (uint)7U);
      B = C.s6 + C.s5;
      C.s7 ^= rotate(B, (uint)9U);
      B = C.s7 + C.s6;
      C.s4 ^= rotate(B, (uint)13U);
      B = C.s4 + C.s7;
      C.s5 ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sa + C.s9;
      C.sb ^= rotate(B, (uint)7U);
      B = C.sb + C.sa;
      C.s8 ^= rotate(B, (uint)9U);
      B = C.s8 + C.sb;
      C.s9 ^= rotate(B, (uint)13U);
      B = C.s9 + C.s8;
      C.sa ^= rotate(B, (uint)18U);
    } while (0);
    do {
      B = C.sf + C.se;
      C.sc ^= rotate(B, (uint)7U);
      B = C.sc + C.sf;
      C.sd ^= rotate(B, (uint)9U);
      B = C.sd + C.sc;
      C.se ^= rotate(B, (uint)13U);
      B = C.se + C.sd;
      C.sf ^= rotate(B, (uint)18U);
    } while (0);
  } while (0);
  return (__builtin_astype(C + A, ulong8));
}

ulong16 fn_E(ulong16 A) {
  ulong8 B = A.hi;
  B ^= A.lo;
  B = fn_C(__builtin_astype(B, uint16));
  A.lo = B;
  B ^= A.hi;
  B = fn_C(__builtin_astype(B, uint16));
  A.hi = B;
  return (A);
}
inline ulong2 fn_F(uint4 A, uint4 B) {
  uint4 C;
  C.x = A.x * A.y + B.x;
  C.y = B.y + (mul_hi((A.x), (A.y)) + (B.x));
  C.z = A.z * A.w + B.z;
  C.w = B.w + (mul_hi((A.z), (A.w)) + (B.z));
  return __builtin_astype(C, ulong2);
}

inline ulong2 fn_G(uint4 A, ulong2 B) {
  ulong2 C;
  C.x = (ulong)A.x * (ulong)A.y + B.x;
  C.y = (ulong)A.z * (ulong)A.w + B.y;
  return C;
}

inline ulong8 fn_H(ulong8 A, __global ulong16* B) {
  ulong2 C = A.lo.lo;

  for (int D = 0; D < 6; D++) {
    ulong2 E, F;
    uint2 G = __builtin_astype((C.x >> 4) & 0x000000FF000000FF, uint2);
    E = ((__global ulong2*)(B))[G.x];
    C = fn_G(__builtin_astype(C, uint4), E);
    F = ((__global ulong2*)(B + 32))[G.y];

    C ^= F;
  }
  A.lo.lo = C;
  C = A.lo.hi;
  for (int D = 0; D < 6; D++) {
    ulong2 E, F;
    uint2 G = __builtin_astype((C.x >> 4) & 0x000000FF000000FF, uint2);
    E = ((__global ulong2*)(B))[G.x];
    C = fn_G(__builtin_astype(C, uint4), E);
    F = ((__global ulong2*)(B + 32))[G.y];

    C ^= F;
  }
  A.lo.hi = C;

  C = A.hi.lo;
  for (int D = 0; D < 6; D++) {
    ulong2 E, F;
    uint2 G = __builtin_astype((C.x >> 4) & 0x000000FF000000FF, uint2);
    E = ((__global ulong2*)(B))[G.x];
    C = fn_G(__builtin_astype(C, uint4), E);
    F = ((__global ulong2*)(B + 32))[G.y];
    C ^= F;
  }
  A.hi.lo = C;
  C = A.hi.hi;
  for (int D = 0; D < 6; D++) {
    ulong2 E, F;
    uint2 G = __builtin_astype((C.x >> 4) & 0x000000FF000000FF, uint2);
    E = ((__global ulong2*)(B))[G.x];
    C = fn_G(__builtin_astype(C, uint4), E);
    F = ((__global ulong2*)(B + 32))[G.y];

    C ^= F;
  }
  A.hi.hi = C;

  return (A);
}

inline ulong8 fn_I(ulong8 A, __global ulong2* B) {
  ulong2 C = A.lo.lo;

  for (int D = 0; D < 6; D++) {
    ulong2 E, F;
    uint2 G = __builtin_astype((C.x >> 4) & 0x000000FF000000FF, uint2);
    E = B[G.x];
    C = fn_G(__builtin_astype(C, uint4), E);
    F = (B + 32 * 8)[G.y];

    C ^= F;
  }
  A.lo.lo = C;
  C = A.lo.hi;
  for (int D = 0; D < 6; D++) {
    ulong2 E, F;
    uint2 G = __builtin_astype((C.x >> 4) & 0x000000FF000000FF, uint2);
    E = B[G.x];
    C = fn_G(__builtin_astype(C, uint4), E);
    F = (B + 32 * 8)[G.y];

    C ^= F;
  }
  A.lo.hi = C;

  C = A.hi.lo;
  for (int D = 0; D < 6; D++) {
    ulong2 E, F;
    uint2 G = __builtin_astype((C.x >> 4) & 0x000000FF000000FF, uint2);
    E = B[G.x];
    C = fn_G(__builtin_astype(C, uint4), E);
    F = (B + 32 * 8)[G.y];
    C ^= F;
  }
  A.hi.lo = C;
  C = A.hi.hi;
  for (int D = 0; D < 6; D++) {
    ulong2 E, F;
    uint2 G = __builtin_astype((C.x >> 4) & 0x000000FF000000FF, uint2);
    E = B[G.x];
    C = fn_G(__builtin_astype(C, uint4), E);
    F = (B + 32 * 8)[G.y];

    C ^= F;
  }
  A.hi.hi = C;

  return (A);
}

inline void fn_J(__global ulong8* A, __global ulong16* B) {
  A[0] ^= A[15];
  A[0] = fn_H(A[0], B);
  for (int C = 1; C < 16; C++) {
    A[C] ^= A[C - 1];
    A[C] = fn_H(A[C], B);
  }
  A[15] = fn_C(__builtin_astype(A[15], uint16));
}
inline uint8 fn_K(uint16 A, uint8 B) {
  uint C;
  uint8 D = B;
  uint E = A.s0;
  uint F = A.s1;
  uint G = A.s2;
  uint H = A.s3;
  uint I = A.s4;
  uint J = A.s5;
  uint K = A.s6;
  uint L = A.s7;
  uint M = A.s8;
  uint N = A.s9;
  uint O = A.sA;
  uint P = A.sB;
  uint Q = A.sC;
  uint R = A.sD;
  uint S = A.sE;
  uint T = A.sF;
  {
    C = D.s7 + (rotate(D.s4, (uint)26) ^ rotate(D.s4, (uint)21) ^ rotate(D.s4, (uint)7)) + bitselect(D.s6, D.s5, D.s4) + (0x428A2F98 + E);
    D.s3 += C;
    D.s7 = C + (rotate(D.s0, (uint)30) ^ rotate(D.s0, (uint)19) ^ rotate(D.s0, (uint)10)) + bitselect(D.s2, D.s0, D.s2 ^ D.s1);
  };
  {
    C = D.s6 + (rotate(D.s3, (uint)26) ^ rotate(D.s3, (uint)21) ^ rotate(D.s3, (uint)7)) + bitselect(D.s5, D.s4, D.s3) + (0x71374491 + F);
    D.s2 += C;
    D.s6 = C + (rotate(D.s7, (uint)30) ^ rotate(D.s7, (uint)19) ^ rotate(D.s7, (uint)10)) + bitselect(D.s1, D.s7, D.s1 ^ D.s0);
  };
  {
    C = D.s5 + (rotate(D.s2, (uint)26) ^ rotate(D.s2, (uint)21) ^ rotate(D.s2, (uint)7)) + bitselect(D.s4, D.s3, D.s2) + (0xB5C0FBCF + G);
    D.s1 += C;
    D.s5 = C + (rotate(D.s6, (uint)30) ^ rotate(D.s6, (uint)19) ^ rotate(D.s6, (uint)10)) + bitselect(D.s0, D.s6, D.s0 ^ D.s7);
  };
  {
    C = D.s4 + (rotate(D.s1, (uint)26) ^ rotate(D.s1, (uint)21) ^ rotate(D.s1, (uint)7)) + bitselect(D.s3, D.s2, D.s1) + (0xE9B5DBA5 + H);
    D.s0 += C;
    D.s4 = C + (rotate(D.s5, (uint)30) ^ rotate(D.s5, (uint)19) ^ rotate(D.s5, (uint)10)) + bitselect(D.s7, D.s5, D.s7 ^ D.s6);
  };
  {
    C = D.s3 + (rotate(D.s0, (uint)26) ^ rotate(D.s0, (uint)21) ^ rotate(D.s0, (uint)7)) + bitselect(D.s2, D.s1, D.s0) + (0x3956C25B + I);
    D.s7 += C;
    D.s3 = C + (rotate(D.s4, (uint)30) ^ rotate(D.s4, (uint)19) ^ rotate(D.s4, (uint)10)) + bitselect(D.s6, D.s4, D.s6 ^ D.s5);
  };
  {
    C = D.s2 + (rotate(D.s7, (uint)26) ^ rotate(D.s7, (uint)21) ^ rotate(D.s7, (uint)7)) + bitselect(D.s1, D.s0, D.s7) + (0x59F111F1 + J);
    D.s6 += C;
    D.s2 = C + (rotate(D.s3, (uint)30) ^ rotate(D.s3, (uint)19) ^ rotate(D.s3, (uint)10)) + bitselect(D.s5, D.s3, D.s5 ^ D.s4);
  };
  {
    C = D.s1 + (rotate(D.s6, (uint)26) ^ rotate(D.s6, (uint)21) ^ rotate(D.s6, (uint)7)) + bitselect(D.s0, D.s7, D.s6) + (0x923F82A4 + K);
    D.s5 += C;
    D.s1 = C + (rotate(D.s2, (uint)30) ^ rotate(D.s2, (uint)19) ^ rotate(D.s2, (uint)10)) + bitselect(D.s4, D.s2, D.s4 ^ D.s3);
  };
  {
    C = D.s0 + (rotate(D.s5, (uint)26) ^ rotate(D.s5, (uint)21) ^ rotate(D.s5, (uint)7)) + bitselect(D.s7, D.s6, D.s5) + (0xAB1C5ED5 + L);
    D.s4 += C;
    D.s0 = C + (rotate(D.s1, (uint)30) ^ rotate(D.s1, (uint)19) ^ rotate(D.s1, (uint)10)) + bitselect(D.s3, D.s1, D.s3 ^ D.s2);
  };
  {
    C = D.s7 + (rotate(D.s4, (uint)26) ^ rotate(D.s4, (uint)21) ^ rotate(D.s4, (uint)7)) + bitselect(D.s6, D.s5, D.s4) + (0xD807AA98 + M);
    D.s3 += C;
    D.s7 = C + (rotate(D.s0, (uint)30) ^ rotate(D.s0, (uint)19) ^ rotate(D.s0, (uint)10)) + bitselect(D.s2, D.s0, D.s2 ^ D.s1);
  };
  {
    C = D.s6 + (rotate(D.s3, (uint)26) ^ rotate(D.s3, (uint)21) ^ rotate(D.s3, (uint)7)) + bitselect(D.s5, D.s4, D.s3) + (0x12835B01 + N);
    D.s2 += C;
    D.s6 = C + (rotate(D.s7, (uint)30) ^ rotate(D.s7, (uint)19) ^ rotate(D.s7, (uint)10)) + bitselect(D.s1, D.s7, D.s1 ^ D.s0);
  };
  {
    C = D.s5 + (rotate(D.s2, (uint)26) ^ rotate(D.s2, (uint)21) ^ rotate(D.s2, (uint)7)) + bitselect(D.s4, D.s3, D.s2) + (0x243185BE + O);
    D.s1 += C;
    D.s5 = C + (rotate(D.s6, (uint)30) ^ rotate(D.s6, (uint)19) ^ rotate(D.s6, (uint)10)) + bitselect(D.s0, D.s6, D.s0 ^ D.s7);
  };
  {
    C = D.s4 + (rotate(D.s1, (uint)26) ^ rotate(D.s1, (uint)21) ^ rotate(D.s1, (uint)7)) + bitselect(D.s3, D.s2, D.s1) + (0x550C7DC3 + P);
    D.s0 += C;
    D.s4 = C + (rotate(D.s5, (uint)30) ^ rotate(D.s5, (uint)19) ^ rotate(D.s5, (uint)10)) + bitselect(D.s7, D.s5, D.s7 ^ D.s6);
  };
  {
    C = D.s3 + (rotate(D.s0, (uint)26) ^ rotate(D.s0, (uint)21) ^ rotate(D.s0, (uint)7)) + bitselect(D.s2, D.s1, D.s0) + (0x72BE5D74 + Q);
    D.s7 += C;
    D.s3 = C + (rotate(D.s4, (uint)30) ^ rotate(D.s4, (uint)19) ^ rotate(D.s4, (uint)10)) + bitselect(D.s6, D.s4, D.s6 ^ D.s5);
  };
  {
    C = D.s2 + (rotate(D.s7, (uint)26) ^ rotate(D.s7, (uint)21) ^ rotate(D.s7, (uint)7)) + bitselect(D.s1, D.s0, D.s7) + (0x80DEB1FE + R);
    D.s6 += C;
    D.s2 = C + (rotate(D.s3, (uint)30) ^ rotate(D.s3, (uint)19) ^ rotate(D.s3, (uint)10)) + bitselect(D.s5, D.s3, D.s5 ^ D.s4);
  };
  {
    C = D.s1 + (rotate(D.s6, (uint)26) ^ rotate(D.s6, (uint)21) ^ rotate(D.s6, (uint)7)) + bitselect(D.s0, D.s7, D.s6) + (0x9BDC06A7 + S);
    D.s5 += C;
    D.s1 = C + (rotate(D.s2, (uint)30) ^ rotate(D.s2, (uint)19) ^ rotate(D.s2, (uint)10)) + bitselect(D.s4, D.s2, D.s4 ^ D.s3);
  };
  {
    C = D.s0 + (rotate(D.s5, (uint)26) ^ rotate(D.s5, (uint)21) ^ rotate(D.s5, (uint)7)) + bitselect(D.s7, D.s6, D.s5) + (0xC19BF174 + T);
    D.s4 += C;
    D.s0 = C + (rotate(D.s1, (uint)30) ^ rotate(D.s1, (uint)19) ^ rotate(D.s1, (uint)10)) + bitselect(D.s3, D.s1, D.s3 ^ D.s2);
  };

  {
    C = D.s7 + (rotate(D.s4, (uint)26) ^ rotate(D.s4, (uint)21) ^ rotate(D.s4, (uint)7)) + bitselect(D.s6, D.s5, D.s4) + (0xE49B69C1 + (E = (rotate(S, (uint)15) ^ rotate(S, (uint)13) ^ ((S) >> 10)) + N + (rotate(F, (uint)25) ^ rotate(F, (uint)14) ^ ((F) >> 3)) + E));
    D.s3 += C;
    D.s7 = C + (rotate(D.s0, (uint)30) ^ rotate(D.s0, (uint)19) ^ rotate(D.s0, (uint)10)) + bitselect(D.s2, D.s0, D.s2 ^ D.s1);
  };
  {
    C = D.s6 + (rotate(D.s3, (uint)26) ^ rotate(D.s3, (uint)21) ^ rotate(D.s3, (uint)7)) + bitselect(D.s5, D.s4, D.s3) + (0xEFBE4786 + (F = (rotate(T, (uint)15) ^ rotate(T, (uint)13) ^ ((T) >> 10)) + O + (rotate(G, (uint)25) ^ rotate(G, (uint)14) ^ ((G) >> 3)) + F));
    D.s2 += C;
    D.s6 = C + (rotate(D.s7, (uint)30) ^ rotate(D.s7, (uint)19) ^ rotate(D.s7, (uint)10)) + bitselect(D.s1, D.s7, D.s1 ^ D.s0);
  };
  {
    C = D.s5 + (rotate(D.s2, (uint)26) ^ rotate(D.s2, (uint)21) ^ rotate(D.s2, (uint)7)) + bitselect(D.s4, D.s3, D.s2) + (0x0FC19DC6 + (G = (rotate(E, (uint)15) ^ rotate(E, (uint)13) ^ ((E) >> 10)) + P + (rotate(H, (uint)25) ^ rotate(H, (uint)14) ^ ((H) >> 3)) + G));
    D.s1 += C;
    D.s5 = C + (rotate(D.s6, (uint)30) ^ rotate(D.s6, (uint)19) ^ rotate(D.s6, (uint)10)) + bitselect(D.s0, D.s6, D.s0 ^ D.s7);
  };
  {
    C = D.s4 + (rotate(D.s1, (uint)26) ^ rotate(D.s1, (uint)21) ^ rotate(D.s1, (uint)7)) + bitselect(D.s3, D.s2, D.s1) + (0x240CA1CC + (H = (rotate(F, (uint)15) ^ rotate(F, (uint)13) ^ ((F) >> 10)) + Q + (rotate(I, (uint)25) ^ rotate(I, (uint)14) ^ ((I) >> 3)) + H));
    D.s0 += C;
    D.s4 = C + (rotate(D.s5, (uint)30) ^ rotate(D.s5, (uint)19) ^ rotate(D.s5, (uint)10)) + bitselect(D.s7, D.s5, D.s7 ^ D.s6);
  };
  {
    C = D.s3 + (rotate(D.s0, (uint)26) ^ rotate(D.s0, (uint)21) ^ rotate(D.s0, (uint)7)) + bitselect(D.s2, D.s1, D.s0) + (0x2DE92C6F + (I = (rotate(G, (uint)15) ^ rotate(G, (uint)13) ^ ((G) >> 10)) + R + (rotate(J, (uint)25) ^ rotate(J, (uint)14) ^ ((J) >> 3)) + I));
    D.s7 += C;
    D.s3 = C + (rotate(D.s4, (uint)30) ^ rotate(D.s4, (uint)19) ^ rotate(D.s4, (uint)10)) + bitselect(D.s6, D.s4, D.s6 ^ D.s5);
  };
  {
    C = D.s2 + (rotate(D.s7, (uint)26) ^ rotate(D.s7, (uint)21) ^ rotate(D.s7, (uint)7)) + bitselect(D.s1, D.s0, D.s7) + (0x4A7484AA + (J = (rotate(H, (uint)15) ^ rotate(H, (uint)13) ^ ((H) >> 10)) + S + (rotate(K, (uint)25) ^ rotate(K, (uint)14) ^ ((K) >> 3)) + J));
    D.s6 += C;
    D.s2 = C + (rotate(D.s3, (uint)30) ^ rotate(D.s3, (uint)19) ^ rotate(D.s3, (uint)10)) + bitselect(D.s5, D.s3, D.s5 ^ D.s4);
  };
  {
    C = D.s1 + (rotate(D.s6, (uint)26) ^ rotate(D.s6, (uint)21) ^ rotate(D.s6, (uint)7)) + bitselect(D.s0, D.s7, D.s6) + (0x5CB0A9DC + (K = (rotate(I, (uint)15) ^ rotate(I, (uint)13) ^ ((I) >> 10)) + T + (rotate(L, (uint)25) ^ rotate(L, (uint)14) ^ ((L) >> 3)) + K));
    D.s5 += C;
    D.s1 = C + (rotate(D.s2, (uint)30) ^ rotate(D.s2, (uint)19) ^ rotate(D.s2, (uint)10)) + bitselect(D.s4, D.s2, D.s4 ^ D.s3);
  };
  {
    C = D.s0 + (rotate(D.s5, (uint)26) ^ rotate(D.s5, (uint)21) ^ rotate(D.s5, (uint)7)) + bitselect(D.s7, D.s6, D.s5) + (0x76F988DA + (L = (rotate(J, (uint)15) ^ rotate(J, (uint)13) ^ ((J) >> 10)) + E + (rotate(M, (uint)25) ^ rotate(M, (uint)14) ^ ((M) >> 3)) + L));
    D.s4 += C;
    D.s0 = C + (rotate(D.s1, (uint)30) ^ rotate(D.s1, (uint)19) ^ rotate(D.s1, (uint)10)) + bitselect(D.s3, D.s1, D.s3 ^ D.s2);
  };
  {
    C = D.s7 + (rotate(D.s4, (uint)26) ^ rotate(D.s4, (uint)21) ^ rotate(D.s4, (uint)7)) + bitselect(D.s6, D.s5, D.s4) + (0x983E5152 + (M = (rotate(K, (uint)15) ^ rotate(K, (uint)13) ^ ((K) >> 10)) + F + (rotate(N, (uint)25) ^ rotate(N, (uint)14) ^ ((N) >> 3)) + M));
    D.s3 += C;
    D.s7 = C + (rotate(D.s0, (uint)30) ^ rotate(D.s0, (uint)19) ^ rotate(D.s0, (uint)10)) + bitselect(D.s2, D.s0, D.s2 ^ D.s1);
  };
  {
    C = D.s6 + (rotate(D.s3, (uint)26) ^ rotate(D.s3, (uint)21) ^ rotate(D.s3, (uint)7)) + bitselect(D.s5, D.s4, D.s3) + (0xA831C66D + (N = (rotate(L, (uint)15) ^ rotate(L, (uint)13) ^ ((L) >> 10)) + G + (rotate(O, (uint)25) ^ rotate(O, (uint)14) ^ ((O) >> 3)) + N));
    D.s2 += C;
    D.s6 = C + (rotate(D.s7, (uint)30) ^ rotate(D.s7, (uint)19) ^ rotate(D.s7, (uint)10)) + bitselect(D.s1, D.s7, D.s1 ^ D.s0);
  };
  {
    C = D.s5 + (rotate(D.s2, (uint)26) ^ rotate(D.s2, (uint)21) ^ rotate(D.s2, (uint)7)) + bitselect(D.s4, D.s3, D.s2) + (0xB00327C8 + (O = (rotate(M, (uint)15) ^ rotate(M, (uint)13) ^ ((M) >> 10)) + H + (rotate(P, (uint)25) ^ rotate(P, (uint)14) ^ ((P) >> 3)) + O));
    D.s1 += C;
    D.s5 = C + (rotate(D.s6, (uint)30) ^ rotate(D.s6, (uint)19) ^ rotate(D.s6, (uint)10)) + bitselect(D.s0, D.s6, D.s0 ^ D.s7);
  };
  {
    C = D.s4 + (rotate(D.s1, (uint)26) ^ rotate(D.s1, (uint)21) ^ rotate(D.s1, (uint)7)) + bitselect(D.s3, D.s2, D.s1) + (0xBF597FC7 + (P = (rotate(N, (uint)15) ^ rotate(N, (uint)13) ^ ((N) >> 10)) + I + (rotate(Q, (uint)25) ^ rotate(Q, (uint)14) ^ ((Q) >> 3)) + P));
    D.s0 += C;
    D.s4 = C + (rotate(D.s5, (uint)30) ^ rotate(D.s5, (uint)19) ^ rotate(D.s5, (uint)10)) + bitselect(D.s7, D.s5, D.s7 ^ D.s6);
  };
  {
    C = D.s3 + (rotate(D.s0, (uint)26) ^ rotate(D.s0, (uint)21) ^ rotate(D.s0, (uint)7)) + bitselect(D.s2, D.s1, D.s0) + (0xC6E00BF3 + (Q = (rotate(O, (uint)15) ^ rotate(O, (uint)13) ^ ((O) >> 10)) + J + (rotate(R, (uint)25) ^ rotate(R, (uint)14) ^ ((R) >> 3)) + Q));
    D.s7 += C;
    D.s3 = C + (rotate(D.s4, (uint)30) ^ rotate(D.s4, (uint)19) ^ rotate(D.s4, (uint)10)) + bitselect(D.s6, D.s4, D.s6 ^ D.s5);
  };
  {
    C = D.s2 + (rotate(D.s7, (uint)26) ^ rotate(D.s7, (uint)21) ^ rotate(D.s7, (uint)7)) + bitselect(D.s1, D.s0, D.s7) + (0xD5A79147 + (R = (rotate(P, (uint)15) ^ rotate(P, (uint)13) ^ ((P) >> 10)) + K + (rotate(S, (uint)25) ^ rotate(S, (uint)14) ^ ((S) >> 3)) + R));
    D.s6 += C;
    D.s2 = C + (rotate(D.s3, (uint)30) ^ rotate(D.s3, (uint)19) ^ rotate(D.s3, (uint)10)) + bitselect(D.s5, D.s3, D.s5 ^ D.s4);
  };
  {
    C = D.s1 + (rotate(D.s6, (uint)26) ^ rotate(D.s6, (uint)21) ^ rotate(D.s6, (uint)7)) + bitselect(D.s0, D.s7, D.s6) + (0x06CA6351 + (S = (rotate(Q, (uint)15) ^ rotate(Q, (uint)13) ^ ((Q) >> 10)) + L + (rotate(T, (uint)25) ^ rotate(T, (uint)14) ^ ((T) >> 3)) + S));
    D.s5 += C;
    D.s1 = C + (rotate(D.s2, (uint)30) ^ rotate(D.s2, (uint)19) ^ rotate(D.s2, (uint)10)) + bitselect(D.s4, D.s2, D.s4 ^ D.s3);
  };
  {
    C = D.s0 + (rotate(D.s5, (uint)26) ^ rotate(D.s5, (uint)21) ^ rotate(D.s5, (uint)7)) + bitselect(D.s7, D.s6, D.s5) + (0x14292967 + (T = (rotate(R, (uint)15) ^ rotate(R, (uint)13) ^ ((R) >> 10)) + M + (rotate(E, (uint)25) ^ rotate(E, (uint)14) ^ ((E) >> 3)) + T));
    D.s4 += C;
    D.s0 = C + (rotate(D.s1, (uint)30) ^ rotate(D.s1, (uint)19) ^ rotate(D.s1, (uint)10)) + bitselect(D.s3, D.s1, D.s3 ^ D.s2);
  };

  {
    C = D.s7 + (rotate(D.s4, (uint)26) ^ rotate(D.s4, (uint)21) ^ rotate(D.s4, (uint)7)) + bitselect(D.s6, D.s5, D.s4) + (0x27B70A85 + (E = (rotate(S, (uint)15) ^ rotate(S, (uint)13) ^ ((S) >> 10)) + N + (rotate(F, (uint)25) ^ rotate(F, (uint)14) ^ ((F) >> 3)) + E));
    D.s3 += C;
    D.s7 = C + (rotate(D.s0, (uint)30) ^ rotate(D.s0, (uint)19) ^ rotate(D.s0, (uint)10)) + bitselect(D.s2, D.s0, D.s2 ^ D.s1);
  };
  {
    C = D.s6 + (rotate(D.s3, (uint)26) ^ rotate(D.s3, (uint)21) ^ rotate(D.s3, (uint)7)) + bitselect(D.s5, D.s4, D.s3) + (0x2E1B2138 + (F = (rotate(T, (uint)15) ^ rotate(T, (uint)13) ^ ((T) >> 10)) + O + (rotate(G, (uint)25) ^ rotate(G, (uint)14) ^ ((G) >> 3)) + F));
    D.s2 += C;
    D.s6 = C + (rotate(D.s7, (uint)30) ^ rotate(D.s7, (uint)19) ^ rotate(D.s7, (uint)10)) + bitselect(D.s1, D.s7, D.s1 ^ D.s0);
  };
  {
    C = D.s5 + (rotate(D.s2, (uint)26) ^ rotate(D.s2, (uint)21) ^ rotate(D.s2, (uint)7)) + bitselect(D.s4, D.s3, D.s2) + (0x4D2C6DFC + (G = (rotate(E, (uint)15) ^ rotate(E, (uint)13) ^ ((E) >> 10)) + P + (rotate(H, (uint)25) ^ rotate(H, (uint)14) ^ ((H) >> 3)) + G));
    D.s1 += C;
    D.s5 = C + (rotate(D.s6, (uint)30) ^ rotate(D.s6, (uint)19) ^ rotate(D.s6, (uint)10)) + bitselect(D.s0, D.s6, D.s0 ^ D.s7);
  };
  {
    C = D.s4 + (rotate(D.s1, (uint)26) ^ rotate(D.s1, (uint)21) ^ rotate(D.s1, (uint)7)) + bitselect(D.s3, D.s2, D.s1) + (0x53380D13 + (H = (rotate(F, (uint)15) ^ rotate(F, (uint)13) ^ ((F) >> 10)) + Q + (rotate(I, (uint)25) ^ rotate(I, (uint)14) ^ ((I) >> 3)) + H));
    D.s0 += C;
    D.s4 = C + (rotate(D.s5, (uint)30) ^ rotate(D.s5, (uint)19) ^ rotate(D.s5, (uint)10)) + bitselect(D.s7, D.s5, D.s7 ^ D.s6);
  };
  {
    C = D.s3 + (rotate(D.s0, (uint)26) ^ rotate(D.s0, (uint)21) ^ rotate(D.s0, (uint)7)) + bitselect(D.s2, D.s1, D.s0) + (0x650A7354 + (I = (rotate(G, (uint)15) ^ rotate(G, (uint)13) ^ ((G) >> 10)) + R + (rotate(J, (uint)25) ^ rotate(J, (uint)14) ^ ((J) >> 3)) + I));
    D.s7 += C;
    D.s3 = C + (rotate(D.s4, (uint)30) ^ rotate(D.s4, (uint)19) ^ rotate(D.s4, (uint)10)) + bitselect(D.s6, D.s4, D.s6 ^ D.s5);
  };
  {
    C = D.s2 + (rotate(D.s7, (uint)26) ^ rotate(D.s7, (uint)21) ^ rotate(D.s7, (uint)7)) + bitselect(D.s1, D.s0, D.s7) + (0x766A0ABB + (J = (rotate(H, (uint)15) ^ rotate(H, (uint)13) ^ ((H) >> 10)) + S + (rotate(K, (uint)25) ^ rotate(K, (uint)14) ^ ((K) >> 3)) + J));
    D.s6 += C;
    D.s2 = C + (rotate(D.s3, (uint)30) ^ rotate(D.s3, (uint)19) ^ rotate(D.s3, (uint)10)) + bitselect(D.s5, D.s3, D.s5 ^ D.s4);
  };
  {
    C = D.s1 + (rotate(D.s6, (uint)26) ^ rotate(D.s6, (uint)21) ^ rotate(D.s6, (uint)7)) + bitselect(D.s0, D.s7, D.s6) + (0x81C2C92E + (K = (rotate(I, (uint)15) ^ rotate(I, (uint)13) ^ ((I) >> 10)) + T + (rotate(L, (uint)25) ^ rotate(L, (uint)14) ^ ((L) >> 3)) + K));
    D.s5 += C;
    D.s1 = C + (rotate(D.s2, (uint)30) ^ rotate(D.s2, (uint)19) ^ rotate(D.s2, (uint)10)) + bitselect(D.s4, D.s2, D.s4 ^ D.s3);
  };
  {
    C = D.s0 + (rotate(D.s5, (uint)26) ^ rotate(D.s5, (uint)21) ^ rotate(D.s5, (uint)7)) + bitselect(D.s7, D.s6, D.s5) + (0x92722C85 + (L = (rotate(J, (uint)15) ^ rotate(J, (uint)13) ^ ((J) >> 10)) + E + (rotate(M, (uint)25) ^ rotate(M, (uint)14) ^ ((M) >> 3)) + L));
    D.s4 += C;
    D.s0 = C + (rotate(D.s1, (uint)30) ^ rotate(D.s1, (uint)19) ^ rotate(D.s1, (uint)10)) + bitselect(D.s3, D.s1, D.s3 ^ D.s2);
  };
  {
    C = D.s7 + (rotate(D.s4, (uint)26) ^ rotate(D.s4, (uint)21) ^ rotate(D.s4, (uint)7)) + bitselect(D.s6, D.s5, D.s4) + (0xA2BFE8A1 + (M = (rotate(K, (uint)15) ^ rotate(K, (uint)13) ^ ((K) >> 10)) + F + (rotate(N, (uint)25) ^ rotate(N, (uint)14) ^ ((N) >> 3)) + M));
    D.s3 += C;
    D.s7 = C + (rotate(D.s0, (uint)30) ^ rotate(D.s0, (uint)19) ^ rotate(D.s0, (uint)10)) + bitselect(D.s2, D.s0, D.s2 ^ D.s1);
  };
  {
    C = D.s6 + (rotate(D.s3, (uint)26) ^ rotate(D.s3, (uint)21) ^ rotate(D.s3, (uint)7)) + bitselect(D.s5, D.s4, D.s3) + (0xA81A664B + (N = (rotate(L, (uint)15) ^ rotate(L, (uint)13) ^ ((L) >> 10)) + G + (rotate(O, (uint)25) ^ rotate(O, (uint)14) ^ ((O) >> 3)) + N));
    D.s2 += C;
    D.s6 = C + (rotate(D.s7, (uint)30) ^ rotate(D.s7, (uint)19) ^ rotate(D.s7, (uint)10)) + bitselect(D.s1, D.s7, D.s1 ^ D.s0);
  };
  {
    C = D.s5 + (rotate(D.s2, (uint)26) ^ rotate(D.s2, (uint)21) ^ rotate(D.s2, (uint)7)) + bitselect(D.s4, D.s3, D.s2) + (0xC24B8B70 + (O = (rotate(M, (uint)15) ^ rotate(M, (uint)13) ^ ((M) >> 10)) + H + (rotate(P, (uint)25) ^ rotate(P, (uint)14) ^ ((P) >> 3)) + O));
    D.s1 += C;
    D.s5 = C + (rotate(D.s6, (uint)30) ^ rotate(D.s6, (uint)19) ^ rotate(D.s6, (uint)10)) + bitselect(D.s0, D.s6, D.s0 ^ D.s7);
  };
  {
    C = D.s4 + (rotate(D.s1, (uint)26) ^ rotate(D.s1, (uint)21) ^ rotate(D.s1, (uint)7)) + bitselect(D.s3, D.s2, D.s1) + (0xC76C51A3 + (P = (rotate(N, (uint)15) ^ rotate(N, (uint)13) ^ ((N) >> 10)) + I + (rotate(Q, (uint)25) ^ rotate(Q, (uint)14) ^ ((Q) >> 3)) + P));
    D.s0 += C;
    D.s4 = C + (rotate(D.s5, (uint)30) ^ rotate(D.s5, (uint)19) ^ rotate(D.s5, (uint)10)) + bitselect(D.s7, D.s5, D.s7 ^ D.s6);
  };
  {
    C = D.s3 + (rotate(D.s0, (uint)26) ^ rotate(D.s0, (uint)21) ^ rotate(D.s0, (uint)7)) + bitselect(D.s2, D.s1, D.s0) + (0xD192E819 + (Q = (rotate(O, (uint)15) ^ rotate(O, (uint)13) ^ ((O) >> 10)) + J + (rotate(R, (uint)25) ^ rotate(R, (uint)14) ^ ((R) >> 3)) + Q));
    D.s7 += C;
    D.s3 = C + (rotate(D.s4, (uint)30) ^ rotate(D.s4, (uint)19) ^ rotate(D.s4, (uint)10)) + bitselect(D.s6, D.s4, D.s6 ^ D.s5);
  };
  {
    C = D.s2 + (rotate(D.s7, (uint)26) ^ rotate(D.s7, (uint)21) ^ rotate(D.s7, (uint)7)) + bitselect(D.s1, D.s0, D.s7) + (0xD6990624 + (R = (rotate(P, (uint)15) ^ rotate(P, (uint)13) ^ ((P) >> 10)) + K + (rotate(S, (uint)25) ^ rotate(S, (uint)14) ^ ((S) >> 3)) + R));
    D.s6 += C;
    D.s2 = C + (rotate(D.s3, (uint)30) ^ rotate(D.s3, (uint)19) ^ rotate(D.s3, (uint)10)) + bitselect(D.s5, D.s3, D.s5 ^ D.s4);
  };
  {
    C = D.s1 + (rotate(D.s6, (uint)26) ^ rotate(D.s6, (uint)21) ^ rotate(D.s6, (uint)7)) + bitselect(D.s0, D.s7, D.s6) + (0xF40E3585 + (S = (rotate(Q, (uint)15) ^ rotate(Q, (uint)13) ^ ((Q) >> 10)) + L + (rotate(T, (uint)25) ^ rotate(T, (uint)14) ^ ((T) >> 3)) + S));
    D.s5 += C;
    D.s1 = C + (rotate(D.s2, (uint)30) ^ rotate(D.s2, (uint)19) ^ rotate(D.s2, (uint)10)) + bitselect(D.s4, D.s2, D.s4 ^ D.s3);
  };
  {
    C = D.s0 + (rotate(D.s5, (uint)26) ^ rotate(D.s5, (uint)21) ^ rotate(D.s5, (uint)7)) + bitselect(D.s7, D.s6, D.s5) + (0x106AA070 + (T = (rotate(R, (uint)15) ^ rotate(R, (uint)13) ^ ((R) >> 10)) + M + (rotate(E, (uint)25) ^ rotate(E, (uint)14) ^ ((E) >> 3)) + T));
    D.s4 += C;
    D.s0 = C + (rotate(D.s1, (uint)30) ^ rotate(D.s1, (uint)19) ^ rotate(D.s1, (uint)10)) + bitselect(D.s3, D.s1, D.s3 ^ D.s2);
  };

  {
    C = D.s7 + (rotate(D.s4, (uint)26) ^ rotate(D.s4, (uint)21) ^ rotate(D.s4, (uint)7)) + bitselect(D.s6, D.s5, D.s4) + (0x19A4C116 + (E = (rotate(S, (uint)15) ^ rotate(S, (uint)13) ^ ((S) >> 10)) + N + (rotate(F, (uint)25) ^ rotate(F, (uint)14) ^ ((F) >> 3)) + E));
    D.s3 += C;
    D.s7 = C + (rotate(D.s0, (uint)30) ^ rotate(D.s0, (uint)19) ^ rotate(D.s0, (uint)10)) + bitselect(D.s2, D.s0, D.s2 ^ D.s1);
  };
  {
    C = D.s6 + (rotate(D.s3, (uint)26) ^ rotate(D.s3, (uint)21) ^ rotate(D.s3, (uint)7)) + bitselect(D.s5, D.s4, D.s3) + (0x1E376C08 + (F = (rotate(T, (uint)15) ^ rotate(T, (uint)13) ^ ((T) >> 10)) + O + (rotate(G, (uint)25) ^ rotate(G, (uint)14) ^ ((G) >> 3)) + F));
    D.s2 += C;
    D.s6 = C + (rotate(D.s7, (uint)30) ^ rotate(D.s7, (uint)19) ^ rotate(D.s7, (uint)10)) + bitselect(D.s1, D.s7, D.s1 ^ D.s0);
  };
  {
    C = D.s5 + (rotate(D.s2, (uint)26) ^ rotate(D.s2, (uint)21) ^ rotate(D.s2, (uint)7)) + bitselect(D.s4, D.s3, D.s2) + (0x2748774C + (G = (rotate(E, (uint)15) ^ rotate(E, (uint)13) ^ ((E) >> 10)) + P + (rotate(H, (uint)25) ^ rotate(H, (uint)14) ^ ((H) >> 3)) + G));
    D.s1 += C;
    D.s5 = C + (rotate(D.s6, (uint)30) ^ rotate(D.s6, (uint)19) ^ rotate(D.s6, (uint)10)) + bitselect(D.s0, D.s6, D.s0 ^ D.s7);
  };
  {
    C = D.s4 + (rotate(D.s1, (uint)26) ^ rotate(D.s1, (uint)21) ^ rotate(D.s1, (uint)7)) + bitselect(D.s3, D.s2, D.s1) + (0x34B0BCB5 + (H = (rotate(F, (uint)15) ^ rotate(F, (uint)13) ^ ((F) >> 10)) + Q + (rotate(I, (uint)25) ^ rotate(I, (uint)14) ^ ((I) >> 3)) + H));
    D.s0 += C;
    D.s4 = C + (rotate(D.s5, (uint)30) ^ rotate(D.s5, (uint)19) ^ rotate(D.s5, (uint)10)) + bitselect(D.s7, D.s5, D.s7 ^ D.s6);
  };
  {
    C = D.s3 + (rotate(D.s0, (uint)26) ^ rotate(D.s0, (uint)21) ^ rotate(D.s0, (uint)7)) + bitselect(D.s2, D.s1, D.s0) + (0x391C0CB3 + (I = (rotate(G, (uint)15) ^ rotate(G, (uint)13) ^ ((G) >> 10)) + R + (rotate(J, (uint)25) ^ rotate(J, (uint)14) ^ ((J) >> 3)) + I));
    D.s7 += C;
    D.s3 = C + (rotate(D.s4, (uint)30) ^ rotate(D.s4, (uint)19) ^ rotate(D.s4, (uint)10)) + bitselect(D.s6, D.s4, D.s6 ^ D.s5);
  };
  {
    C = D.s2 + (rotate(D.s7, (uint)26) ^ rotate(D.s7, (uint)21) ^ rotate(D.s7, (uint)7)) + bitselect(D.s1, D.s0, D.s7) + (0x4ED8AA4A + (J = (rotate(H, (uint)15) ^ rotate(H, (uint)13) ^ ((H) >> 10)) + S + (rotate(K, (uint)25) ^ rotate(K, (uint)14) ^ ((K) >> 3)) + J));
    D.s6 += C;
    D.s2 = C + (rotate(D.s3, (uint)30) ^ rotate(D.s3, (uint)19) ^ rotate(D.s3, (uint)10)) + bitselect(D.s5, D.s3, D.s5 ^ D.s4);
  };
  {
    C = D.s1 + (rotate(D.s6, (uint)26) ^ rotate(D.s6, (uint)21) ^ rotate(D.s6, (uint)7)) + bitselect(D.s0, D.s7, D.s6) + (0x5B9CCA4F + (K = (rotate(I, (uint)15) ^ rotate(I, (uint)13) ^ ((I) >> 10)) + T + (rotate(L, (uint)25) ^ rotate(L, (uint)14) ^ ((L) >> 3)) + K));
    D.s5 += C;
    D.s1 = C + (rotate(D.s2, (uint)30) ^ rotate(D.s2, (uint)19) ^ rotate(D.s2, (uint)10)) + bitselect(D.s4, D.s2, D.s4 ^ D.s3);
  };
  {
    C = D.s0 + (rotate(D.s5, (uint)26) ^ rotate(D.s5, (uint)21) ^ rotate(D.s5, (uint)7)) + bitselect(D.s7, D.s6, D.s5) + (0x682E6FF3 + (L = (rotate(J, (uint)15) ^ rotate(J, (uint)13) ^ ((J) >> 10)) + E + (rotate(M, (uint)25) ^ rotate(M, (uint)14) ^ ((M) >> 3)) + L));
    D.s4 += C;
    D.s0 = C + (rotate(D.s1, (uint)30) ^ rotate(D.s1, (uint)19) ^ rotate(D.s1, (uint)10)) + bitselect(D.s3, D.s1, D.s3 ^ D.s2);
  };
  {
    C = D.s7 + (rotate(D.s4, (uint)26) ^ rotate(D.s4, (uint)21) ^ rotate(D.s4, (uint)7)) + bitselect(D.s6, D.s5, D.s4) + (0x748F82EE + (M = (rotate(K, (uint)15) ^ rotate(K, (uint)13) ^ ((K) >> 10)) + F + (rotate(N, (uint)25) ^ rotate(N, (uint)14) ^ ((N) >> 3)) + M));
    D.s3 += C;
    D.s7 = C + (rotate(D.s0, (uint)30) ^ rotate(D.s0, (uint)19) ^ rotate(D.s0, (uint)10)) + bitselect(D.s2, D.s0, D.s2 ^ D.s1);
  };
  {
    C = D.s6 + (rotate(D.s3, (uint)26) ^ rotate(D.s3, (uint)21) ^ rotate(D.s3, (uint)7)) + bitselect(D.s5, D.s4, D.s3) + (0x78A5636F + (N = (rotate(L, (uint)15) ^ rotate(L, (uint)13) ^ ((L) >> 10)) + G + (rotate(O, (uint)25) ^ rotate(O, (uint)14) ^ ((O) >> 3)) + N));
    D.s2 += C;
    D.s6 = C + (rotate(D.s7, (uint)30) ^ rotate(D.s7, (uint)19) ^ rotate(D.s7, (uint)10)) + bitselect(D.s1, D.s7, D.s1 ^ D.s0);
  };
  {
    C = D.s5 + (rotate(D.s2, (uint)26) ^ rotate(D.s2, (uint)21) ^ rotate(D.s2, (uint)7)) + bitselect(D.s4, D.s3, D.s2) + (0x84C87814 + (O = (rotate(M, (uint)15) ^ rotate(M, (uint)13) ^ ((M) >> 10)) + H + (rotate(P, (uint)25) ^ rotate(P, (uint)14) ^ ((P) >> 3)) + O));
    D.s1 += C;
    D.s5 = C + (rotate(D.s6, (uint)30) ^ rotate(D.s6, (uint)19) ^ rotate(D.s6, (uint)10)) + bitselect(D.s0, D.s6, D.s0 ^ D.s7);
  };
  {
    C = D.s4 + (rotate(D.s1, (uint)26) ^ rotate(D.s1, (uint)21) ^ rotate(D.s1, (uint)7)) + bitselect(D.s3, D.s2, D.s1) + (0x8CC70208 + (P = (rotate(N, (uint)15) ^ rotate(N, (uint)13) ^ ((N) >> 10)) + I + (rotate(Q, (uint)25) ^ rotate(Q, (uint)14) ^ ((Q) >> 3)) + P));
    D.s0 += C;
    D.s4 = C + (rotate(D.s5, (uint)30) ^ rotate(D.s5, (uint)19) ^ rotate(D.s5, (uint)10)) + bitselect(D.s7, D.s5, D.s7 ^ D.s6);
  };
  {
    C = D.s3 + (rotate(D.s0, (uint)26) ^ rotate(D.s0, (uint)21) ^ rotate(D.s0, (uint)7)) + bitselect(D.s2, D.s1, D.s0) + (0x90BEFFFA + (Q = (rotate(O, (uint)15) ^ rotate(O, (uint)13) ^ ((O) >> 10)) + J + (rotate(R, (uint)25) ^ rotate(R, (uint)14) ^ ((R) >> 3)) + Q));
    D.s7 += C;
    D.s3 = C + (rotate(D.s4, (uint)30) ^ rotate(D.s4, (uint)19) ^ rotate(D.s4, (uint)10)) + bitselect(D.s6, D.s4, D.s6 ^ D.s5);
  };
  {
    C = D.s2 + (rotate(D.s7, (uint)26) ^ rotate(D.s7, (uint)21) ^ rotate(D.s7, (uint)7)) + bitselect(D.s1, D.s0, D.s7) + (0xA4506CEB + (R = (rotate(P, (uint)15) ^ rotate(P, (uint)13) ^ ((P) >> 10)) + K + (rotate(S, (uint)25) ^ rotate(S, (uint)14) ^ ((S) >> 3)) + R));
    D.s6 += C;
    D.s2 = C + (rotate(D.s3, (uint)30) ^ rotate(D.s3, (uint)19) ^ rotate(D.s3, (uint)10)) + bitselect(D.s5, D.s3, D.s5 ^ D.s4);
  };
  {
    C = D.s1 + (rotate(D.s6, (uint)26) ^ rotate(D.s6, (uint)21) ^ rotate(D.s6, (uint)7)) + bitselect(D.s0, D.s7, D.s6) + (0xBEF9A3F7 + ((rotate(Q, (uint)15) ^ rotate(Q, (uint)13) ^ ((Q) >> 10)) + L + (rotate(T, (uint)25) ^ rotate(T, (uint)14) ^ ((T) >> 3)) + S));
    D.s5 += C;
    D.s1 = C + (rotate(D.s2, (uint)30) ^ rotate(D.s2, (uint)19) ^ rotate(D.s2, (uint)10)) + bitselect(D.s4, D.s2, D.s4 ^ D.s3);
  };
  {
    C = D.s0 + (rotate(D.s5, (uint)26) ^ rotate(D.s5, (uint)21) ^ rotate(D.s5, (uint)7)) + bitselect(D.s7, D.s6, D.s5) + (0xC67178F2 + ((rotate(R, (uint)15) ^ rotate(R, (uint)13) ^ ((R) >> 10)) + M + (rotate(E, (uint)25) ^ rotate(E, (uint)14) ^ ((E) >> 3)) + T));
    D.s4 += C;
    D.s0 = C + (rotate(D.s1, (uint)30) ^ rotate(D.s1, (uint)19) ^ rotate(D.s1, (uint)10)) + bitselect(D.s3, D.s1, D.s3 ^ D.s2);
  };
  return (D + B);
}

inline uint8 fn_L(uint16 A) {
  uint B;
  uint8 C;
  uint D = A.s0;
  uint E = A.s1;
  uint F = A.s2;
  uint G = A.s3;
  uint H = A.s4;
  uint I = A.s5;
  uint J = A.s6;
  uint K = A.s7;
  uint L = A.s8;
  uint M = A.s9;
  uint N = A.sA;
  uint O = A.sB;
  uint P = A.sC;
  uint Q = A.sD;
  uint R = A.sE;
  uint S = A.sF;

  uint T = 0x6A09E667;
  uint U = 0xBB67AE85;
  uint V = 0x3C6EF372;
  uint W = 0xA54FF53A;
  uint X = 0x510E527F;
  uint Y = 0x9B05688C;
  uint Z = 0x1F83D9AB;
  uint AA = 0x5BE0CD19;

  {
    B = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0x428A2F98 + D);
    W += B;
    AA = B + (rotate(T, (uint)30) ^ rotate(T, (uint)19) ^ rotate(T, (uint)10)) + bitselect(V, T, V ^ U);
  };
  {
    B = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0x71374491 + E);
    V += B;
    Z = B + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ T);
  };
  {
    B = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0xB5C0FBCF + F);
    U += B;
    Y = B + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(T, Z, T ^ AA);
  };
  {
    B = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0xE9B5DBA5 + G);
    T += B;
    X = B + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    B = W + (rotate(T, (uint)26) ^ rotate(T, (uint)21) ^ rotate(T, (uint)7)) + bitselect(V, U, T) + (0x3956C25B + H);
    AA += B;
    W = B + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    B = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, T, AA) + (0x59F111F1 + I);
    Z += B;
    V = B + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    B = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(T, AA, Z) + (0x923F82A4 + J);
    Y += B;
    U = B + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    B = T + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0xAB1C5ED5 + K);
    X += B;
    T = B + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    B = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0xD807AA98 + L);
    W += B;
    AA = B + (rotate(T, (uint)30) ^ rotate(T, (uint)19) ^ rotate(T, (uint)10)) + bitselect(V, T, V ^ U);
  };
  {
    B = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0x12835B01 + M);
    V += B;
    Z = B + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ T);
  };
  {
    B = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0x243185BE + N);
    U += B;
    Y = B + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(T, Z, T ^ AA);
  };
  {
    B = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x550C7DC3 + O);
    T += B;
    X = B + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    B = W + (rotate(T, (uint)26) ^ rotate(T, (uint)21) ^ rotate(T, (uint)7)) + bitselect(V, U, T) + (0x72BE5D74 + P);
    AA += B;
    W = B + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    B = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, T, AA) + (0x80DEB1FE + Q);
    Z += B;
    V = B + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    B = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(T, AA, Z) + (0x9BDC06A7 + R);
    Y += B;
    U = B + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    B = T + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0xC19BF174 + S);
    X += B;
    T = B + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };

  {
    B = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0xE49B69C1 + (D = (rotate(R, (uint)15) ^ rotate(R, (uint)13) ^ ((R) >> 10)) + M + (rotate(E, (uint)25) ^ rotate(E, (uint)14) ^ ((E) >> 3)) + D));
    W += B;
    AA = B + (rotate(T, (uint)30) ^ rotate(T, (uint)19) ^ rotate(T, (uint)10)) + bitselect(V, T, V ^ U);
  };
  {
    B = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0xEFBE4786 + (E = (rotate(S, (uint)15) ^ rotate(S, (uint)13) ^ ((S) >> 10)) + N + (rotate(F, (uint)25) ^ rotate(F, (uint)14) ^ ((F) >> 3)) + E));
    V += B;
    Z = B + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ T);
  };
  {
    B = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0x0FC19DC6 + (F = (rotate(D, (uint)15) ^ rotate(D, (uint)13) ^ ((D) >> 10)) + O + (rotate(G, (uint)25) ^ rotate(G, (uint)14) ^ ((G) >> 3)) + F));
    U += B;
    Y = B + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(T, Z, T ^ AA);
  };
  {
    B = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x240CA1CC + (G = (rotate(E, (uint)15) ^ rotate(E, (uint)13) ^ ((E) >> 10)) + P + (rotate(H, (uint)25) ^ rotate(H, (uint)14) ^ ((H) >> 3)) + G));
    T += B;
    X = B + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    B = W + (rotate(T, (uint)26) ^ rotate(T, (uint)21) ^ rotate(T, (uint)7)) + bitselect(V, U, T) + (0x2DE92C6F + (H = (rotate(F, (uint)15) ^ rotate(F, (uint)13) ^ ((F) >> 10)) + Q + (rotate(I, (uint)25) ^ rotate(I, (uint)14) ^ ((I) >> 3)) + H));
    AA += B;
    W = B + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    B = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, T, AA) + (0x4A7484AA + (I = (rotate(G, (uint)15) ^ rotate(G, (uint)13) ^ ((G) >> 10)) + R + (rotate(J, (uint)25) ^ rotate(J, (uint)14) ^ ((J) >> 3)) + I));
    Z += B;
    V = B + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    B = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(T, AA, Z) + (0x5CB0A9DC + (J = (rotate(H, (uint)15) ^ rotate(H, (uint)13) ^ ((H) >> 10)) + S + (rotate(K, (uint)25) ^ rotate(K, (uint)14) ^ ((K) >> 3)) + J));
    Y += B;
    U = B + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    B = T + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0x76F988DA + (K = (rotate(I, (uint)15) ^ rotate(I, (uint)13) ^ ((I) >> 10)) + D + (rotate(L, (uint)25) ^ rotate(L, (uint)14) ^ ((L) >> 3)) + K));
    X += B;
    T = B + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    B = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0x983E5152 + (L = (rotate(J, (uint)15) ^ rotate(J, (uint)13) ^ ((J) >> 10)) + E + (rotate(M, (uint)25) ^ rotate(M, (uint)14) ^ ((M) >> 3)) + L));
    W += B;
    AA = B + (rotate(T, (uint)30) ^ rotate(T, (uint)19) ^ rotate(T, (uint)10)) + bitselect(V, T, V ^ U);
  };
  {
    B = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0xA831C66D + (M = (rotate(K, (uint)15) ^ rotate(K, (uint)13) ^ ((K) >> 10)) + F + (rotate(N, (uint)25) ^ rotate(N, (uint)14) ^ ((N) >> 3)) + M));
    V += B;
    Z = B + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ T);
  };
  {
    B = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0xB00327C8 + (N = (rotate(L, (uint)15) ^ rotate(L, (uint)13) ^ ((L) >> 10)) + G + (rotate(O, (uint)25) ^ rotate(O, (uint)14) ^ ((O) >> 3)) + N));
    U += B;
    Y = B + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(T, Z, T ^ AA);
  };
  {
    B = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0xBF597FC7 + (O = (rotate(M, (uint)15) ^ rotate(M, (uint)13) ^ ((M) >> 10)) + H + (rotate(P, (uint)25) ^ rotate(P, (uint)14) ^ ((P) >> 3)) + O));
    T += B;
    X = B + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    B = W + (rotate(T, (uint)26) ^ rotate(T, (uint)21) ^ rotate(T, (uint)7)) + bitselect(V, U, T) + (0xC6E00BF3 + (P = (rotate(N, (uint)15) ^ rotate(N, (uint)13) ^ ((N) >> 10)) + I + (rotate(Q, (uint)25) ^ rotate(Q, (uint)14) ^ ((Q) >> 3)) + P));
    AA += B;
    W = B + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    B = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, T, AA) + (0xD5A79147 + (Q = (rotate(O, (uint)15) ^ rotate(O, (uint)13) ^ ((O) >> 10)) + J + (rotate(R, (uint)25) ^ rotate(R, (uint)14) ^ ((R) >> 3)) + Q));
    Z += B;
    V = B + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    B = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(T, AA, Z) + (0x06CA6351 + (R = (rotate(P, (uint)15) ^ rotate(P, (uint)13) ^ ((P) >> 10)) + K + (rotate(S, (uint)25) ^ rotate(S, (uint)14) ^ ((S) >> 3)) + R));
    Y += B;
    U = B + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    B = T + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0x14292967 + (S = (rotate(Q, (uint)15) ^ rotate(Q, (uint)13) ^ ((Q) >> 10)) + L + (rotate(D, (uint)25) ^ rotate(D, (uint)14) ^ ((D) >> 3)) + S));
    X += B;
    T = B + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };

  {
    B = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0x27B70A85 + (D = (rotate(R, (uint)15) ^ rotate(R, (uint)13) ^ ((R) >> 10)) + M + (rotate(E, (uint)25) ^ rotate(E, (uint)14) ^ ((E) >> 3)) + D));
    W += B;
    AA = B + (rotate(T, (uint)30) ^ rotate(T, (uint)19) ^ rotate(T, (uint)10)) + bitselect(V, T, V ^ U);
  };
  {
    B = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0x2E1B2138 + (E = (rotate(S, (uint)15) ^ rotate(S, (uint)13) ^ ((S) >> 10)) + N + (rotate(F, (uint)25) ^ rotate(F, (uint)14) ^ ((F) >> 3)) + E));
    V += B;
    Z = B + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ T);
  };
  {
    B = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0x4D2C6DFC + (F = (rotate(D, (uint)15) ^ rotate(D, (uint)13) ^ ((D) >> 10)) + O + (rotate(G, (uint)25) ^ rotate(G, (uint)14) ^ ((G) >> 3)) + F));
    U += B;
    Y = B + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(T, Z, T ^ AA);
  };
  {
    B = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x53380D13 + (G = (rotate(E, (uint)15) ^ rotate(E, (uint)13) ^ ((E) >> 10)) + P + (rotate(H, (uint)25) ^ rotate(H, (uint)14) ^ ((H) >> 3)) + G));
    T += B;
    X = B + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    B = W + (rotate(T, (uint)26) ^ rotate(T, (uint)21) ^ rotate(T, (uint)7)) + bitselect(V, U, T) + (0x650A7354 + (H = (rotate(F, (uint)15) ^ rotate(F, (uint)13) ^ ((F) >> 10)) + Q + (rotate(I, (uint)25) ^ rotate(I, (uint)14) ^ ((I) >> 3)) + H));
    AA += B;
    W = B + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    B = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, T, AA) + (0x766A0ABB + (I = (rotate(G, (uint)15) ^ rotate(G, (uint)13) ^ ((G) >> 10)) + R + (rotate(J, (uint)25) ^ rotate(J, (uint)14) ^ ((J) >> 3)) + I));
    Z += B;
    V = B + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    B = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(T, AA, Z) + (0x81C2C92E + (J = (rotate(H, (uint)15) ^ rotate(H, (uint)13) ^ ((H) >> 10)) + S + (rotate(K, (uint)25) ^ rotate(K, (uint)14) ^ ((K) >> 3)) + J));
    Y += B;
    U = B + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    B = T + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0x92722C85 + (K = (rotate(I, (uint)15) ^ rotate(I, (uint)13) ^ ((I) >> 10)) + D + (rotate(L, (uint)25) ^ rotate(L, (uint)14) ^ ((L) >> 3)) + K));
    X += B;
    T = B + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    B = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0xA2BFE8A1 + (L = (rotate(J, (uint)15) ^ rotate(J, (uint)13) ^ ((J) >> 10)) + E + (rotate(M, (uint)25) ^ rotate(M, (uint)14) ^ ((M) >> 3)) + L));
    W += B;
    AA = B + (rotate(T, (uint)30) ^ rotate(T, (uint)19) ^ rotate(T, (uint)10)) + bitselect(V, T, V ^ U);
  };
  {
    B = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0xA81A664B + (M = (rotate(K, (uint)15) ^ rotate(K, (uint)13) ^ ((K) >> 10)) + F + (rotate(N, (uint)25) ^ rotate(N, (uint)14) ^ ((N) >> 3)) + M));
    V += B;
    Z = B + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ T);
  };
  {
    B = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0xC24B8B70 + (N = (rotate(L, (uint)15) ^ rotate(L, (uint)13) ^ ((L) >> 10)) + G + (rotate(O, (uint)25) ^ rotate(O, (uint)14) ^ ((O) >> 3)) + N));
    U += B;
    Y = B + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(T, Z, T ^ AA);
  };
  {
    B = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0xC76C51A3 + (O = (rotate(M, (uint)15) ^ rotate(M, (uint)13) ^ ((M) >> 10)) + H + (rotate(P, (uint)25) ^ rotate(P, (uint)14) ^ ((P) >> 3)) + O));
    T += B;
    X = B + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    B = W + (rotate(T, (uint)26) ^ rotate(T, (uint)21) ^ rotate(T, (uint)7)) + bitselect(V, U, T) + (0xD192E819 + (P = (rotate(N, (uint)15) ^ rotate(N, (uint)13) ^ ((N) >> 10)) + I + (rotate(Q, (uint)25) ^ rotate(Q, (uint)14) ^ ((Q) >> 3)) + P));
    AA += B;
    W = B + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    B = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, T, AA) + (0xD6990624 + (Q = (rotate(O, (uint)15) ^ rotate(O, (uint)13) ^ ((O) >> 10)) + J + (rotate(R, (uint)25) ^ rotate(R, (uint)14) ^ ((R) >> 3)) + Q));
    Z += B;
    V = B + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    B = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(T, AA, Z) + (0xF40E3585 + (R = (rotate(P, (uint)15) ^ rotate(P, (uint)13) ^ ((P) >> 10)) + K + (rotate(S, (uint)25) ^ rotate(S, (uint)14) ^ ((S) >> 3)) + R));
    Y += B;
    U = B + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    B = T + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0x106AA070 + (S = (rotate(Q, (uint)15) ^ rotate(Q, (uint)13) ^ ((Q) >> 10)) + L + (rotate(D, (uint)25) ^ rotate(D, (uint)14) ^ ((D) >> 3)) + S));
    X += B;
    T = B + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };

  {
    B = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0x19A4C116 + (D = (rotate(R, (uint)15) ^ rotate(R, (uint)13) ^ ((R) >> 10)) + M + (rotate(E, (uint)25) ^ rotate(E, (uint)14) ^ ((E) >> 3)) + D));
    W += B;
    AA = B + (rotate(T, (uint)30) ^ rotate(T, (uint)19) ^ rotate(T, (uint)10)) + bitselect(V, T, V ^ U);
  };
  {
    B = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0x1E376C08 + (E = (rotate(S, (uint)15) ^ rotate(S, (uint)13) ^ ((S) >> 10)) + N + (rotate(F, (uint)25) ^ rotate(F, (uint)14) ^ ((F) >> 3)) + E));
    V += B;
    Z = B + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ T);
  };
  {
    B = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0x2748774C + (F = (rotate(D, (uint)15) ^ rotate(D, (uint)13) ^ ((D) >> 10)) + O + (rotate(G, (uint)25) ^ rotate(G, (uint)14) ^ ((G) >> 3)) + F));
    U += B;
    Y = B + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(T, Z, T ^ AA);
  };
  {
    B = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x34B0BCB5 + (G = (rotate(E, (uint)15) ^ rotate(E, (uint)13) ^ ((E) >> 10)) + P + (rotate(H, (uint)25) ^ rotate(H, (uint)14) ^ ((H) >> 3)) + G));
    T += B;
    X = B + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    B = W + (rotate(T, (uint)26) ^ rotate(T, (uint)21) ^ rotate(T, (uint)7)) + bitselect(V, U, T) + (0x391C0CB3 + (H = (rotate(F, (uint)15) ^ rotate(F, (uint)13) ^ ((F) >> 10)) + Q + (rotate(I, (uint)25) ^ rotate(I, (uint)14) ^ ((I) >> 3)) + H));
    AA += B;
    W = B + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    B = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, T, AA) + (0x4ED8AA4A + (I = (rotate(G, (uint)15) ^ rotate(G, (uint)13) ^ ((G) >> 10)) + R + (rotate(J, (uint)25) ^ rotate(J, (uint)14) ^ ((J) >> 3)) + I));
    Z += B;
    V = B + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    B = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(T, AA, Z) + (0x5B9CCA4F + (J = (rotate(H, (uint)15) ^ rotate(H, (uint)13) ^ ((H) >> 10)) + S + (rotate(K, (uint)25) ^ rotate(K, (uint)14) ^ ((K) >> 3)) + J));
    Y += B;
    U = B + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    B = T + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0x682E6FF3 + (K = (rotate(I, (uint)15) ^ rotate(I, (uint)13) ^ ((I) >> 10)) + D + (rotate(L, (uint)25) ^ rotate(L, (uint)14) ^ ((L) >> 3)) + K));
    X += B;
    T = B + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    B = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0x748F82EE + (L = (rotate(J, (uint)15) ^ rotate(J, (uint)13) ^ ((J) >> 10)) + E + (rotate(M, (uint)25) ^ rotate(M, (uint)14) ^ ((M) >> 3)) + L));
    W += B;
    AA = B + (rotate(T, (uint)30) ^ rotate(T, (uint)19) ^ rotate(T, (uint)10)) + bitselect(V, T, V ^ U);
  };
  {
    B = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0x78A5636F + (M = (rotate(K, (uint)15) ^ rotate(K, (uint)13) ^ ((K) >> 10)) + F + (rotate(N, (uint)25) ^ rotate(N, (uint)14) ^ ((N) >> 3)) + M));
    V += B;
    Z = B + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ T);
  };
  {
    B = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0x84C87814 + (N = (rotate(L, (uint)15) ^ rotate(L, (uint)13) ^ ((L) >> 10)) + G + (rotate(O, (uint)25) ^ rotate(O, (uint)14) ^ ((O) >> 3)) + N));
    U += B;
    Y = B + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(T, Z, T ^ AA);
  };
  {
    B = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x8CC70208 + (O = (rotate(M, (uint)15) ^ rotate(M, (uint)13) ^ ((M) >> 10)) + H + (rotate(P, (uint)25) ^ rotate(P, (uint)14) ^ ((P) >> 3)) + O));
    T += B;
    X = B + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    B = W + (rotate(T, (uint)26) ^ rotate(T, (uint)21) ^ rotate(T, (uint)7)) + bitselect(V, U, T) + (0x90BEFFFA + (P = (rotate(N, (uint)15) ^ rotate(N, (uint)13) ^ ((N) >> 10)) + I + (rotate(Q, (uint)25) ^ rotate(Q, (uint)14) ^ ((Q) >> 3)) + P));
    AA += B;
    W = B + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    B = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, T, AA) + (0xA4506CEB + (Q = (rotate(O, (uint)15) ^ rotate(O, (uint)13) ^ ((O) >> 10)) + J + (rotate(R, (uint)25) ^ rotate(R, (uint)14) ^ ((R) >> 3)) + Q));
    Z += B;
    V = B + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    B = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(T, AA, Z) + (0xBEF9A3F7 + ((rotate(P, (uint)15) ^ rotate(P, (uint)13) ^ ((P) >> 10)) + K + (rotate(S, (uint)25) ^ rotate(S, (uint)14) ^ ((S) >> 3)) + R));
    Y += B;
    U = B + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    B = T + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0xC67178F2 + ((rotate(Q, (uint)15) ^ rotate(Q, (uint)13) ^ ((Q) >> 10)) + L + (rotate(D, (uint)25) ^ rotate(D, (uint)14) ^ ((D) >> 3)) + S));
    X += B;
    T = B + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };

  C.s0 = T + 0x6A09E667;
  C.s1 = U + 0xBB67AE85;
  C.s2 = V + 0x3C6EF372;
  C.s3 = W + 0xA54FF53A;
  C.s4 = X + 0x510E527F;
  C.s5 = Y + 0x9B05688C;
  C.s6 = Z + 0x1F83D9AB;
  C.s7 = AA + 0x5BE0CD19;
  return (C);
}

inline uint8 fn_M(uint16 A, uint8 B) {
  uint C;
  uint8 D;
  uint E = A.s0;
  uint F = A.s1;
  uint G = A.s2;
  uint H = A.s3;
  uint I = A.s4;
  uint J = A.s5;
  uint K = A.s6;
  uint L = A.s7;
  uint M = A.s8;
  uint N = A.s9;
  uint O = A.sA;
  uint P = A.sB;
  uint Q = A.sC;
  uint R = A.sD;
  uint S = A.sE;
  uint T = A.sF;

  uint U = B.s0;
  uint V = B.s1;
  uint W = B.s2;
  uint X = B.s3;
  uint Y = B.s4;
  uint Z = B.s5;
  uint AA = B.s6;
  uint AB = B.s7;

  {
    C = AB + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0x428A2F98 + E);
    X += C;
    AB = C + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    C = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0x71374491 + F);
    W += C;
    AA = C + (rotate(AB, (uint)30) ^ rotate(AB, (uint)19) ^ rotate(AB, (uint)10)) + bitselect(V, AB, V ^ U);
  };
  {
    C = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0xB5C0FBCF + G);
    V += C;
    Z = C + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ AB);
  };
  {
    C = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0xE9B5DBA5 + H);
    U += C;
    Y = C + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(AB, Z, AB ^ AA);
  };
  {
    C = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x3956C25B + I);
    AB += C;
    X = C + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    C = W + (rotate(AB, (uint)26) ^ rotate(AB, (uint)21) ^ rotate(AB, (uint)7)) + bitselect(V, U, AB) + (0x59F111F1 + J);
    AA += C;
    W = C + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    C = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, AB, AA) + (0x923F82A4 + K);
    Z += C;
    V = C + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    C = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(AB, AA, Z) + (0xAB1C5ED5 + L);
    Y += C;
    U = C + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    C = AB + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0xD807AA98 + M);
    X += C;
    AB = C + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    C = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0x12835B01 + N);
    W += C;
    AA = C + (rotate(AB, (uint)30) ^ rotate(AB, (uint)19) ^ rotate(AB, (uint)10)) + bitselect(V, AB, V ^ U);
  };
  {
    C = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0x243185BE + O);
    V += C;
    Z = C + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ AB);
  };
  {
    C = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0x550C7DC3 + P);
    U += C;
    Y = C + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(AB, Z, AB ^ AA);
  };
  {
    C = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x72BE5D74 + Q);
    AB += C;
    X = C + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    C = W + (rotate(AB, (uint)26) ^ rotate(AB, (uint)21) ^ rotate(AB, (uint)7)) + bitselect(V, U, AB) + (0x80DEB1FE + R);
    AA += C;
    W = C + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    C = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, AB, AA) + (0x9BDC06A7 + S);
    Z += C;
    V = C + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    C = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(AB, AA, Z) + (0xC19BF174 + T);
    Y += C;
    U = C + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };

  {
    C = AB + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0xE49B69C1 + (E = (rotate(S, (uint)15) ^ rotate(S, (uint)13) ^ ((S) >> 10)) + N + (rotate(F, (uint)25) ^ rotate(F, (uint)14) ^ ((F) >> 3)) + E));
    X += C;
    AB = C + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    C = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0xEFBE4786 + (F = (rotate(T, (uint)15) ^ rotate(T, (uint)13) ^ ((T) >> 10)) + O + (rotate(G, (uint)25) ^ rotate(G, (uint)14) ^ ((G) >> 3)) + F));
    W += C;
    AA = C + (rotate(AB, (uint)30) ^ rotate(AB, (uint)19) ^ rotate(AB, (uint)10)) + bitselect(V, AB, V ^ U);
  };
  {
    C = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0x0FC19DC6 + (G = (rotate(E, (uint)15) ^ rotate(E, (uint)13) ^ ((E) >> 10)) + P + (rotate(H, (uint)25) ^ rotate(H, (uint)14) ^ ((H) >> 3)) + G));
    V += C;
    Z = C + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ AB);
  };
  {
    C = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0x240CA1CC + (H = (rotate(F, (uint)15) ^ rotate(F, (uint)13) ^ ((F) >> 10)) + Q + (rotate(I, (uint)25) ^ rotate(I, (uint)14) ^ ((I) >> 3)) + H));
    U += C;
    Y = C + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(AB, Z, AB ^ AA);
  };
  {
    C = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x2DE92C6F + (I = (rotate(G, (uint)15) ^ rotate(G, (uint)13) ^ ((G) >> 10)) + R + (rotate(J, (uint)25) ^ rotate(J, (uint)14) ^ ((J) >> 3)) + I));
    AB += C;
    X = C + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    C = W + (rotate(AB, (uint)26) ^ rotate(AB, (uint)21) ^ rotate(AB, (uint)7)) + bitselect(V, U, AB) + (0x4A7484AA + (J = (rotate(H, (uint)15) ^ rotate(H, (uint)13) ^ ((H) >> 10)) + S + (rotate(K, (uint)25) ^ rotate(K, (uint)14) ^ ((K) >> 3)) + J));
    AA += C;
    W = C + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    C = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, AB, AA) + (0x5CB0A9DC + (K = (rotate(I, (uint)15) ^ rotate(I, (uint)13) ^ ((I) >> 10)) + T + (rotate(L, (uint)25) ^ rotate(L, (uint)14) ^ ((L) >> 3)) + K));
    Z += C;
    V = C + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    C = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(AB, AA, Z) + (0x76F988DA + (L = (rotate(J, (uint)15) ^ rotate(J, (uint)13) ^ ((J) >> 10)) + E + (rotate(M, (uint)25) ^ rotate(M, (uint)14) ^ ((M) >> 3)) + L));
    Y += C;
    U = C + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    C = AB + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0x983E5152 + (M = (rotate(K, (uint)15) ^ rotate(K, (uint)13) ^ ((K) >> 10)) + F + (rotate(N, (uint)25) ^ rotate(N, (uint)14) ^ ((N) >> 3)) + M));
    X += C;
    AB = C + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    C = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0xA831C66D + (N = (rotate(L, (uint)15) ^ rotate(L, (uint)13) ^ ((L) >> 10)) + G + (rotate(O, (uint)25) ^ rotate(O, (uint)14) ^ ((O) >> 3)) + N));
    W += C;
    AA = C + (rotate(AB, (uint)30) ^ rotate(AB, (uint)19) ^ rotate(AB, (uint)10)) + bitselect(V, AB, V ^ U);
  };
  {
    C = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0xB00327C8 + (O = (rotate(M, (uint)15) ^ rotate(M, (uint)13) ^ ((M) >> 10)) + H + (rotate(P, (uint)25) ^ rotate(P, (uint)14) ^ ((P) >> 3)) + O));
    V += C;
    Z = C + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ AB);
  };
  {
    C = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0xBF597FC7 + (P = (rotate(N, (uint)15) ^ rotate(N, (uint)13) ^ ((N) >> 10)) + I + (rotate(Q, (uint)25) ^ rotate(Q, (uint)14) ^ ((Q) >> 3)) + P));
    U += C;
    Y = C + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(AB, Z, AB ^ AA);
  };
  {
    C = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0xC6E00BF3 + (Q = (rotate(O, (uint)15) ^ rotate(O, (uint)13) ^ ((O) >> 10)) + J + (rotate(R, (uint)25) ^ rotate(R, (uint)14) ^ ((R) >> 3)) + Q));
    AB += C;
    X = C + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    C = W + (rotate(AB, (uint)26) ^ rotate(AB, (uint)21) ^ rotate(AB, (uint)7)) + bitselect(V, U, AB) + (0xD5A79147 + (R = (rotate(P, (uint)15) ^ rotate(P, (uint)13) ^ ((P) >> 10)) + K + (rotate(S, (uint)25) ^ rotate(S, (uint)14) ^ ((S) >> 3)) + R));
    AA += C;
    W = C + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    C = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, AB, AA) + (0x06CA6351 + (S = (rotate(Q, (uint)15) ^ rotate(Q, (uint)13) ^ ((Q) >> 10)) + L + (rotate(T, (uint)25) ^ rotate(T, (uint)14) ^ ((T) >> 3)) + S));
    Z += C;
    V = C + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    C = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(AB, AA, Z) + (0x14292967 + (T = (rotate(R, (uint)15) ^ rotate(R, (uint)13) ^ ((R) >> 10)) + M + (rotate(E, (uint)25) ^ rotate(E, (uint)14) ^ ((E) >> 3)) + T));
    Y += C;
    U = C + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };

  {
    C = AB + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0x27B70A85 + (E = (rotate(S, (uint)15) ^ rotate(S, (uint)13) ^ ((S) >> 10)) + N + (rotate(F, (uint)25) ^ rotate(F, (uint)14) ^ ((F) >> 3)) + E));
    X += C;
    AB = C + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    C = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0x2E1B2138 + (F = (rotate(T, (uint)15) ^ rotate(T, (uint)13) ^ ((T) >> 10)) + O + (rotate(G, (uint)25) ^ rotate(G, (uint)14) ^ ((G) >> 3)) + F));
    W += C;
    AA = C + (rotate(AB, (uint)30) ^ rotate(AB, (uint)19) ^ rotate(AB, (uint)10)) + bitselect(V, AB, V ^ U);
  };
  {
    C = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0x4D2C6DFC + (G = (rotate(E, (uint)15) ^ rotate(E, (uint)13) ^ ((E) >> 10)) + P + (rotate(H, (uint)25) ^ rotate(H, (uint)14) ^ ((H) >> 3)) + G));
    V += C;
    Z = C + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ AB);
  };
  {
    C = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0x53380D13 + (H = (rotate(F, (uint)15) ^ rotate(F, (uint)13) ^ ((F) >> 10)) + Q + (rotate(I, (uint)25) ^ rotate(I, (uint)14) ^ ((I) >> 3)) + H));
    U += C;
    Y = C + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(AB, Z, AB ^ AA);
  };
  {
    C = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x650A7354 + (I = (rotate(G, (uint)15) ^ rotate(G, (uint)13) ^ ((G) >> 10)) + R + (rotate(J, (uint)25) ^ rotate(J, (uint)14) ^ ((J) >> 3)) + I));
    AB += C;
    X = C + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    C = W + (rotate(AB, (uint)26) ^ rotate(AB, (uint)21) ^ rotate(AB, (uint)7)) + bitselect(V, U, AB) + (0x766A0ABB + (J = (rotate(H, (uint)15) ^ rotate(H, (uint)13) ^ ((H) >> 10)) + S + (rotate(K, (uint)25) ^ rotate(K, (uint)14) ^ ((K) >> 3)) + J));
    AA += C;
    W = C + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    C = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, AB, AA) + (0x81C2C92E + (K = (rotate(I, (uint)15) ^ rotate(I, (uint)13) ^ ((I) >> 10)) + T + (rotate(L, (uint)25) ^ rotate(L, (uint)14) ^ ((L) >> 3)) + K));
    Z += C;
    V = C + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    C = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(AB, AA, Z) + (0x92722C85 + (L = (rotate(J, (uint)15) ^ rotate(J, (uint)13) ^ ((J) >> 10)) + E + (rotate(M, (uint)25) ^ rotate(M, (uint)14) ^ ((M) >> 3)) + L));
    Y += C;
    U = C + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    C = AB + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0xA2BFE8A1 + (M = (rotate(K, (uint)15) ^ rotate(K, (uint)13) ^ ((K) >> 10)) + F + (rotate(N, (uint)25) ^ rotate(N, (uint)14) ^ ((N) >> 3)) + M));
    X += C;
    AB = C + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    C = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0xA81A664B + (N = (rotate(L, (uint)15) ^ rotate(L, (uint)13) ^ ((L) >> 10)) + G + (rotate(O, (uint)25) ^ rotate(O, (uint)14) ^ ((O) >> 3)) + N));
    W += C;
    AA = C + (rotate(AB, (uint)30) ^ rotate(AB, (uint)19) ^ rotate(AB, (uint)10)) + bitselect(V, AB, V ^ U);
  };
  {
    C = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0xC24B8B70 + (O = (rotate(M, (uint)15) ^ rotate(M, (uint)13) ^ ((M) >> 10)) + H + (rotate(P, (uint)25) ^ rotate(P, (uint)14) ^ ((P) >> 3)) + O));
    V += C;
    Z = C + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ AB);
  };
  {
    C = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0xC76C51A3 + (P = (rotate(N, (uint)15) ^ rotate(N, (uint)13) ^ ((N) >> 10)) + I + (rotate(Q, (uint)25) ^ rotate(Q, (uint)14) ^ ((Q) >> 3)) + P));
    U += C;
    Y = C + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(AB, Z, AB ^ AA);
  };
  {
    C = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0xD192E819 + (Q = (rotate(O, (uint)15) ^ rotate(O, (uint)13) ^ ((O) >> 10)) + J + (rotate(R, (uint)25) ^ rotate(R, (uint)14) ^ ((R) >> 3)) + Q));
    AB += C;
    X = C + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    C = W + (rotate(AB, (uint)26) ^ rotate(AB, (uint)21) ^ rotate(AB, (uint)7)) + bitselect(V, U, AB) + (0xD6990624 + (R = (rotate(P, (uint)15) ^ rotate(P, (uint)13) ^ ((P) >> 10)) + K + (rotate(S, (uint)25) ^ rotate(S, (uint)14) ^ ((S) >> 3)) + R));
    AA += C;
    W = C + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    C = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, AB, AA) + (0xF40E3585 + (S = (rotate(Q, (uint)15) ^ rotate(Q, (uint)13) ^ ((Q) >> 10)) + L + (rotate(T, (uint)25) ^ rotate(T, (uint)14) ^ ((T) >> 3)) + S));
    Z += C;
    V = C + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    C = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(AB, AA, Z) + (0x106AA070 + (T = (rotate(R, (uint)15) ^ rotate(R, (uint)13) ^ ((R) >> 10)) + M + (rotate(E, (uint)25) ^ rotate(E, (uint)14) ^ ((E) >> 3)) + T));
    Y += C;
    U = C + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };

  {
    C = AB + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0x19A4C116 + (E = (rotate(S, (uint)15) ^ rotate(S, (uint)13) ^ ((S) >> 10)) + N + (rotate(F, (uint)25) ^ rotate(F, (uint)14) ^ ((F) >> 3)) + E));
    X += C;
    AB = C + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    C = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0x1E376C08 + (F = (rotate(T, (uint)15) ^ rotate(T, (uint)13) ^ ((T) >> 10)) + O + (rotate(G, (uint)25) ^ rotate(G, (uint)14) ^ ((G) >> 3)) + F));
    W += C;
    AA = C + (rotate(AB, (uint)30) ^ rotate(AB, (uint)19) ^ rotate(AB, (uint)10)) + bitselect(V, AB, V ^ U);
  };
  {
    C = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0x2748774C + (G = (rotate(E, (uint)15) ^ rotate(E, (uint)13) ^ ((E) >> 10)) + P + (rotate(H, (uint)25) ^ rotate(H, (uint)14) ^ ((H) >> 3)) + G));
    V += C;
    Z = C + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ AB);
  };
  {
    C = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0x34B0BCB5 + (H = (rotate(F, (uint)15) ^ rotate(F, (uint)13) ^ ((F) >> 10)) + Q + (rotate(I, (uint)25) ^ rotate(I, (uint)14) ^ ((I) >> 3)) + H));
    U += C;
    Y = C + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(AB, Z, AB ^ AA);
  };
  {
    C = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x391C0CB3 + (I = (rotate(G, (uint)15) ^ rotate(G, (uint)13) ^ ((G) >> 10)) + R + (rotate(J, (uint)25) ^ rotate(J, (uint)14) ^ ((J) >> 3)) + I));
    AB += C;
    X = C + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    C = W + (rotate(AB, (uint)26) ^ rotate(AB, (uint)21) ^ rotate(AB, (uint)7)) + bitselect(V, U, AB) + (0x4ED8AA4A + (J = (rotate(H, (uint)15) ^ rotate(H, (uint)13) ^ ((H) >> 10)) + S + (rotate(K, (uint)25) ^ rotate(K, (uint)14) ^ ((K) >> 3)) + J));
    AA += C;
    W = C + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    C = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, AB, AA) + (0x5B9CCA4F + (K = (rotate(I, (uint)15) ^ rotate(I, (uint)13) ^ ((I) >> 10)) + T + (rotate(L, (uint)25) ^ rotate(L, (uint)14) ^ ((L) >> 3)) + K));
    Z += C;
    V = C + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    C = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(AB, AA, Z) + (0x682E6FF3 + (L = (rotate(J, (uint)15) ^ rotate(J, (uint)13) ^ ((J) >> 10)) + E + (rotate(M, (uint)25) ^ rotate(M, (uint)14) ^ ((M) >> 3)) + L));
    Y += C;
    U = C + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };
  {
    C = AB + (rotate(Y, (uint)26) ^ rotate(Y, (uint)21) ^ rotate(Y, (uint)7)) + bitselect(AA, Z, Y) + (0x748F82EE + (M = (rotate(K, (uint)15) ^ rotate(K, (uint)13) ^ ((K) >> 10)) + F + (rotate(N, (uint)25) ^ rotate(N, (uint)14) ^ ((N) >> 3)) + M));
    X += C;
    AB = C + (rotate(U, (uint)30) ^ rotate(U, (uint)19) ^ rotate(U, (uint)10)) + bitselect(W, U, W ^ V);
  };
  {
    C = AA + (rotate(X, (uint)26) ^ rotate(X, (uint)21) ^ rotate(X, (uint)7)) + bitselect(Z, Y, X) + (0x78A5636F + (N = (rotate(L, (uint)15) ^ rotate(L, (uint)13) ^ ((L) >> 10)) + G + (rotate(O, (uint)25) ^ rotate(O, (uint)14) ^ ((O) >> 3)) + N));
    W += C;
    AA = C + (rotate(AB, (uint)30) ^ rotate(AB, (uint)19) ^ rotate(AB, (uint)10)) + bitselect(V, AB, V ^ U);
  };
  {
    C = Z + (rotate(W, (uint)26) ^ rotate(W, (uint)21) ^ rotate(W, (uint)7)) + bitselect(Y, X, W) + (0x84C87814 + (O = (rotate(M, (uint)15) ^ rotate(M, (uint)13) ^ ((M) >> 10)) + H + (rotate(P, (uint)25) ^ rotate(P, (uint)14) ^ ((P) >> 3)) + O));
    V += C;
    Z = C + (rotate(AA, (uint)30) ^ rotate(AA, (uint)19) ^ rotate(AA, (uint)10)) + bitselect(U, AA, U ^ AB);
  };
  {
    C = Y + (rotate(V, (uint)26) ^ rotate(V, (uint)21) ^ rotate(V, (uint)7)) + bitselect(X, W, V) + (0x8CC70208 + (P = (rotate(N, (uint)15) ^ rotate(N, (uint)13) ^ ((N) >> 10)) + I + (rotate(Q, (uint)25) ^ rotate(Q, (uint)14) ^ ((Q) >> 3)) + P));
    U += C;
    Y = C + (rotate(Z, (uint)30) ^ rotate(Z, (uint)19) ^ rotate(Z, (uint)10)) + bitselect(AB, Z, AB ^ AA);
  };
  {
    C = X + (rotate(U, (uint)26) ^ rotate(U, (uint)21) ^ rotate(U, (uint)7)) + bitselect(W, V, U) + (0x90BEFFFA + (Q = (rotate(O, (uint)15) ^ rotate(O, (uint)13) ^ ((O) >> 10)) + J + (rotate(R, (uint)25) ^ rotate(R, (uint)14) ^ ((R) >> 3)) + Q));
    AB += C;
    X = C + (rotate(Y, (uint)30) ^ rotate(Y, (uint)19) ^ rotate(Y, (uint)10)) + bitselect(AA, Y, AA ^ Z);
  };
  {
    C = W + (rotate(AB, (uint)26) ^ rotate(AB, (uint)21) ^ rotate(AB, (uint)7)) + bitselect(V, U, AB) + (0xA4506CEB + (R = (rotate(P, (uint)15) ^ rotate(P, (uint)13) ^ ((P) >> 10)) + K + (rotate(S, (uint)25) ^ rotate(S, (uint)14) ^ ((S) >> 3)) + R));
    AA += C;
    W = C + (rotate(X, (uint)30) ^ rotate(X, (uint)19) ^ rotate(X, (uint)10)) + bitselect(Z, X, Z ^ Y);
  };
  {
    C = V + (rotate(AA, (uint)26) ^ rotate(AA, (uint)21) ^ rotate(AA, (uint)7)) + bitselect(U, AB, AA) + (0xBEF9A3F7 + ((rotate(Q, (uint)15) ^ rotate(Q, (uint)13) ^ ((Q) >> 10)) + L + (rotate(T, (uint)25) ^ rotate(T, (uint)14) ^ ((T) >> 3)) + S));
    Z += C;
    V = C + (rotate(W, (uint)30) ^ rotate(W, (uint)19) ^ rotate(W, (uint)10)) + bitselect(Y, W, Y ^ X);
  };
  {
    C = U + (rotate(Z, (uint)26) ^ rotate(Z, (uint)21) ^ rotate(Z, (uint)7)) + bitselect(AB, AA, Z) + (0xC67178F2 + ((rotate(R, (uint)15) ^ rotate(R, (uint)13) ^ ((R) >> 10)) + M + (rotate(E, (uint)25) ^ rotate(E, (uint)14) ^ ((E) >> 3)) + T));
    Y += C;
    U = C + (rotate(V, (uint)30) ^ rotate(V, (uint)19) ^ rotate(V, (uint)10)) + bitselect(X, V, X ^ W);
  };

  D.s0 = (U + B.s0);
  D.s1 = (V + B.s1);
  D.s2 = (W + B.s2);
  D.s3 = (X + B.s3);
  D.s4 = (Y + B.s4);
  D.s5 = (Z + B.s5);
  D.s6 = (AA + B.s6);
  D.s7 = (AB + B.s7);
  return (D);
}

inline uint8 fn_N(uint* A, uint B) {
  uint8 C = fn_L(((uint16*)A)[0]);
  uint16 D = gb_E;
  D.s0 = A[16];
  D.s1 = A[17];
  D.s2 = A[18];
  D.s3 = B;

  return (fn_M(D, C));
}