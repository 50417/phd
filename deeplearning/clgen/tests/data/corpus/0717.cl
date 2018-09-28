__kernel void fn_A(int A, int B, int C, __global float* D, __global const float* E, __global const float* F) {
  const int G = get_local_id(0);
  const int H = get_group_id(0);
  const int I = get_group_id(1);

  for (int J = 0; J < 1; J++) {
    float K[128];
    for (int L = 0; L < 128; L++) {
      K[L] = 0.0;
    }
    for (int M = 0; M < C / 16; M++) {
      float N[16];
      for (int O = 0; O < 16; O++) {
        N[O] = F[G + 4 * H + 4 * J + (16 * M + O) * (4 * (B / 4))];
      }
      for (int L = 0; L < 128; L++) {
        float P = 0.0;
        for (int O = 0; O < 16; O++) {
          P += E[O + 16 * M + (L + 128 * I) * (16 * (C / 16))] * N[O];
        }
        K[L] += P;
      }
    }
    for (int L = 0; L < 128; L++) {
      D[G + 4 * H + 4 * J + (128 * I + L) * (4 * (B / 4))] += K[L];
    }
  }
}