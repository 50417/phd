__kernel void fn_A(__global const uint* A, __global uint* B, uint C, __local ushort* D) {
  size_t E = get_local_id(0);
  size_t F = get_global_id(0);
  size_t G = get_group_id(0);
  size_t H = get_local_size(0);

  for (int I = 0; I < (1 << 8); ++I)
    D[E * (1 << 8) + I] = 0;

  barrier(1);

  for (int I = 0; I < (1 << 8); ++I) {
    uint J = A[F * (1 << 8) + I];
    J = (J >> C) & 0xFFU;
    D[E * (1 << 8) + J]++;
  }

  barrier(1);

  for (int I = 0; I < (1 << 8); ++I) {
    uint K = G * (1 << 8) * H + E * (1 << 8) + I;
    B[K] = D[E * (1 << 8) + I];
  }
}
__kernel void fn_B(__global const uint* A, __global const uint* B, uint C, __local ushort* D, __global uint* E) {
  size_t F = get_group_id(0);
  size_t G = get_local_id(0);
  size_t H = get_global_id(0);
  size_t I = get_local_size(0);

  for (int J = 0; J < (1 << 8); ++J) {
    uint K = F * (1 << 8) * I + G * (1 << 8) + J;
    D[G * (1 << 8) + J] = B[K];
  }

  barrier(1);

  for (int J = 0; J < (1 << 8); ++J) {
    uint L = A[H * (1 << 8) + J];
    L = (L >> C) & 0xFFU;
    uint M = D[G * (1 << 8) + L];
    E[M] = A[H * (1 << 8) + J];
    D[G * (1 << 8) + L] = M + 1;
    barrier(1);
  }
}