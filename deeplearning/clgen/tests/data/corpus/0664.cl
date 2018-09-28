int fn_A() {
  return 0;
}

__kernel void fn_B() {
  fn_A();
}