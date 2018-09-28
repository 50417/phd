__kernel void fn_A(int A, int B, int C, __global float* D, __global const float* E, __global const float* F) {
  const int G = get_local_id(0);
  const int H = get_group_id(0);
  const int I = get_group_id(1);

  const int J = 16 * H + G;
  float K = 0.0;
  for (int L = 0; L < C; L++) {
    K = K + E[L + I * C] * F[16 * H + G + L * B];
  }
  D[16 * H + G + I * B] += K;
}