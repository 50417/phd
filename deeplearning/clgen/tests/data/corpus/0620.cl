int fn_A(int A) {
  return A + 1;
}

__kernel void fn_B() {
  int A = fn_A(2);
}