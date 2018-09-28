void fn_A(__private int* A) {
  *A = 5;
}

__kernel void fn_B() {
  int A;

  A = 4;

  fn_A(&A);

  __assert(A == 4);
}