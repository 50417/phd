__kernel void fn_A(__global int* A, __global int* B) {
  int C[16];
  for (int D = 0; D < 16; ++D) {
    int E[16];
    for (int F = 0; F < A[0]; ++F)
      E[F] = 1 + A[0];
    for (int F = A[0]; F < 16; ++F)
      E[F] = get_global_id(0);
    C[D] = E[D];
  }
  B[get_global_id(0)] = C[get_global_id(0)];
}