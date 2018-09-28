__kernel void fn_A(__global float* A, __global float* B, const uint C, const int D, __local float* E) {
  int F = get_global_id(0);
  int G = get_local_id(0);
  int H = get_local_size(0);
  int I = get_global_size(0);
  int J = get_group_id(0);

  float K = 0;
  float L = 2 * D + 1;
  float M;
  int N;

  for (N = -D; N <= D; N++) {
    if (((F + N) < 0) || ((F + N) >= C)) {
      M = 0;
    } else {
      M = A[F + N];
    }

    K = K + M;
  }

  B[F] = K / L;
}