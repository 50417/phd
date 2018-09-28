void fn_A(local int*); __kernel void fn_B(void) {
  __local int A;
  fn_A(&A);
}

__kernel void __attribute__((__overloadable__)) fn_C(local int* A) {
  *A = 5;
}