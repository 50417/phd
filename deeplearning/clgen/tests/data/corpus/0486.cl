struct S {
  char a;
  int b;
  char c;
};

kernel void fn_A(global struct S* A) {
  struct S B;
  B.a = 42;
  B.b = 0xF9FFFFF9;
  B.c = 127;

  *A = B;
}