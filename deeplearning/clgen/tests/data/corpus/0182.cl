__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void fn_A(__local volatile uint* A, __global uint* B) {
  const uint C = get_global_id(0);
  const uint D = get_local_id(0);
  const uint E = get_local_size(0);

  uint F = C;
  A[D] = F;
  barrier(1);

  int G = E / 2;
  for (; G > 1; G >>= 1) {
    if (D < G)
      A[D] = F = F + A[D + G];
    barrier(1);
  }

  for (; G > 0; G >>= 1) {
    if (D < G)
      A[D] = F = F + A[D + G];
  }

  if (D == 0)
    atomic_add(B, F);
}