__kernel void fn_A(__global const uchar* A, __local uchar* B, __global uint* C, uint D) {
  size_t E = get_local_id(0);
  size_t F = get_global_id(0);
  size_t G = get_group_id(0);
  size_t H = get_local_size(0);

  for (int I = 0; I < D; ++I)
    B[E * D + I] = 0;

  barrier(1);

  for (int I = 0; I < D; ++I) {
    uchar J = A[G * H * D + I * H + E];

    B[E * D + J]++;
  }

  barrier(1);

  for (int I = 0; I < D / H; ++I) {
    uint K = 0;
    for (int L = 0; L < H; ++L)
      K += B[L * D + I * H + E];

    C[G * D + I * H + E] = K;
  }
}

__kernel void fn_B(__global uint* A, __global const uint* B, uint C) {
  size_t D = get_local_id(0);
  size_t E = get_global_size(0);
  uint F = 0;
  for (int G = 0; G < C; ++G) {
    F += B[G * E + D];
  }
  A[D] = F;
}