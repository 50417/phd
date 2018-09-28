__kernel void fn_A() {
  int A = 0;

  while (__invariant(A <= 100), A < 100) {
    A = A + 1;
  }
}