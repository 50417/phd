__kernel void fn_A(int A, int B, int C) {
  __requires(A != B);
  __requires(A != C);
  __requires(B != C);

  for (int D = 0; __invariant(A != B), D < 100; D++) {
    int E = A;
    A = B;
    B = C;
    C = E;
  }
  __assert(A != B);
}