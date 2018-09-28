__kernel void fn_A(__global float* A, __global float* B, int C, int D, float E, float F) {
  const int G = get_global_id(0);
  const int H = get_global_id(1);

  float I = C / 2.0f;
  float J = D / 2.0f;

  float K = G - I;
  float L = H - J;

  int M = (int)(K * F + L * E + I);
  int N = (int)(L * F - K * E + J);

  if ((M >= 0) && (M < C) && (N >= 0) && (N < D)) {
    A[H * C + G] = B[N * C + M];
  }
}