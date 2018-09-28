kernel void fn_A() {
  unsigned int A = 0;

  while (__invariant(A >= 0), __invariant(A <= 100), A < 100) {
    A++;
  }

  while (__invariant(A >= 100), __invariant(A <= 200), A < 200) {
    A++;
  }

  while (__invariant(A >= 200), __invariant(A < 300), A < 300) {
    A++;
  }
}