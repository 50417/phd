inline bool fn_A(float A, float B, __global float* C, __global int* D) {
  int2 E, F, G;
  int H = 0;
  int I = 0;
  bool J, K, L;
  J = 0;
  E = vload2(H++, D);
  for (int M = 0; M < E.y; M++) {
    F = vload2(H++, D);
    K = 1;
    for (int N = 0; N < F.y; N++) {
      G = vload2(H++, D);
      if (G.y == 0) {
        float3 O = vload3(I++, C);
        float3 P = vload3(I++, C);
        L = A * A * O.x + B * B * O.y + A * B * O.z + A * P.x + B * P.y + P.z < 0;
      } else {
        L = 1;
        for (int Q = 0; Q < G.y; Q++) {
          float3 O = vload3(I++, C);
          L *= ((O.x * A + O.y * B + O.z)) > 0;
        }
      }
      K *= (G.x == L);
    }
    J += (F.x == K);
  }
  return (E.x == J);
}

__kernel void fn_B(__global float* A, __global float* B, __global float* C, __global int* D, int E, int F, int G,

                   float H, float I, float J, float K,

                   int L, int M) {
  int N = get_global_id(0) + L;
  if (N >= G)
    return;
  int O = get_global_id(1) + M;
  if (O >= F)
    return;

  float P = N * 1.0f / F;
  float Q = O * 1.0f / F;
  float R, S;
  float T = 0.0f;
  for (int U = 0; U < E; U++) {
    float2 V = vload2(U, C);
    R = Q + V.x;
    S = P + V.y;
    T += fn_A(R, S, B, D);
  }
  T = T * K / E;

  float4 W = vload4((N * F + O), A);
  float X = 1.0f - T;
  W.x = W.x * X + H * T;
  W.y = W.y * X + I * T;
  W.z = W.z * X + J * T;
  W.w = 1.0f - X * (1 - W.w);
  vstore4(W, ((N * F) + O), A);
}