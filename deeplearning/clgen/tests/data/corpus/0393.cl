__kernel void fn_A(__global int* A, __global int* B, int C, int D) {
  int E, F;

  E = get_global_id(0);
  for (F = E; F < C; F += D) {
    B[F] = A[F];
  }
}