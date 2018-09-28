int fn_A(int A, int B) {
  return A < 0 ? ((A + 1) / B - 1) : (A / B);
}

__kernel void fn_B(__global float4* A, __global float4* B, int C, int D, int E, int F, int4 G, int H, int I) {
  int J = get_global_id(0);
  int K = get_global_id(1);

  int L = fn_A(E, C) + J;
  int M = fn_A(F, D) + K;

  int N = max(G.s0, L * C) - E + C;
  int O = max(G.s1, M * D) - F + D;

  int P = min(G.s2, L * C + C) - E + C;
  int Q = min(G.s3, M * D + D) - F + D;

  int R, S;

  float4 T = (float4)(0.0f, 0.0f, 0.0f, 0.0f);

  int U = P - N;
  int V = Q - O;

  float W = 1.0f / (U * V);

  for (S = O; S < Q; ++S) {
    for (R = N; R < P; ++R) {
      T += A[S * H + R];
    }
  }
  B[K * I + J] = T * W;
}

__kernel void fn_C(__global float4* A, __global float4* B, int C, int D, float E, float F, int G, int H, float4 I, int J, int K) {
  int L = get_global_id(0);
  int M = get_global_id(1);

  int N = get_global_size(0);
  int O = fn_A(L + G, C) - fn_A(G, C);
  int P = fn_A(M + H, D) - fn_A(H, D);

  float4 Q = A[O + P * K];
  float4 R = I;

  int S = L + G;
  int T = M + H;

  int U = __clc_ceil(C * E);
  int V = __clc_ceil(D * F);

  int W = __clc_floor((C - E * C) / 2.0f);
  int X = __clc_floor((D - F * D) / 2.0f);

  int Y = fn_A(S, C) * C - G;
  int Z = fn_A(T, D) * D - H;

  float AA = U * V;

  float AB = Y + W + (float)(U) / 2.0f;
  float AC = Z + X + (float)(V) / 2.0f;

  if (J == 0 && (__clc_fabs(L - AB) * V + __clc_fabs(M - AC) * U < AA))
    R = Q;

  if (J == 1 && (((L - AB) / (float)U) * ((L - AB) / (float)U)) + (((M - AC) / (float)V) * ((M - AC) / (float)V)) <= 1.0f)
    R = Q;

  if (J == 2 && (L >= Y + W && M >= Z + X && L < Y + W + U && M < Z + X + V))
    R = Q;

  B[L + M * N] = R;
}