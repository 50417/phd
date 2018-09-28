__kernel void fn_A(__global float* A, int B, int C, int D, int E) {
  const int F = B - E;
  const int G = get_local_id(0);
  const int H = get_local_size(0);
  const int I = F / get_local_size(0);
  const int J = G * I;
  const int K = (G == H - 1) ? F : J + I;

  for (int L = 1; L < C; ++L) {
    for (int M = J; M < K; ++M) {
      const float N = fmin((A)[((L - 1) * D + (max(M - 1, 0)))], fmin((A)[((L - 1) * D + (M))], (A)[((L - 1) * D + (min(M + 1, F)))]));
      (A)[((L)*D + (M))] += N;
    }
    barrier(2);
  }
}