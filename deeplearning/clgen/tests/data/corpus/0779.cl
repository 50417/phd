__kernel void fn_A(int A, int B, int C, __global float* D, __global const float* E, __global const float* F) {
  const int G = get_local_id(0);
  const int H = get_local_id(1);
  const int I = get_group_id(0);
  const int J = get_group_id(1);

  __local float K[2048];
  const int L = 32 * H + G;
  float M[16];
  const int N = 128 * I + (32 * H + G);
  for (int O = 0; O < 16; O++) {
    M[O] = 0.0;
  }
  for (int P = 0; P < C / 128; P++) {
    for (int O = 0; O < 16; O++) {
      K[32 * H + G + 128 * O] = E[32 * H + G + 128 * P + (O + 16 * J) * (128 * (C / 128))];
    }
    barrier(1);
    for (int Q = 0; Q < C / (C / 128); Q++) {
      const int R = P * C / (C / 128) + Q;
      const float S = F[128 * I + (32 * H + G) + (P * C / (C / 128) + Q) * B];
      for (int O = 0; O < 16; O++) {
        M[O] += K[Q + 128 * O] * S;
      }
    }
    barrier(1);
  }
  for (int O = 0; O < 16; O++) {
    D[32 * H + G + 128 * I + (O + 16 * J) * (128 * (B / 128))] += M[O];
  }
}