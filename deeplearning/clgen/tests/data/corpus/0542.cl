int fn_A(int A); kernel void fn_B(global int* A); kernel void fn_C(global int* A) {
  int B = fn_A(0);

  A[B] = B;
  fn_B(A);
}