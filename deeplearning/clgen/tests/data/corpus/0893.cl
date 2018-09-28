__kernel void fn_A(__global ulong* A, int B, int C) {
  int D = get_global_id(1) * 16;
  int E = get_global_id(0) * 16;

  __global ulong* F = (__global ulong*)(A[D * B + E]);

  for (int G = 0; G < C; G++) {
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
    F = (__global ulong*)(*F);
  }
  A[D * B + E] = F;
}

__kernel void fn_B(__global ulong* A, int B, int C) {
  int D = get_global_id(1) * 16 * B + get_global_id(0) * 16;
  A[D] = (ulong)(&(A[D]));
}