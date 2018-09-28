__kernel void fn_A(const unsigned int A, __global const float* restrict B, __global const float* restrict C, __global float* restrict D, __local float* restrict E, __local float* restrict F) {
  int G, H;
  float I = 0.0f;

  const int J = get_global_id(0);
  const int K = get_global_id(1);

  const int L = get_group_id(0);
  const int M = get_group_id(1);

  const int N = get_local_id(0);
  const int O = get_local_id(1);

  const int P = A / 16;

  int Q = L * A * 16;
  const int R = 16;

  int S = M * 16;
  const int T = 16 * A;

  for (H = 0; H < P; H++) {
    E[O * 16 + N] = B[Q + O * A + N];
    F[O * 16 + N] = C[S + O * A + N];

    barrier(1);

    for (G = 0; G < 16; G++)
      I += E[O * 16 + G] * F[G * 16 + N];

    barrier(1);
    Q += R;
    S += T;
  }

  D[K * A + J] = I;
}