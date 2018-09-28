void fn_A(__local float*, __global float*); __kernel void fn_B(const int A, const float B, __local float* C, __global float* D) {
  int E = get_local_size(0);
  int F = get_local_id(0);
  int G = get_group_id(0);

  float H, I = 0.0f;
  int J, K, L;

  K = (G * E + F) * A;
  L = K + A;

  for (J = K; J < L; J++) {
    H = (J + 0.5f) * B;
    I += 4.0f / (1.0f + H * H);
  }

  C[F] = I;
  barrier(1);

  fn_A(C, D);
}
void fn_A(__local float* A, __global float* B) {
  int C = get_local_size(0);
  int D = get_local_id(0);
  int E = get_group_id(0);

  float F;
  int G;

  if (D == 0) {
    F = 0.0f;

    for (G = 0; G < C; G++) {
      F += A[G];
    }

    B[E] = F;
  }
}