__kernel void fn_A(__global float* A, __global uint* B, __global float* C, uint D, uint E, uint F, uint G, uint H, uint I, uint J, uint K, uint L) {
  const uint M = get_global_id(0);
  const uint N = get_global_id(1);
  const uint O = get_global_id(2);

  const uint P = M * K;
  const uint Q = N * L;

  const uint R = D * E * O;

  float S = -0x1.fffffep127f;
  uint T = 0;
  uint U = 0;
  for (uint V = 0; V < J; V++) {
    const uint W = R + (D * (Q + V));
    for (uint X = 0; X < I; X++) {
      const uint Y = W + P + X;
      const float Z = A[Y];
      if (Z > S) {
        T = X;
        U = V;
        S = Z;
      }
    }
  }

  const uint AA = G * H * O;
  const uint AB = AA + (G * N);
  C[AB + M] = S;

  B[AB + M] = (Q + U) * D + (P + T);
}

__kernel void fn_B(__global float* A, __global uint* B, __global float* C, uint D, uint E, uint F, uint G, uint H, uint I, uint J, uint K, uint L) {
  const uint M = get_global_id(0);
  const uint N = get_global_id(1);
  const uint O = get_global_id(2);
  const uint P = N * D + M;

  const uint Q = G * H * O;

  const uint R = (M < I) ? 0 : (M - I) / K + 1;
  const uint S = min(M / K + 1, G);

  const uint T = (N < J) ? 0 : (N - J) / L + 1;
  const uint U = min(N / L + 1, H);

  float V = 0.0;
  uint W = 0;
  for (uint X = T; X < U; X++) {
    const uint Y = Q + (G * X);
    for (uint Z = R; Z < S; Z++) {
      W++;
      const uint AA = Y + Z;

      if (B[AA] == P)
        V += C[AA];
    }
  }

  const uint AB = D * E * O;
  const uint AC = AB + (D * N);
  const uint AD = AC + M;

  A[AD] = V;
}