__kernel void fn_A(__global int* A) {
  int B = 2;
  A[0] = B;
  int C = 3;
  A[1] = C;
}