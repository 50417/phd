__kernel void fn_A(__global const uint* A, __local uchar* B, __global uint* C) {
  size_t D = get_local_id(0);
  size_t E = get_global_id(0);
  size_t F = get_group_id(0);
  size_t G = get_local_size(0);

  for (int H = 0; H < 256; ++H)
    B[D * 256 + H] = 0;

  barrier(1);

  for (int H = 0; H < 256; ++H) {
    uint I = A[F * G * 256 + H * G + D];

    B[D * 256 + I]++;
  }

  barrier(1);

  for (int H = 0; H < 256 / G; ++H) {
    uint J = 0;
    for (int K = 0; K < G; ++K)
      J += B[K * 256 + H * G + D];

    C[F * 256 + H * G + D] = J;
  }
}

__kernel void fn_B(__global const uint* A, __local uint* B, __global uint* C) {
  size_t D = get_local_id(0);
  size_t E = get_global_id(0);
  size_t F = get_group_id(0);
  size_t G = get_local_size(0);

  for (int H = 0; H < 256; ++H)
    B[D * 256 + H] = 0;

  barrier(1);

  for (int H = 0; H < 256; ++H) {
    uint I = A[F * G * 256 + H * G + D];

    B[D * 256 + I]++;
  }

  barrier(1);

  for (int H = 0; H < 256 / G; ++H) {
    uint J = 0;
    for (int K = 0; K < G; ++K)
      J += B[K * 256 + H * G + D];

    C[F * 256 + H * G + D] = J;
  }
}