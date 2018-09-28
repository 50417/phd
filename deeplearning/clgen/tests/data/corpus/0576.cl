void fn_A(global int* A, int B) {
  *A = __builtin_clz(B);
}

void fn_B(global long* A, long B) {
  *A = __builtin_clzl(B);
}