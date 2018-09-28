__kernel void fn_A() {
  volatile int4 A = (int4)(1, 2, 3, 0);
  volatile int4 B = (int4)(2, 3, 4, 1);
  int4 C = min(A, B);
  __assert(C.x == 2);
}