__kernel void fn_A(__local int* A, __local int* B, int C, int D) {
  A[C] = C;
  B[D] = A[D];
}