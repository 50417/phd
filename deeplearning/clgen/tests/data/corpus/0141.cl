__kernel void fn_A(__global uint4* A, __global uint4* B, __local uint4* C) {
  unsigned int D = get_local_id(0);
  unsigned int E = get_group_id(0);
  unsigned int F = get_global_id(0);

  unsigned int G = get_local_size(0);
  unsigned int H = F * 2;
  C[D] = A[H] + A[H + 1];

  barrier(1);

  for (unsigned int I = G >> 1; I > 0; I >>= 1) {
    if (D < I) {
      C[D] += C[D + I];
    }
    barrier(1);
  }

  if (D == 0)
    B[E] = C[0];
}