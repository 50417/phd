struct S {
  char a;
  int b;
  char c;
};

kernel void fn_A(local struct S* A, global struct S* B) {
  int C = get_local_id(0);

  struct S D;
  D.a = 42;
  D.b = 0xF9FFFFF9;
  D.c = 127;

  if (C == 0) {
    *A = D;
  }
  barrier(1);
  if (C == 1) {
    *B = *A;
  }
}