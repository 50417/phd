__kernel void fn_A(__global int* A, __global int* B, __global int* C) {
  int D = C[0];
  int E = C[1];
  int F = (int)get_global_id(0);
  for (; F < E; F += D)
    B[F] = A[F];
}