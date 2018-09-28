__kernel void fn_A(__global float* A, __global float* B, __global float* C, __global float* D, __local float* E, __local float* F, int G, int H) {
  int I = get_group_id(1);
  int J = get_local_id(0);
  int K = get_local_id(1);

  int L = (H + 1) * 16 * I + (H + 1) * K + J + 1 + (H + 1);

  int M = 16 * I + K + 1;

  if (J == 0)
    E[K] = A[M];
  barrier(1);

  F[K * 16 + J] = C[L];
  barrier(1);

  F[K * 16 + J] = F[K * 16 + J] * E[K];
  barrier(1);

  for (int N = 1; N <= 16; N = N * 2) {
    int O = N;

    if (K % O == 0)
      F[K * 16 + J] = F[K * 16 + J] + F[(K + O / 2) * 16 + J];

    barrier(1);
  }

  C[L] = F[K * 16 + J];

  barrier(1);

  if (J == 0) {
    D[I * H + K] = F[J * 16 + K];
  }
}

__kernel void fn_B(__global float* A, int B, __global float* C, int D, __global float* E, __global float* F) {
  int G = get_group_id(1);
  int H = get_local_id(0);
  int I = get_local_id(1);

  int J = (B + 1) * 16 * G + (B + 1) * I + H + 1 + (B + 1);
  int K = 16 * G + I + 1;
  int L = H + 1;

  E[J] += ((0.3f * A[L] * C[K]) + (0.3f * F[J]));
  F[J] = ((0.3f * A[L] * C[K]) + (0.3f * F[J]));

  barrier(1);

  if (I == 0 && G == 0) {
    E[L] += ((0.3f * A[L]) + (0.3f * F[L]));
    F[L] = ((0.3f * A[L]) + (0.3f * F[L]));
  }
}