__kernel void fn_A(__global uchar4* A, __global uchar4* B, const int C, const int D) {
  int E = get_global_id(0);
  int F = get_global_id(1);
  int G = F * C + E;
  float4 H = (float4)0.0f;

  if ((E >= 2) && (E < (C - 2)) && (F >= 2) && (F < (D - 2))) {
    float4 I = 0.00392156862745f * convert_float4(A[G]);
    float J = 0.0f;

    for (int K = -2; K <= 2; K++) {
      for (int L = -2; L <= 2; L++) {
        int M = (F + K) * C + (E + L);
        float4 N = 0.00392156862745f * convert_float4(A[M]);
        float O = fast_distance((float)(L), (float)(K));

        float P = exp(-0.5f * __clc_pow((O / 3.0f), 2.0f));

        float Q = N.x - I.x;
        float R = N.y - I.y;
        float S = N.z - I.z;

        float T = sqrt(Q * Q + R * R + S * S);

        float U = exp(-0.5f * __clc_pow((T / 0.2f), 2.0f));

        float V = P * U;
        J += V;
        H += V * N;
      }
    }
    H /= J;
    H.w = 1.0f;
  }

  B[G] = convert_uchar4_sat_rte(255.0f * H);
}