__kernel void fn_A() {
  int A;

  *&A = 5;

  __assert(A == 5);
}