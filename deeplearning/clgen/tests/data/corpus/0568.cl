kernel void fn_A(global int* A) {
  A[0] = 4;
}

__kernel void fn_B(__global int* A) {
  fn_A(A);
}