float fn_A(float A) {
  return 1.0f / (1.0f + exp(-A));
}
__attribute__((reqd_work_group_size(10, 1, 1))) __kernel void fn_B(__global float* A, __global float* B, __global float* C, __global float* D) {
  int E = get_global_id(0);
  int F = get_local_id(0);

  __local float G[84];
  __local float H[84 * 10];

  if (F == 0) {
    for (int I = 0; I < 84; ++I) {
      G[I] = A[I];
    }
    for (int I = 0; I < 84 * 10; ++I) {
      H[I] = C[E * 84 + I];
    }
  }

  barrier(1);

  if (E < 10) {
    float J = 0.0f;

    float K[14];
    float L[14];

    for (int I = 0; I < 84; I += 14) {
      for (int M = 0; M < 14; ++M) {
        K[M] = G[I + M];
        L[M] = H[F * 84 + I + M];
      }

      for (int M = 0; M < 14; ++M) {
        float N = L[M] - K[M];
        J += N * N;
      }
    }
    B[E] = J;
  }
}