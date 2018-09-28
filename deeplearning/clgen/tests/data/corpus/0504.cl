__kernel void fn_A(int A, const __global float* B, __global float* C, __local float* D, __local float* E) {
  unsigned int F = get_local_id(0);
  unsigned int G = get_group_id(0);

  float H = B[G];

  float I = (1.0f - H) * 5.0f + H * 30.f;
  float J = (1.0f - H) * 1.0f + H * 100.f;
  float K = (1.0f - H) * 0.25f + H * 10.f;
  float L = K * (1.0f / (float)A);
  float M = 0.30f * sqrt(L);
  float N = 0.02f * L;
  float O = exp(N);
  float P = 1.0f / O;
  float Q = exp(M);
  float R = 1.0f / Q;
  float S = (O - R) / (Q - R);
  float T = 1.0f - S;
  float U = S * P;
  float V = T * P;

  float W = I * exp(M * (2.0f * F - (float)A)) - J;
  D[F] = W > 0 ? W : 0.0f;

  barrier(1);

  for (int X = A; X > 0; X -= 2) {
    if (F < X) {
      E[F] = U * D[F] + V * D[F + 1];
    }
    barrier(1);

    if (F < X - 1) {
      D[F] = U * E[F] + V * E[F + 1];
    }
    barrier(1);
  }

  if (F == 0)
    C[G] = D[0];
}