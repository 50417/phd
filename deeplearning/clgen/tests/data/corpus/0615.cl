__kernel void fn_A(__global float* A, __global float* B, const int C) {
  int D = get_global_id(0);
  int E = get_global_id(1);

  int F = get_global_size(0);
  int G = get_global_size(1);

  float H = 0.f;
  float I = 0.f;
  int J = D - C / 2;

  const int K = ((D - C / 2) < 0) ? C / 2 - D : 0;
  const int L = ((D + C / 2) >= F) ? C - (D + C / 2 - F + 1) : C;

  for (int M = K; M < L; ++M) {
    float N = exp((float)(-10.f * (M - C / 2.f) * (M - C / 2.f) / C / C));
    I += N;
    H += N * A[J + M + E * F];
  }

  B[D + E * F] = H / I;
}

__kernel void fn_B(__global float* A, __global float* B, const int C) {
  int D = get_global_id(0);
  int E = get_global_id(1);

  int F = get_global_size(0);
  int G = get_global_size(1);

  float H = 0.f;
  float I = 0.f;

  int J = E - C / 2;

  const int K = ((E - C / 2) < 0) ? C / 2 - E : 0;
  const int L = ((E + C / 2) >= G) ? C - (E + C / 2 - G + 1) : C;

  for (int M = K; M < L; ++M) {
    float N = exp((float)(-10.f * (M - C / 2.f) * (M - C / 2.f) / C / C));
    I += N;
    H += N * A[D + (J + M) * F];
  }

  B[D + E * F] = H / I;
}

__kernel void fn_C(__global float* A, __global float* B, const int C) {
  int D = get_global_id(0);
  int E = get_global_id(1);

  int F = get_global_size(0);
  int G = get_global_size(1);

  float H = 0.f;
  float I = 0.f;
  float J = 0.f;

  float K = 0.f;

  int L = D - C / 2;

  const int M = ((D - C / 2) < 0) ? C / 2 - D : 0;
  const int N = ((D + C / 2) >= F) ? C - (D + C / 2 - F + 1) : C;

  for (int O = M; O < N; ++O) {
    float P = exp((float)(-5.f * (O - C / 2.f) * (O - C / 2.f) / C / C));
    K += P;
    H += P * A[0 + 3 * (L + O) + 3 * E * F];
    I += P * A[1 + 3 * (L + O) + 3 * E * F];
    J += P * A[2 + 3 * (L + O) + 3 * E * F];
  }

  B[0 + 3 * (D + E * F)] = H / K;
  B[1 + 3 * (D + E * F)] = I / K;
  B[2 + 3 * (D + E * F)] = J / K;
}

__kernel void fn_D(__global float* A, __global float* B, const int C) {
  int D = get_global_id(0);
  int E = get_global_id(1);

  int F = get_global_size(0);
  int G = get_global_size(1);

  float H = 0.f;
  float I = 0.f;
  float J = 0.f;

  float K = 0.f;

  int L = E - C / 2;

  const int M = ((E - C / 2) < 0) ? C / 2 - E : 0;
  const int N = ((E + C / 2) >= G) ? C - (E + C / 2 - G + 1) : C;

  for (int O = M; O < N; ++O) {
    float P = exp((float)(-5.f * (O - C / 2.f) * (O - C / 2.f) / C / C));
    K += P;
    H += P * A[0 + 3 * (D + (L + O) * F)];
    I += P * A[1 + 3 * (D + (L + O) * F)];
    J += P * A[2 + 3 * (D + (L + O) * F)];
  }

  B[0 + 3 * (D + E * F)] = H / K;
  B[1 + 3 * (D + E * F)] = I / K;
  B[2 + 3 * (D + E * F)] = J / K;
}