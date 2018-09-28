__kernel void fn_A(__global uint* A, const uint B, const uint C, const uint D, const uint E) {
  uint F = E;
  uint G = get_global_id(0);

  uint H = 1 << (B - C);
  uint I = 2 * H;

  uint J = (G % H) + (G / H) * I;

  uint K = J + H;

  uint L = A[J];
  uint M = A[K];

  uint N = 1 << B;

  if ((G / N) % 2 == 1)
    F = 1 - F;

  uint O;
  uint P;
  if (L > M) {
    O = L;
    P = M;
  } else {
    O = M;
    P = L;
  }

  if (F) {
    A[J] = P;
    A[K] = O;
  } else {
    A[J] = O;
    A[K] = P;
  }
}