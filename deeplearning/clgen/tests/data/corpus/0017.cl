typedef struct TerrainVertex {
  float4 Position;
  float4 Normal;
} Vertex;

__kernel void fn_A(global Vertex* A, private int B, private int C

                   ) {
  float D = get_global_id(0);
  float E = get_global_id(1);
  float F = 1.0f;

  int G = (D * B) + E;

  A[G].Position.x = (E * F) + ((B - 1) * -0.5f);
  A[G].Position.y = 0.0f;
  A[G].Position.z = (-D * F) + ((C - 1) * 0.5f);
  A[G].Position.w = 0.0f;

  A[G].Normal = (float4)(0.0f, 1.0f, 0.0f, 0.0f);
}

__kernel void fn_B(global int* A, private int B

                   ) {
  int C = get_global_id(0);
  int D = get_global_id(1);
  int E = get_global_id(2);

  int F = ((C * (B - 1) + D) * 6) + E;

  if (E == 0)
    A[F] = C * B + D;

  if (E == 1 || E == 4)
    A[F] = C * B + D + 1;

  if (E == 2 || E == 3)
    A[F] = (C + 1) * B + D;

  if (E == 5)
    A[F] = (C + 1) * B + D + 1;
}

float fn_C(float2 A, float B, float C) {
  return (A.x * B + A.y * C);
}

float fn_D(float A, float B, float C) {
  return ((1 - C) * A + C * B);
}

float fn_E(float A) {
  return (A * A * A * (A * (6 * A - 15) + 10));
}

__kernel void fn_F(global float* A, global float2* B, global int* C, private int D, private int E) {
  int F = get_global_id(0);
  int G = get_global_id(1);

  int H, I, J, K, L, M;
  float N, O, P, Q, R, S, T, U, V;
  float W = 0.80f;
  float X = 2.0f;

  float Y = 10.0f;
  float Z = 1.0f / (float)D;
  float AA = 0.0f;

  for (int AB = 0; AB < E; AB++) {
    H = __clc_floor((float)G * Z);
    I = __clc_floor((float)F * Z);

    N = (float)G * Z - (float)H;
    O = (float)F * Z - (float)I;

    J = C[(H + C[I & 255]) & 255] & 7;
    K = C[(H + 1 + C[I & 255]) & 255] & 7;
    L = C[(H + C[(I + 1) & 255]) & 255] & 7;
    M = C[(H + 1 + C[(I + 1) & 255]) & 255] & 7;

    P = fn_C(B[J], N, O);
    Q = fn_C(B[K], N - 1.0f, O);
    R = fn_C(B[L], N, O - 1.0f);
    S = fn_C(B[M], N - 1.0f, O - 1.0f);

    N = fn_E(N);
    O = fn_E(O);

    T = fn_D(P, Q, N);
    U = fn_D(R, S, N);

    V = fn_D(T, U, O);

    AA += V * Y;
    Y *= W;
    Z *= X;
  }

  int AC = (F * D) + G;

  A[AC] = AA;
}

__kernel void fn_G(global Vertex* A, global float* B, private int C) {
  int D = get_global_id(0);
  int E = get_global_id(1);

  int F = (D * C) + E;

  A[F].Position.y = B[F];
}