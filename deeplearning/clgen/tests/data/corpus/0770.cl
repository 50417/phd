__kernel void fn_A(const __global float* A, __constant float* B, __global float* C, const int D, const int E) {
  const int F = get_global_size(0);

  const int G = get_global_id(0);
  const int H = get_global_id(1);

  const int I = G;
  const int J = H;

  float K = 0;
  for (int L = 0; L < E; L++) {
    const int M = L * E;

    const int N = J + L;
    const int O = N * D + I;

    for (int P = 0; P < E; P++) {
      const int Q = M + P;
      const int R = O + P;
      K += B[Q] * A[R];
    }
  }
  const int S = H * F + G;
  C[S] = K;
}