struct S0 {
  int d;
  long b;
} fn_A() {
  struct S0 A = {3};
  A.d;
  return A;
}
__kernel void fn_B() {
  fn_A();
}