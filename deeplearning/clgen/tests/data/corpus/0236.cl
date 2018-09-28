inline int fn_A(int A, int B, int C) {
  return 4 * C * B + A * 4;
}
inline float fn_B(float A) {
  return A * 3.25f - 2.f;
}
inline float fn_C(float A) {
  return A * 2.5f - 1.25f;
}

__kernel void fn_D(__global char* A) {
  int B = get_global_id(0);
  int C = get_global_id(1);
  int D = get_global_size(0);
  int E = get_global_size(1);
  int F = fn_A(B, C, D);

  float G = fn_B((float)B / (float)D);
  float H = fn_C((float)C / (float)E);

  float I = 0.0f;
  float J = 0.0f;

  int K = 0;

  int L = 256;
  while (I * I + J * J <= 4 && K < L) {
    float M = I * I - J * J + G;
    J = 2 * I * J + H;
    I = M;
    K++;
  }

  if (K == L) {
    A[F] = 0;
    A[F + 1] = 0;
    A[F + 2] = 0;
    A[F + 3] = 255;
  } else {
    A[F] = K;
    A[F + 1] = K;
    A[F + 2] = K;
    A[F + 3] = 255;
  }
}