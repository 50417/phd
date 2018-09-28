__kernel void fn_A(const int A, const float B, __constant float2* C, __constant float2* D, __local float* E, __constant float* F, __global float* G) {
  int H = get_global_id(0);
  int I = get_local_id(0);
  int J = get_local_size(0);

  float2 K;
  K.x = 0.f;
  K.y = 0.f;

  float L;

  int M, N;
  for (M = 0; M < A; M += 256) {
    E[I] = F[M + I];

    barrier(1);

    for (N = 0; N < 256; N++) {
      L = E[N] - dot(D[I], K);

      K.y = K.x;
      K.x = L;

      float O = dot(C[I], K);
      float P = work_group_reduce_add(O);

      if (I == 0) {
        G[get_group_id(0) * A + M + N] = P + B * E[N];
      }
    }
  }
}