typedef float DATA_TYPE; __kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_A(__global DATA_TYPE* A, __global DATA_TYPE* B) {
  __local DATA_TYPE C[256 + 64 * 2] __attribute__((xcl_array_partition(cyclic, 4, 1)));
  ;
  __local DATA_TYPE D[256 + 64 * 2] __attribute__((xcl_array_partition(cyclic, 4, 1)));
  ;
  int E = get_group_id(0);
  if (E == 0) {
    async_work_group_copy(C, A, 256 + 64, 0);
  } else if (E > 0 & E < 16384 / 256 - 1) {
    async_work_group_copy(C, &A[256 * E - 64], 256 + 64 * 2, 0);
  } else if (E == 16384 / 256 - 1) {
    async_work_group_copy(C, &A[256 * E - 64], 256 + 64, 0);
  }
  barrier(1);

  int F, G;
  for (G = 1; G <= 64; ++G) {
    if (E == 0) {
      __attribute__((xcl_pipeline_loop)) for (F = 0; F < 256 + 64 - G; ++F) {
        if (F == 0) {
          D[F] = C[F];
        } else {
          D[F] = 0.33333f * (C[F - 1] + C[F] + C[F + 1]);
        }
      }
      __attribute__((xcl_pipeline_loop)) for (F = 0; F < 256 + 64 - G; ++F) {
        C[F] = D[F];
      }
    } else if (E > 0 & E < 16384 / 256 - 1) {
      __attribute__((xcl_pipeline_loop)) for (F = 0; F < 256 + 64 * 2 - G * 2; ++F) {
        D[F] = 0.33333f * (C[F + G - 1] + C[F + G] + C[F + G + 1]);
      }
      __attribute__((xcl_pipeline_loop)) for (F = 0; F < 256 + 64 * 2 - G * 2; ++F) {
        C[G + F] = D[F];
      }
    } else {
      __attribute__((xcl_pipeline_loop)) for (F = G; F < 256 + 64; ++F) {
        if (F == 256 + 64 - 1) {
          D[F] = C[F];
        } else {
          D[F] = 0.33333f * (C[F - 1] + C[F] + C[F + 1]);
        }
      }
      __attribute__((xcl_pipeline_loop)) for (F = G; F < 256 + 64; ++F) {
        C[F] = D[F];
      }
    }
  }
  barrier(1);

  if (E == 16384 / 256 - 1) {
    async_work_group_copy(&A[16384 - 256], &D[64], 256, 0);
  } else {
    async_work_group_copy(&A[256 * E], D, 256, 0);
  }
}