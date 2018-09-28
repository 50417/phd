__kernel void fn_A() {
  int A = get_group_id(0);
  int B = get_local_id(0);
  __local int C[32];
  int D;

  for (int E = A; __global_invariant(__read_implies(C, __read_offset_bytes(C) / sizeof(int) == B)), E < 32; E += 32) {
    C[B] = 1;
    barrier(1);
    for (int F = B; __global_invariant(__implies(__dominator_enabled() & __read(C), __read_offset_bytes(C) / sizeof(int) == -B + 31)), __global_invariant(__write_implies(C, __write_offset_bytes(C) / sizeof(int) == -B + 31)), F < 32; F += 16)
      C[-B + 31] -= 5;
    barrier(1);
    for (int F = B; F < 32; F += 16)
      D = C[B];
  }
}