__kernel void fn_A(__global uint4* A, __global uint4* B, __local uint4* C) {
  unsigned int D = get_local_id(0);
  unsigned int E = get_group_id(0);
  unsigned int F = get_global_id(0);

  unsigned int G = get_local_size(0);
  C[D] = A[F];
  barrier(1);

  for (unsigned int H = G / 2; H > 0; H >>= 1) {
    if (D < H) {
      C[D] += C[D + H];
    }
    barrier(1);
  }

  if (D == 0)
    B[E] = C[0];
}