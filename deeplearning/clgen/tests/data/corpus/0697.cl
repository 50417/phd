__kernel void fn_A(__local int* A) {
  int B;

  B = A[0];
  A[0] = B;
}