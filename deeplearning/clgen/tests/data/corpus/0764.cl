__kernel void fn_A(__global const float4* A, __global float4* B, float4 C, float D, float E, float F, int G, int H, int I, int J, int K, float L, float M, float N, float O) {
  int P = get_global_id(0);
  int Q = get_global_id(1);
  int R = P + Q * get_global_size(0);
  float S = 0.0f;
  float T, U, V, W;
  int X, Y;
  X = P + G;
  Y = Q + H;
  W = F * (Y - J) - I;
  V = E * (Y - J) + J;

  T = E * (X - I) - W;
  U = F * (X - I) + V;

  if (M == 0.0f)
    S = 0.0f;
  else {
    switch (K) {
      case 0:
        S = hypot((T - I) / D, U - J);
        break;

      case 1:
        S = fmax(__clc_fabs(T - I) / D, __clc_fabs(U - J));
        break;

      case 2:
        S = __clc_fabs(T - I) / D + __clc_fabs(U - J);
        break;
    }
    S /= M;
    S = (S - N) / O;
  }

  if (S < 0.0f)
    S = 0.0f;
  if (S > 1.0f)
    S = 1.0f;

  if (L > 0.9999f && L < 2.0001f)
    S *= S;
  else if (L != 1.0f)
    S = __clc_pow(S, L);

  B[R] = A[R] * (1.0f - S) + C * S;
}