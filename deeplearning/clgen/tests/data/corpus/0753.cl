inline int fn_A(float A, float B, float C, __local int2* D, __local float4* E) {
  int2 F, G, H;
  int I = 0;
  int J = 0;
  bool K, L, M;
  bool N, O, P;
  K = N = 0;
  F = D[I++];
  for (int Q = 0; Q < F.y; Q++) {
    G = D[I++];
    L = O = 1;
    for (int R = 0; R < G.y; R++) {
      H = D[I++];
      if (H.y == 0) {
        float4 S = E[J++];
        float4 T = E[J++];
        M = A * A * S.x + C * C * S.y + A * C * S.z + A * T.x + C * T.y + T.z < 0;
        P = B * B * S.x + C * C * S.y + B * C * S.z + B * T.x + C * T.y + T.z < 0;
      } else {
        M = P = 1;
        for (int U = 0; U < H.y; U++) {
          float4 S = E[J++];
          M *= ((S.x * A + S.y * C + S.z)) > 0;
          P *= ((S.x * B + S.y * C + S.z)) > 0;
        }
      }
      L *= (H.x == M);
      O *= (H.x == P);
    }
    K += (G.x == L);
    N += (G.x == O);
  }
  return ((F.x == K) * 2 + (F.x == N));
}

__kernel void fn_B(__global uchar4* A, __global int2* B, __global float4* C, __global float2* D, int E, int F, uchar G, uchar H, uchar I, float J, int K, int L, __local int2* M, __local float4* N, int O, int P) {
  __local float2 Q[36];
  int R = get_local_id(1) * get_local_size(1) + get_local_id(0);
  if (R < O)
    M[R] = B[R];
  if (R < P)
    N[R] = C[R];
  if (R < 36)
    Q[R] = D[R];
  int S = get_global_id(0) + K;

  int T = get_global_id(1) + L;

  barrier(1);

  float U = S * 1.0f / E;
  float V = (T * 2 + 1) * 1.0f / E;
  float W = T * 2 * 1.0f / E;
  float X, Y, Z;
  float AA = 0.0f;
  float AB = 0.0f;
  for (int R = 0; R < 36; R++) {
    float2 AC = Q[R];
    X = W + AC.x;
    Y = V + AC.x;
    Z = U + AC.y;
    int AD = fn_A(X, Y, Z, M, N);
    AA += AD / 2;
    AB += AD % 2;
  }
  AA = AA * J / 36.0f;
  AB = AB * J / 36.0f;

  int AE = (S * E / 2 + T);
  uchar4 AF = A[AE];
  float AG = 1.0f - AA;
  float AH = 1.0f - AB;
  AF.x = AF.x * AG + G * AA;
  AF.y = (AF.y * (AG + AH) + H * (AA + AB)) / 2;
  AF.z = AF.z * AH + G * AB;
  AF.w = (AF.w * (AG + AH) + I * (AA + AB)) / 2;
  A[AE] = AF;
}