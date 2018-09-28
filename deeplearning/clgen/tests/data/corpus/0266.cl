__kernel void fn_A(const __global float* A, __constant float* B, __global float* C, const int D, const int E, const int F, const __global float* G) {
  const int H = get_global_size(0);
  const int I = get_global_size(1);

  const int J = get_global_id(0);
  const int K = get_global_id(1);

  __local float L[28 * 28];

  L[J * H + K] = A[J * H + K];
  barrier(1);

  float M = 0;
  int N = 0;

  for (int O = 0; O < D; O++) {
    for (N = 0; N < D; N++) {
      M += B[O * D + N] * L[((K + O) * H + J) + N];
    }
  }
  C[K * H + J] = M + *G;
}