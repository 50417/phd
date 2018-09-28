__kernel void fn_A(__local float* A, __global float* B, __global float* C, __global float* D, __global float* E) {
  local float F, G;
  float H, I = 0.0f;

  int J = get_local_id(0);
  int K = get_global_size(0);

  A[J] = B[J * K];
  barrier(1);

  if (J == 0) {
    for (int L = 1; L < K; L++) {
      I += A[L] * A[L];
    }
    F = I;
    I = sqrt(I + A[0] * A[0]);
    B[0] = I;
    A[0] -= I;
    F += A[0] * A[0];
  } else {
    B[J * K] = 0.0f;
  }
  barrier(2);

  for (int L = 1; L < K; L++) {
    G = 0.0f;
    if (J == 0) {
      for (int M = 0; M < K; M++) {
        G += B[M * K + L] * A[M];
      }
    }
    barrier(1);
    B[J * K + L] -= 2 * A[J] * G / F;
  }

  for (int L = 0; L < K; L++) {
    C[J * K + L] = -2 * A[L] * A[J] / F;
  }
  C[J * K + J] += 1;
  barrier(2);

  for (int N = 1; N < K - 1; N++) {
    A[J] = B[J * K + N];
    barrier(1);

    if (J == N) {
      I = 0.0f;
      for (int L = N + 1; L < K; L++) {
        I += A[L] * A[L];
      }
      F = I;
      I = sqrt(I + A[N] * A[N]);
      A[N] -= I;
      F += A[N] * A[N];
      B[N * K + N] = I;
    } else if (J > N) {
      B[J * K + N] = 0.0f;
    }
    barrier(2);

    for (int L = N + 1; L < K; L++) {
      if (J == 0) {
        G = 0.0f;
        for (int M = N; M < K; M++) {
          G += B[M * K + L] * A[M];
        }
      }
      barrier(1);

      if (J >= N)
        B[J * K + L] -= 2 * A[J] * G / F;
      barrier(2);
    }

    if (J >= N) {
      for (int L = N; L < K; L++) {
        D[J * K + L] = -2 * A[L] * A[J] / F;
      }
      D[J * K + J] += 1;
    }
    barrier(2);

    for (int L = N; L < K; L++) {
      H = 0.0f;
      for (int M = N; M < K; M++) {
        H += C[J * K + M] * D[M * K + L];
      }
      E[J * K + L] = H;
    }
    barrier(2);

    for (int L = N; L < K; L++) {
      C[J * K + L] = E[J * K + L];
    }
    barrier(2);
  }
}