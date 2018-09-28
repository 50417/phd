typedef uint4 data_t; inline void fn_A(__local uchar* A, uint B) {
  A[((B) * (64))]++;
}

inline void fn_B(__local uchar* A, uint B) {
  fn_A(A, (B >> 2) & 0x3FU);
  fn_A(A, (B >> 10) & 0x3FU);
  fn_A(A, (B >> 18) & 0x3FU);
  fn_A(A, (B >> 26) & 0x3FU);
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void fn_C(__global uint* A, __global data_t* B, uint C) {
  const uint D = ((get_local_id(0) & ~(16 * 4 - 1)) << 0) | ((get_local_id(0) & (16 - 1)) << 2) | ((get_local_id(0) & (16 * 3)) >> 4);

  __local uchar E[64 * 64];
  __local uchar* F = E + D;

  for (uint G = 0; G < (64 / 4); G++)
    ((__local uint*)E)[D + G * 64] = 0;

  barrier(1);
  for (uint H = get_global_id(0); H < C; H += get_global_size(0)) {
    data_t I = B[H];
    fn_B(F, I.x);
    fn_B(F, I.y);
    fn_B(F, I.z);
    fn_B(F, I.w);
  }

  barrier(1);
  if (get_local_id(0) < 64) {
    __local uchar* J = E + ((get_local_id(0)) * (64));

    uint K = 0;
    uint H = 4 * (get_local_id(0) & (16 - 1));
    for (uint G = 0; G < (64 / 4); G++) {
      K += J[H + 0] + J[H + 1] + J[H + 2] + J[H + 3];
      H = (H + 4) & (64 - 1);
    }

    A[get_group_id(0) * 64 + get_local_id(0)] = K;
  }
}
__kernel __attribute__((reqd_work_group_size(32, 1, 1))) void fn_D(__global uint* A, __global uint* B, uint C) {
  __local uint D[32];

  uint E = 0;
  for (uint F = get_local_id(0); F < C; F += 32)
    E += B[get_group_id(0) + F * 64];
  D[get_local_id(0)] = E;

  for (uint G = 32 / 2; G > 0; G >>= 1) {
    barrier(1);
    if (get_local_id(0) < G)
      D[get_local_id(0)] += D[get_local_id(0) + G];
  }

  if (get_local_id(0) == 0)
    A[get_group_id(0)] = D[0];
}