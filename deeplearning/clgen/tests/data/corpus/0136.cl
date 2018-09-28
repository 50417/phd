float fn_A(float4 A, float4 B, float4 C, float4 D, int E, float F, float G, float H, float I, float J) {
  float K = 1.f / J;
  float4 L = (float4)(0.f, 0.f, 0.f, 0.f);

  if (E == 1) {
    L = 2.f * B - D + F * F * I * I * K * K * (C - 2.f * B + A);
  } else if (E == 2) {
    float M = F * K / 2.f;
    L = -D + 2.f * B + I * I * K * K * ((C - 2.f * B + A) + M * ((C - B) * (C - B) - (B - A) * (B - A)));
  } else if (E == 3) {
    float N = F * K * K / 4.f;
    L = -D + 2.f * B + I * I * K * K * ((C - 2.f * B + A) + N * ((C - B) * (C - B) * (C - B) - (B - A) * (B - A) * (B - A)));
  }

  float O = L.y < G ? G : L.y;
  float P = O > H ? H : O;

  return P;
}

__kernel void fn_B(__global float4* A, __global float4* B, __global float4* C, __global float4* D, int E, int F, int G, float H, float I, float J, float K, float L) {
  unsigned int M = get_global_id(0);

  int N, O, P;
  int Q = 0;
  int R = G - 1;
  {
    int S = 0;

    N = M + S * G;
    O = Q + S * G;
    P = R + S * G;

    int T = N - 1;
    int U = N + 1;
    float4 V = C[T];
    float4 W = C[N];
    float4 X = C[U];
    float4 Y = D[N];

    float4 Z = (float4)(0.f, 0.f, 0.f, 0.f);
    V = T < O ? Z : V;
    X = U > P ? Z : X;

    float AA = fn_A(V, W, X, Y, F, H, I, J, K, L);
    A[N].y = AA;

    A[N].w = 1.;

    float AB = sin(AA * 12 * 3.14f);

    B[N].y = -1.f * AB + 1.f;
    B[N].x = 1.f * AB + 1.f;
    B[N] *= .09f;
  }
}