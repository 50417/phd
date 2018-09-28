__kernel void fn_A(__global int* A) {
  int B = 5;
  int C = B;
  A[0] = C;
}