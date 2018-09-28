struct S {
  int a;
  char b[2];
};

kernel void fn_A(global char* A) {
  struct S B = {-1, {42, 7}};
  int C = get_global_id(0);
  A[C] = B.b[C];
}