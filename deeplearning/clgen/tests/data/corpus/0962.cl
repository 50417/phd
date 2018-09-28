__kernel void __attribute__((reqd_work_group_size(1, 1, 1))) fn_A(__global int* A, __global int* B, __global int* C) {
  int D[16];
  int E[16];
readA:
  for (int F = 0; F < 16; F++)
    D[F] = A[F];
readB:
  for (int F = 0; F < 16; F++)
    E[F] = B[F];
vadd_writeC:
  for (int F = 0; F < 16; F++)
    C[F] = D[F] + E[F];
}