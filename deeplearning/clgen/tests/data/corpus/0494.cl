__kernel void fn_A(int A, int B, int C, __global float* D, __global float* E, __global float* F, __local float* G, __local float* H) {
  int I = get_group_id(0);
  int J = get_group_id(1);

  int K = get_local_id(0);
  int L = get_local_id(1);

  int M = A * 16 * J;

  int N = M + A - 1;

  int O = 16;

  int P = 16 * I;

  int Q = 16 * B;

  float R = 0.0f;

  for (int S = M, T = P; S <= N; S += O, T += Q) {
    G[K + L * 16] = D[S + A * L + K];
    H[K + L * 16] = E[T + B * L + K];

    barrier(1);

    for (int U = 0; U < 16; ++U)
      R += G[U + L * 16] * H[K + U * 16];

    barrier(1);
  }

  F[get_global_id(1) * get_global_size(0) + get_global_id(0)] = R;
}