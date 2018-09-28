__kernel void fn_A(__global int* A) {
  int B = 5;
  int C = B;
  int D = C;
  A[0] = D;
}