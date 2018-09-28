__kernel void fn_A(__global float* A, const uint B, const uint C) {
  uint D = get_global_id(0);
  uint E = D * (1 << (B + 1));

  uint F = E + (1 << B);

  if (F < C) {
    if (E < C) {
      A[E] = A[E] + A[F];
    }
  }
}