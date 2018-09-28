__kernel void fn_A(__global uchar4* A, __global uchar4* B, int C, int D, int E) {
  float F[9] = {1.0f, 2.0f, 1.0f, 2.0f, 4.0f, 2.0f, 1.0f, 2.0f, 1.0f};

  int2 G = (int2)(get_global_id(0) - 1, get_global_id(1) - 1);
  int2 H = (int2)(get_global_id(0) + 1, get_global_id(1) + 1);
  int2 I = (int2)(get_global_id(0), get_global_id(1));

  if (I.x < (C - E) && I.y < D) {
    int J = 0;
    float4 K = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
    float L = 0, M = 0, N = 0;
    for (int O = G.y; O <= H.y; O++) {
      for (int P = G.x; P <= H.x; P++) {
        float Q = F[J] / 16.0f;
        uchar4 R = A[clamp(O, 0, D - 1) * C + clamp(P, 0, C - 1)];
        L += R.x * Q;
        M += R.y * Q;
        N += R.z * Q;
        J += 1;
      }
    }

    B[I.y * C + I.x] = (uchar4)(L, M, N, 0);
  }
}