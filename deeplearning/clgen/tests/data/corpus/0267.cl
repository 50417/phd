__kernel __attribute((reqd_work_group_size(64, 64, 1))) __attribute((num_simd_work_items(4))) void fn_A(__global float* restrict A, __global float* B, __global float* C, __global float* D, int E, int F) {
  __local float G[64][64];
  __local float H[64][64];
  __local float I[64];

  int J = get_group_id(0);
  int K = get_group_id(1);

  int L = get_local_id(0);
  int M = get_local_id(1);

  int N = E * 64 * K;
  int O = N + E - 1;
  int P = 64 * J;

  float Q = 0.0f;
  float R = 0.0f;

  if (M == 0) {
    I[L] = D[J * 64 + L];
  }

  for (int S = N, T = P; S <= O; S += 64, T += (64 * F)) {
    G[M][L] = B[S + E * M + L];
    H[L][M] = C[T + F * M + L];

    barrier(1);

    for (int U = 0; U < 64; ++U) {
      Q += G[M][U] * H[L][U];
    }

    barrier(1);
  }
  Q += I[L];

  A[get_global_id(1) * get_global_size(0) + get_global_id(0)] = fmax(R, Q);
}