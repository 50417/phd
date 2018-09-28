__kernel void fn_A(__global int* A) {
  int B = 1;
  A[0] = B;
}