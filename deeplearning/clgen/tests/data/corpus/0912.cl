typedef float real_t; __kernel void fn_A(__global const real_t* A, __global const real_t* B, __global real_t* C, int D) {
  const int E = get_global_id(0);
  const int F = get_global_id(1);
  real_t G = 0;
  for (int H = 0; H != D; ++H) {
    G += A[F * D + H] * B[H * D + E];
  }
  C[F * D + E] = G;
}

real_t fn_B(__global const real_t* A, int B, int C, int D, int E, int F, int G) {
  return A[(D * B + F) * G + C * B + E];
}

__kernel void fn_C(__global const real_t* A, __global const real_t* B, __global real_t* C, int D) {
  const int E = get_local_id(1);
  const int F = get_local_id(0);
  const int G = get_group_id(1);
  const int H = get_group_id(0);
  __local real_t I[64][64];
  __local real_t J[64][64];
  real_t K = 0;

  for (int L = 0; L < D / 64; ++L) {
    I[E][F] = fn_B(A, 64, L, G, F, E, D);
    J[E][F] = fn_B(B, 64, H, L, F, E, D);

    barrier(1);
    for (int M = 0; M != 64; ++M) {
      K += I[E][M] * J[M][F];
    }
    barrier(1);
  }
  C[(G * 64 + E) * D + H * 64 + F] = K;
}