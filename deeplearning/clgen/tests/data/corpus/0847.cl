float fn_A(float A) {
  return 1.0f / (1.0f + exp(-A));
}
__attribute__((reqd_work_group_size(28, 28, 3))) __kernel void fn_B(__global float* A, __global float* B, __constant float* C, __constant float* D) {
  int E = get_global_id(0);
  int F = get_global_id(1);
  int G = get_global_id(2);

  int H = get_local_id(0);
  int I = get_local_id(1);
  int J = get_local_id(2);

  __local float K[1024];
  __local float L[1 * 3 * 25];

  if (H == 0 && I == 0 && J == 0) {
    for (int M = 0; M < 32 * 32 * 1; ++M) {
      K[M] = A[M];
    }

    for (int M = 0; M < 1 * 3 * 25; ++M) {
      L[M] = C[G * 1 * 25 + M];
    }
  }

  barrier(1);

  if (E < 28 && F < 28 && G < 6) {
    float N = 0.0f;

    for (int M = 0; M < 1; ++M) {
      float O[25];
      float P[25];
      int Q = 0;
      int R = (J * 1 + M) * 25;

      for (int S = 0; S < 5; ++S) {
        for (int T = 0; T < 5; ++T) {
          O[Q] = K[(M * 32 + F + S) * 32 + E + T];
          P[Q] = L[R + Q];
          Q++;
        }
      }

      for (int S = 0; S < 25; ++S) {
        N += O[S] * P[S];
      }
    }

    int U = (G * 28 + F) * 28 + E;
    B[U] = fn_A(N + D[G]);
  }
}