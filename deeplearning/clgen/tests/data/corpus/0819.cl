typedef struct {
  float s01, s02, s03, s04, s05, s06, s07, s08, s09, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24;
  float carry;
  float dummy;
  int in24;
  int stepnr;
} ranluxcl_state_t;

void fn_A(ranluxcl_state_t*, global ranluxcl_state_t*);
void fn_B(ranluxcl_state_t*, global ranluxcl_state_t*);
float fn_C(float, float, float*, float*);
float4 fn_D(ranluxcl_state_t*);
void fn_E(ranluxcl_state_t*);
void fn_F(uint, global ranluxcl_state_t*);
float4 fn_G(ranluxcl_state_t*);
void fn_A(ranluxcl_state_t* A, global ranluxcl_state_t* B) {
  (*A) = B[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1))];
}

void fn_B(ranluxcl_state_t* A, global ranluxcl_state_t* B) {
  B[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1))] = (*A);
}

float fn_C(float A, float B, float* C, float* D) {
  float E, F;
  E = B - (*C) - (*D);
  if (E < 0.0f) {
    E += 1.0f;
    (*D) = 0.000000059604644775f;
  } else
    (*D) = 0.0f;
  F = ((*C) = E);

  if (E < 0.000244140625f) {
    F += 0.000000059604644775f * A;
    if (F == 0.0f)
      F = 0.000000059604644775f * 0.000000059604644775f;
  }
  return F;
}

float4 fn_D(ranluxcl_state_t* A) {
  float4 B;

  if (A->stepnr == 0) {
    B.x = fn_C(A->s09, A->s10, &(A->s24), &(A->carry));
    B.y = fn_C(A->s08, A->s09, &(A->s23), &(A->carry));
    B.z = fn_C(A->s07, A->s08, &(A->s22), &(A->carry));
    B.w = fn_C(A->s06, A->s07, &(A->s21), &(A->carry));
    A->stepnr += 4;
  }

  else if (A->stepnr == 4) {
    B.x = fn_C(A->s05, A->s06, &(A->s20), &(A->carry));
    B.y = fn_C(A->s04, A->s05, &(A->s19), &(A->carry));
    B.z = fn_C(A->s03, A->s04, &(A->s18), &(A->carry));
    B.w = fn_C(A->s02, A->s03, &(A->s17), &(A->carry));
    A->stepnr += 4;
  }

  else if (A->stepnr == 8) {
    B.x = fn_C(A->s01, A->s02, &(A->s16), &(A->carry));
    B.y = fn_C(A->s24, A->s01, &(A->s15), &(A->carry));
    B.z = fn_C(A->s23, A->s24, &(A->s14), &(A->carry));
    B.w = fn_C(A->s22, A->s23, &(A->s13), &(A->carry));
    A->stepnr += 4;
  }

  else if (A->stepnr == 12) {
    B.x = fn_C(A->s21, A->s22, &(A->s12), &(A->carry));
    B.y = fn_C(A->s20, A->s21, &(A->s11), &(A->carry));
    B.z = fn_C(A->s19, A->s20, &(A->s10), &(A->carry));
    B.w = fn_C(A->s18, A->s19, &(A->s09), &(A->carry));
    A->stepnr += 4;
  }

  else if (A->stepnr == 16) {
    B.x = fn_C(A->s17, A->s18, &(A->s08), &(A->carry));
    B.y = fn_C(A->s16, A->s17, &(A->s07), &(A->carry));
    B.z = fn_C(A->s15, A->s16, &(A->s06), &(A->carry));
    B.w = fn_C(A->s14, A->s15, &(A->s05), &(A->carry));
    A->stepnr += 4;
  }

  else if (A->stepnr == 20) {
    B.x = fn_C(A->s13, A->s14, &(A->s04), &(A->carry));
    B.y = fn_C(A->s12, A->s13, &(A->s03), &(A->carry));
    B.z = fn_C(A->s11, A->s12, &(A->s02), &(A->carry));
    B.w = fn_C(A->s10, A->s11, &(A->s01), &(A->carry));
    A->stepnr = 0;
  }

  (*&(A->in24)) += 4;
  if ((*&(A->in24)) == 24) {
    (*&(A->in24)) = 0;

    int C = (A->stepnr) ? (24 - A->stepnr) : 0;
    int D = ((380 - C) / 24) * 24;
    int E = 380 - C - D;

    switch (C) {
      case (20):
        fn_C(A->s05, A->s06, &(A->s20), &(A->carry));
        fn_C(A->s04, A->s05, &(A->s19), &(A->carry));
        fn_C(A->s03, A->s04, &(A->s18), &(A->carry));
        fn_C(A->s02, A->s03, &(A->s17), &(A->carry));
      case (16):
        fn_C(A->s01, A->s02, &(A->s16), &(A->carry));
        fn_C(A->s24, A->s01, &(A->s15), &(A->carry));
        fn_C(A->s23, A->s24, &(A->s14), &(A->carry));
        fn_C(A->s22, A->s23, &(A->s13), &(A->carry));
      case (12):
        fn_C(A->s21, A->s22, &(A->s12), &(A->carry));
        fn_C(A->s20, A->s21, &(A->s11), &(A->carry));
        fn_C(A->s19, A->s20, &(A->s10), &(A->carry));
        fn_C(A->s18, A->s19, &(A->s09), &(A->carry));
      case (8):
        fn_C(A->s17, A->s18, &(A->s08), &(A->carry));
        fn_C(A->s16, A->s17, &(A->s07), &(A->carry));
        fn_C(A->s15, A->s16, &(A->s06), &(A->carry));
        fn_C(A->s14, A->s15, &(A->s05), &(A->carry));
      case (4):
        fn_C(A->s13, A->s14, &(A->s04), &(A->carry));
        fn_C(A->s12, A->s13, &(A->s03), &(A->carry));
        fn_C(A->s11, A->s12, &(A->s02), &(A->carry));
        fn_C(A->s10, A->s11, &(A->s01), &(A->carry));
    }

    for (int F = 0; F < D / 24; F++) {
      fn_C(A->s09, A->s10, &(A->s24), &(A->carry));
      fn_C(A->s08, A->s09, &(A->s23), &(A->carry));
      fn_C(A->s07, A->s08, &(A->s22), &(A->carry));
      fn_C(A->s06, A->s07, &(A->s21), &(A->carry));
      fn_C(A->s05, A->s06, &(A->s20), &(A->carry));
      fn_C(A->s04, A->s05, &(A->s19), &(A->carry));
      fn_C(A->s03, A->s04, &(A->s18), &(A->carry));
      fn_C(A->s02, A->s03, &(A->s17), &(A->carry));
      fn_C(A->s01, A->s02, &(A->s16), &(A->carry));
      fn_C(A->s24, A->s01, &(A->s15), &(A->carry));
      fn_C(A->s23, A->s24, &(A->s14), &(A->carry));
      fn_C(A->s22, A->s23, &(A->s13), &(A->carry));
      fn_C(A->s21, A->s22, &(A->s12), &(A->carry));
      fn_C(A->s20, A->s21, &(A->s11), &(A->carry));
      fn_C(A->s19, A->s20, &(A->s10), &(A->carry));
      fn_C(A->s18, A->s19, &(A->s09), &(A->carry));
      fn_C(A->s17, A->s18, &(A->s08), &(A->carry));
      fn_C(A->s16, A->s17, &(A->s07), &(A->carry));
      fn_C(A->s15, A->s16, &(A->s06), &(A->carry));
      fn_C(A->s14, A->s15, &(A->s05), &(A->carry));
      fn_C(A->s13, A->s14, &(A->s04), &(A->carry));
      fn_C(A->s12, A->s13, &(A->s03), &(A->carry));
      fn_C(A->s11, A->s12, &(A->s02), &(A->carry));
      fn_C(A->s10, A->s11, &(A->s01), &(A->carry));
    }

    if (E) {
      fn_C(A->s09, A->s10, &(A->s24), &(A->carry));
      fn_C(A->s08, A->s09, &(A->s23), &(A->carry));
      fn_C(A->s07, A->s08, &(A->s22), &(A->carry));
      fn_C(A->s06, A->s07, &(A->s21), &(A->carry));

      if (E > 4) {
        fn_C(A->s05, A->s06, &(A->s20), &(A->carry));
        fn_C(A->s04, A->s05, &(A->s19), &(A->carry));
        fn_C(A->s03, A->s04, &(A->s18), &(A->carry));
        fn_C(A->s02, A->s03, &(A->s17), &(A->carry));
      }

      if (E > 8) {
        fn_C(A->s01, A->s02, &(A->s16), &(A->carry));
        fn_C(A->s24, A->s01, &(A->s15), &(A->carry));
        fn_C(A->s23, A->s24, &(A->s14), &(A->carry));
        fn_C(A->s22, A->s23, &(A->s13), &(A->carry));
      }

      if (E > 12) {
        fn_C(A->s21, A->s22, &(A->s12), &(A->carry));
        fn_C(A->s20, A->s21, &(A->s11), &(A->carry));
        fn_C(A->s19, A->s20, &(A->s10), &(A->carry));
        fn_C(A->s18, A->s19, &(A->s09), &(A->carry));
      }

      if (E > 16) {
        fn_C(A->s17, A->s18, &(A->s08), &(A->carry));
        fn_C(A->s16, A->s17, &(A->s07), &(A->carry));
        fn_C(A->s15, A->s16, &(A->s06), &(A->carry));
        fn_C(A->s14, A->s15, &(A->s05), &(A->carry));
      }
    }

    A->stepnr = E;
  }

  return B;
}
void fn_E(ranluxcl_state_t* A) {
  if (A->stepnr == 4)
    fn_D(A);
  if (A->stepnr == 8)
    fn_D(A);
  if (A->stepnr == 12)
    fn_D(A);
  if (A->stepnr == 16)
    fn_D(A);
  if (A->stepnr == 20)
    fn_D(A);
}
void fn_H(ulong A, global ranluxcl_state_t* B) {
  ranluxcl_state_t C;
  ulong D, E, F;

  A ^= (A << 13);
  A ^= (A >> 7);
  A ^= (A << 17);
  D = A;
  A ^= (A << 13);
  A ^= (A >> 7);
  A ^= (A << 17);
  E = A;
  A ^= (A << 13);
  A ^= (A >> 7);
  A ^= (A << 17);
  F = A;
  C.s01 = (float)(D >> 40) / (float)16777216;
  C.s02 = (float)((D & 0x000000FFFFFFFFFF) >> 16) / (float)16777216;
  C.s03 = (float)(((D & 0x000000000000FFFF) << 8) + (E >> 56)) / (float)16777216;
  C.s04 = (float)((E & 0x00FFFFFFFFFFFFFF) >> 32) / (float)16777216;
  C.s05 = (float)((E & 0x00000000FFFFFFFF) >> 8) / (float)16777216;
  C.s06 = (float)(((E & 0x00000000000000FF) << 16) + (F >> 48)) / (float)16777216;
  C.s07 = (float)((F & 0x0000FFFFFFFFFFFF) >> 24) / (float)16777216;
  C.s08 = (float)(F & 0x0000000000FFFFFF) / (float)16777216;

  A ^= (A << 13);
  A ^= (A >> 7);
  A ^= (A << 17);
  D = A;
  A ^= (A << 13);
  A ^= (A >> 7);
  A ^= (A << 17);
  E = A;
  A ^= (A << 13);
  A ^= (A >> 7);
  A ^= (A << 17);
  F = A;
  C.s09 = (float)(D >> 40) / (float)16777216;
  C.s10 = (float)((D & 0x000000FFFFFFFFFF) >> 16) / (float)16777216;
  C.s11 = (float)(((D & 0x000000000000FFFF) << 8) + (E >> 56)) / (float)16777216;
  C.s12 = (float)((E & 0x00FFFFFFFFFFFFFF) >> 32) / (float)16777216;
  C.s13 = (float)((E & 0x00000000FFFFFFFF) >> 8) / (float)16777216;
  C.s14 = (float)(((E & 0x00000000000000FF) << 16) + (F >> 48)) / (float)16777216;
  C.s15 = (float)((F & 0x0000FFFFFFFFFFFF) >> 24) / (float)16777216;
  C.s16 = (float)(F & 0x0000000000FFFFFF) / (float)16777216;

  A ^= (A << 13);
  A ^= (A >> 7);
  A ^= (A << 17);
  D = A;
  A ^= (A << 13);
  A ^= (A >> 7);
  A ^= (A << 17);
  E = A;
  A ^= (A << 13);
  A ^= (A >> 7);
  A ^= (A << 17);
  F = A;
  C.s17 = (float)(D >> 40) / (float)16777216;
  C.s18 = (float)((D & 0x000000FFFFFFFFFF) >> 16) / (float)16777216;
  C.s19 = (float)(((D & 0x000000000000FFFF) << 8) + (E >> 56)) / (float)16777216;
  C.s20 = (float)((E & 0x00FFFFFFFFFFFFFF) >> 32) / (float)16777216;
  C.s21 = (float)((E & 0x00000000FFFFFFFF) >> 8) / (float)16777216;
  C.s22 = (float)(((E & 0x00000000000000FF) << 16) + (F >> 48)) / (float)16777216;
  C.s23 = (float)((F & 0x0000FFFFFFFFFFFF) >> 24) / (float)16777216;
  C.s24 = (float)(F & 0x0000000000FFFFFF) / (float)16777216;
  C.in24 = 0;
  C.stepnr = 0;
  C.carry = 0.0f;
  if (C.s24 == 0.0f)
    C.carry = 0.000000059604644775f;

  for (int G = 0; G < 16 * 2; G++) {
    fn_C(C.s09, C.s10, &(C.s24), &(C.carry));
    fn_C(C.s08, C.s09, &(C.s23), &(C.carry));
    fn_C(C.s07, C.s08, &(C.s22), &(C.carry));
    fn_C(C.s06, C.s07, &(C.s21), &(C.carry));
    fn_C(C.s05, C.s06, &(C.s20), &(C.carry));
    fn_C(C.s04, C.s05, &(C.s19), &(C.carry));
    fn_C(C.s03, C.s04, &(C.s18), &(C.carry));
    fn_C(C.s02, C.s03, &(C.s17), &(C.carry));
    fn_C(C.s01, C.s02, &(C.s16), &(C.carry));
    fn_C(C.s24, C.s01, &(C.s15), &(C.carry));
    fn_C(C.s23, C.s24, &(C.s14), &(C.carry));
    fn_C(C.s22, C.s23, &(C.s13), &(C.carry));
    fn_C(C.s21, C.s22, &(C.s12), &(C.carry));
    fn_C(C.s20, C.s21, &(C.s11), &(C.carry));
    fn_C(C.s19, C.s20, &(C.s10), &(C.carry));
    fn_C(C.s18, C.s19, &(C.s09), &(C.carry));
    fn_C(C.s17, C.s18, &(C.s08), &(C.carry));
    fn_C(C.s16, C.s17, &(C.s07), &(C.carry));
    fn_C(C.s15, C.s16, &(C.s06), &(C.carry));
    fn_C(C.s14, C.s15, &(C.s05), &(C.carry));
    fn_C(C.s13, C.s14, &(C.s04), &(C.carry));
    fn_C(C.s12, C.s13, &(C.s03), &(C.carry));
    fn_C(C.s11, C.s12, &(C.s02), &(C.carry));
    fn_C(C.s10, C.s11, &(C.s01), &(C.carry));
  }

  *B = C;
}

void fn_I(uint A, global ranluxcl_state_t* B) {
  int C, D;
  ranluxcl_state_t E;

  D = (get_global_size(0) * get_global_size(1) * get_global_size(2));

  int F = A * D + 1;

  int G = F + (get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1));

  if (G < 1)
    G = 1;

  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s01 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s02 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s03 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s04 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s05 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s06 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s07 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s08 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s09 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s10 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s11 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s12 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s13 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s14 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s15 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s16 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s17 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s18 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s19 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s20 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s21 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s22 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s23 = (G % 16777216) * 0.000000059604644775f;
  C = G / 53668;
  G = 40014 * (G - C * 53668) - C * 12211;
  if (G < 0)
    G = G + 2147483563;
  E.s24 = (G % 16777216) * 0.000000059604644775f;

  E.in24 = 0;
  E.stepnr = 0;
  E.carry = 0.0f;
  if (E.s24 == 0.0f)
    E.carry = 0.000000059604644775f;

  for (int H = 0; H < 16; H++) {
    fn_C(E.s09, E.s10, &(E.s24), &(E.carry));
    fn_C(E.s08, E.s09, &(E.s23), &(E.carry));
    fn_C(E.s07, E.s08, &(E.s22), &(E.carry));
    fn_C(E.s06, E.s07, &(E.s21), &(E.carry));
    fn_C(E.s05, E.s06, &(E.s20), &(E.carry));
    fn_C(E.s04, E.s05, &(E.s19), &(E.carry));
    fn_C(E.s03, E.s04, &(E.s18), &(E.carry));
    fn_C(E.s02, E.s03, &(E.s17), &(E.carry));
    fn_C(E.s01, E.s02, &(E.s16), &(E.carry));
    fn_C(E.s24, E.s01, &(E.s15), &(E.carry));
    fn_C(E.s23, E.s24, &(E.s14), &(E.carry));
    fn_C(E.s22, E.s23, &(E.s13), &(E.carry));
    fn_C(E.s21, E.s22, &(E.s12), &(E.carry));
    fn_C(E.s20, E.s21, &(E.s11), &(E.carry));
    fn_C(E.s19, E.s20, &(E.s10), &(E.carry));
    fn_C(E.s18, E.s19, &(E.s09), &(E.carry));
    fn_C(E.s17, E.s18, &(E.s08), &(E.carry));
    fn_C(E.s16, E.s17, &(E.s07), &(E.carry));
    fn_C(E.s15, E.s16, &(E.s06), &(E.carry));
    fn_C(E.s14, E.s15, &(E.s05), &(E.carry));
    fn_C(E.s13, E.s14, &(E.s04), &(E.carry));
    fn_C(E.s12, E.s13, &(E.s03), &(E.carry));
    fn_C(E.s11, E.s12, &(E.s02), &(E.carry));
    fn_C(E.s10, E.s11, &(E.s01), &(E.carry));
  }

  fn_B(&E, B);
}

void fn_F(uint A, global ranluxcl_state_t* B) {
  ulong C = (ulong)(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + (ulong)A * ((ulong)0xffffffff + 1);
  fn_H(C, B + (get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)));
}

float4 fn_G(ranluxcl_state_t* A) {
  float4 B = fn_D(A);

  float4 C;
  float D, E;

  D = sqrt(-2 * log(B.x));
  E = 2 * 3.1415926535f * B.y;
  C.x = D * cos(E);
  C.y = D * sin(E);

  D = sqrt(-2 * log(B.z));
  E = 2 * 3.1415926535f * B.w;
  C.z = D * cos(E);
  C.w = D * sin(E);

  return C;
}