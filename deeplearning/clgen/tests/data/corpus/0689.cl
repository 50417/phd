int fn_A(void); void fn_B(int* A) {
}

__kernel void fn_C() {
  int A;
  int B = fn_A();

  A = B;

  fn_B(&B);
}