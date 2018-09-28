float fn_A(float A, float B, float C, float D); float fn_A(float A, float B, float C, float D) {
  float E = B - A;
  float F = C - D;
  float G = F / 2.0;

  if (E < -1 * G)
    return E + F;

  if (E >= G)
    return E - F;

  return E;
}

void fn_B(float A, float B, float* C, float* D);
void fn_B(float A, float B, float* C, float* D) {
  (*C) = sqrt(A * A + B * B);
  (*D) = atan2(B, A);
}

__kernel void fn_C(__global float* A, __global float* B, __global float* C, __global float* D, __private unsigned int E, __private unsigned int F) {
  size_t G = get_global_id(0);
  size_t H = E + G;

  float I = 0;
  float J = 0;
  float K = B[H];
  float L = B[F + H];
  float M = 0;
  float N = 0;

  fn_B(A[H], A[F + H], &I, &J);
  fn_B(C[H], C[F + H], &M, &N);

  if (G < F) {
    D[H] = (I - M) / K;
    D[F + H] = fn_A(J, N, 3.14, -1 * 3.14) / L;
  }
}