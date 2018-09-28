__kernel void fn_A(const __global uint* const A, __constant uint* const B, __global uint* const C, const int D, const int E) {
  const int F = get_global_id(0);
  const int G = get_global_id(1);

  uint H = 0;
  for (int I = 0; I < E; ++I) {
    const int J = (G + I) * D + F;
    for (int K = 0; K < E; ++K)
      H += B[(I * E) + K] * A[J];
  }

  C[G * get_global_size(0) + F] = H;
}