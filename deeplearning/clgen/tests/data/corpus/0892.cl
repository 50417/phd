__kernel void fn_A(__global ulong* A, long B, long C, int D) {
  if (get_local_id(0) % 64 < 32) {
    __global ulong* E = A + get_group_id(0) * C + (get_local_id(0) / 64) * 0 + (get_local_id(0) % 64) * D;
    while (B-- > 0) {
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
      E = (__global ulong*)(*E);
    }
    A[get_group_id(0) * C + (get_local_id(0) / 64) * 0 + (get_local_id(0) & 64) * D] = (ulong)(E);
  }
}

__kernel void fn_B(__global ulong* A, int B, int C, int D) {
  if (get_local_id(0) % 64 < 32) {
    int E = 0;
    __global ulong* F = A + get_group_id(0) * C * B + (get_local_id(0) / 64) * 0 + (get_local_id(0) % 64) * D;
    for (int G = 0; G < B - 1; G++) {
      F[E] = (ulong)(&F[E + C]);
      E = E + C;
    }
    F[E] = (ulong)F;
  }
}