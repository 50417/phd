inline int fn_A(__local int* A, size_t B, const uint C) {
  if (C > 0)
    A[B] = A[B - 1] + A[B];
  if (C > 1)
    A[B] = A[B - 2] + A[B];
  if (C > 3)
    A[B] = A[B - 4] + A[B];
  if (C > 7)
    A[B] = A[B - 8] + A[B];
  if (C > 15)
    A[B] = A[B - 16] + A[B];

  return (C > 0) ? A[B - 1] : 0;
}

inline int fn_B(__local int* A, size_t B, const uint C) {
  if (C > 0)
    A[B] = A[B - 1] + A[B];
  if (C > 1)
    A[B] = A[B - 2] + A[B];
  if (C > 3)
    A[B] = A[B - 4] + A[B];
  if (C > 7)
    A[B] = A[B - 8] + A[B];
  if (C > 15)
    A[B] = A[B - 16] + A[B];

  return A[B];
}

inline int fn_C(__local int* A, const uint B, const uint C, const uint D) {
  int E = fn_A(A, B, C);
  barrier(1);

  if (C > 30)
    A[D] = A[B];
  barrier(1);

  if (D < 1)
    fn_B(A, B, C);
  barrier(1);

  if (D > 0)
    E = A[D - 1] + E;
  barrier(1);

  A[B] = E;
  barrier(1);

  return E;
}

__kernel void fn_D(__local int* A, __global int* B, const uint C, uint D, const uint E) {
  size_t F = get_local_id(0);
  const uint G = get_group_id(0);
  const uint H = get_local_size(0);

  const uint I = F & 31;
  const uint J = F >> 5;

  int K = 0;

  for (uint L = 0; L < E; ++L) {
    const uint M = L * H + (G * C);
    const uint N = M + F;

    if (N > D - 1)
      return;

    int O = A[F] = B[N];
    barrier(1);

    int P = fn_C(A, F, I, J);

    P = P + K;

    B[N] = P;

    if (F == (H - 1)) {
      A[F] = O + P;
    }
    barrier(1);

    K = A[H - 1];
    barrier(1);
  }
}