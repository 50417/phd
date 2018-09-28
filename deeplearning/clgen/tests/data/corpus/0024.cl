inline void fn_A(volatile __local uint* A, uint B, uint C) {
  uint D;
  do {
    D = A[B] & ((1U << (32U - 5)) - 1U);
    D = C | (D + 1);
    A[B] = D;
  } while (A[B] != D);
}

inline void fn_B(volatile __local uint* A, uint B, uint C) {
  fn_A(A, (B >> 0) & 0xFFU, C);
  fn_A(A, (B >> 8) & 0xFFU, C);
  fn_A(A, (B >> 16) & 0xFFU, C);
  fn_A(A, (B >> 24) & 0xFFU, C);
}

__kernel

    void
    fn_C(__global uint* A, __global uint* B, uint C) {
  __local uint D[8 * 256];
  __local uint* E = D + (get_local_id(0) >> 5) * 256;

  for (uint F = 0; F < (256 / (1U << 5)); F++)
    D[get_local_id(0) + F * (8 * (1U << 5))] = 0;

  const uint G = get_local_id(0) << (32 - 5);

  barrier(1);
  for (uint H = get_global_id(0); H < C; H += get_global_size(0)) {
    uint I = B[H];
    fn_B(E, I, G);
  }

  barrier(1);
  for (uint H = get_local_id(0); H < 256; H += (8 * (1U << 5))) {
    uint J = 0;

    for (uint F = 0; F < 8; F++)
      J += D[H + F * 256] & ((1U << (32U - 5)) - 1U);

    A[get_group_id(0) * 256 + H] = J;
  }
}
__kernel

    void
    fn_D(__global uint* A, __global uint* B, uint C) {
  __local uint D[32];

  uint E = 0;
  for (uint F = get_local_id(0); F < C; F += 32)
    E += B[get_group_id(0) + F * 256];
  D[get_local_id(0)] = E;

  for (uint G = 32 / 2; G > 0; G >>= 1) {
    barrier(1);
    if (get_local_id(0) < G)
      D[get_local_id(0)] += D[get_local_id(0) + G];
  }

  if (get_local_id(0) == 0)
    A[get_group_id(0)] = D[0];
}