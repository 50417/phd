__constant const unsigned long gb_A = 1UL << 31; int fn_A(int A, int B) {
  char C[((int)1) << 40];

  char D[((int)1) << (-24)];

  return ((int)1) << (-16);
}

int fn_B(int A, int B) {
  int C = A << B;
  int D = ((int)1) << 33;

  int E = C + D;

  return E;
}

long fn_C(long A, long B) {
  long C = A >> B;
  long D = ((long)8) >> 65;

  long E = C + D;

  return E;
}

typedef __attribute__((ext_vector_type(4))) int int4;

int4 fn_D(int4 A, int4 B) {
  int4 C = A << B;

  int4 D = {1, 1, 1, 1};
  int4 E = {33, 34, -28, -29};
  int4 F = C + (D << E);

  return F;
}

int4 fn_E(int4 A, int B) {
  int4 C = A << B;

  int4 D = {1, 1, 1, 1};
  int4 E = C + (D << 34);

  return E;
}