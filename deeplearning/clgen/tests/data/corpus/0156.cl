__kernel void fn_A(__global float* A, __global float* B, uint C, uint D, uint E, uint F, uint G, uint H, float I) {
  uint J = get_global_id(0);
  uint K = get_global_id(1);
  uint L = get_global_id(2);

  uint M = J * G;
  uint N = K * H;

  uint O = E * F * L;

  float P = 0.0;
  for (uint Q = 0; Q < H; Q++) {
    const uint R = O + (E * (N + Q));
    for (uint S = 0; S < G; S++) {
      const uint T = R + M + S;
      const float U = A[T];
      P += U;
    }
  }

  uint V = C * D * L;
  uint W = V + (C * K);
  uint X = W + J;
  B[X] = P * I;
}

__kernel void fn_B(__global float* A, __global float* B, uint C, uint D, uint E, uint F, uint G, uint H, float I) {
  uint J = get_global_id(0);
  uint K = get_global_id(1);
  uint L = get_global_id(2);

  uint M = J / G;
  uint N = K / H;

  uint O = E * F * L;
  const uint P = O + (E * N);
  const uint Q = P + M;
  const float R = A[Q];

  uint S = C * D * L;
  uint T = S + (C * K);
  uint U = T + J;
  B[U] = R * I;
}