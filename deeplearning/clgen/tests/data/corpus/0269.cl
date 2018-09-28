__kernel void fn_A(__global float* A, __constant float* B, __global float* C, const int D, const int E, const float F, __local float* G) {
  int H = get_local_id(0);
  int I = get_local_id(1);

  int J = get_global_id(1);

  const int K = get_global_size(0);
  const int L = get_global_size(1);

  G[I * K + H] = A[J * K + H];
  if (I > (get_local_size(1) - E)) {
    G[(I + E - 1) * K + H] = A[(J + E - 1) * K + H];
  }
  barrier(1);

  float M = 0;
  for (int N = 0; N < E; N++) {
    for (int O = 0; O < D; O++) {
      M += B[N * D + O] * G[(I + N) * K + H + O];
    }
  }
  C[J * K + H] = M + F;
}