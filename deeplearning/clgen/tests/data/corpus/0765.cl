__kernel void fn_A(const global float4* A, global float4* B, const global float* C, const int D) {
  const int E = get_global_id(0);
  const int F = get_global_id(1);
  const int G = get_global_size(0);
  const int H = get_global_size(0);

  const int I = D / 2;

  const int J = E + (F + I) * G;
  const int K = E + F * H;

  const int L = J - I * G;

  float4 M = 0.0f;

  for (int N = 0; N < D; N++) {
    M += A[L + N * G] * C[N];
  }

  B[K] = M;
}

__kernel void fn_B(const global float4* A, global float4* B, const global float* C, const int D) {
  const int E = get_global_id(0);
  const int F = get_global_id(1);
  const int G = get_global_size(0) + D - 1;
  const int H = get_global_size(0);

  const int I = D / 2;

  const int J = E + F * G + I;
  const int K = E + F * H;

  const int L = J - I;

  float4 M = 0.0f;

  for (int N = 0; N < D; N++) {
    M += A[L + N] * C[N];
  }

  B[K] = M;
}