__kernel void fn_A(__global float* A, __global float* B, __local float* C, const uint D) {
  int E = get_local_id(0);

  int F = 1;

  C[2 * E] = A[2 * E];
  C[2 * E + 1] = A[2 * E + 1];

  for (int G = D >> 1; G > 0; G >>= 1) {
    barrier(1);

    if (E < G) {
      int H = F * (2 * E + 1) - 1;
      int I = F * (2 * E + 2) - 1;

      C[I] += C[H];
    }
    F *= 2;
  }

  if (E == 0)
    C[D - 1] = 0;

  for (int G = 1; G < D; G *= 2) {
    F >>= 1;
    barrier(1);

    if (E < G) {
      int H = F * (2 * E + 1) - 1;
      int I = F * (2 * E + 2) - 1;

      float J = C[H];
      C[H] = C[I];
      C[I] += J;
    }
  }

  barrier(1);

  B[2 * E] = C[2 * E];
  B[2 * E + 1] = C[2 * E + 1];
}
__kernel void fn_B(__global float* A,

                   __local float* B,

                   __global float* C, const uint D) {
  const uint E = get_global_id(0);
  const uint F = get_local_id(0);
  const uint G = get_group_id(0);
  const uint H = get_local_size(0);

  const uint I = H << 1;
  int J = 1;

  const int K = F << 1;
  const int L = K + 1;

  const int M = E << 1;
  const int N = M + 1;

  uint O = F;
  uint P = F + H;
  uint Q = F + G * H * 2;
  uint R = Q + H;
  uint S = ((O) >> 4);
  uint T = ((P) >> 4);
  B[O + S] = (Q < D) ? A[Q] : 0;
  B[P + T] = (R < D) ? A[R] : 0;

  for (uint U = H; U > 0; U >>= 1) {
    barrier(1);

    if (F < U) {
      uint V = 2 * J * F;
      uint O = V + J - 1;
      uint P = O + J;
      O += ((O) >> 4);
      P += ((P) >> 4);

      B[P] += B[O];
    }
    J <<= 1;
  }

  barrier(1);
  if (F < 1) {
    uint W = I - 1;
    W += ((W) >> 4);
    C[G] = B[W];
    B[W] = 0;
  }

  for (uint U = 1; U < I; U <<= 1) {
    J >>= 1;
    barrier(1);

    if (F < U) {
      uint V = 2 * J * F;
      uint O = V + J - 1;
      uint P = O + J;
      O += ((O) >> 4);
      P += ((P) >> 4);

      float X = B[O];
      B[O] = B[P];
      B[P] += X;
    }
  }

  barrier(1);
  if (Q < D)
    A[Q] = B[O + S];
  if (R < D)
    A[R] = B[P + T];
}
__kernel void fn_C(__global float* A, __global const float* B, const uint C) {
  uint D = get_global_id(0) * 2;
  const uint E = get_local_id(0);
  const uint F = get_group_id(0);

  __local float G[1];

  if (E < 1) {
    G[0] = B[F];
  }

  barrier(1);

  unsigned int H = F * get_local_size(0) * 2 + get_local_id(0);

  if (H < C)
    A[H] += G[0];
  if (H + get_local_size(0) < C)
    A[H + get_local_size(0)] += G[0];
}