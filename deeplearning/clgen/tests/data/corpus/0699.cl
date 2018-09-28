__kernel void fn_A() {
  unsigned A = 0;

  while (__invariant(A <= 4), A < 4) {
    A = A + 1;
  }

  __assert(A == 4);
}