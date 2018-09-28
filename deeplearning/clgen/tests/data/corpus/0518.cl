__kernel void fn_A(__global int* A, int B, int C, __global int* D) {
  int E;
  int F;
  int G;

  E = get_global_id(0);

  F = E;
  G = (F + 1);

  D[G - 1] = A[G - 1] * B;
}