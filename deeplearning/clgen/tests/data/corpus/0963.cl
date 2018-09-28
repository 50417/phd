__kernel void __attribute__((reqd_work_group_size(1, 1, 1))) fn_A(__global int* A, __global int* B, __global int* C, __global int* D, const int E) {
  int F = 0;
  for (int G = 0; G < E; G++) {
    F = G + E;
    D[G] = A[G] * A[F] + B[G] * B[F] + C[G] * C[F];
  }

  return;
}