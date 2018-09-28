typedef struct {
  float x;
  float y;
  float z;
} floatk3;

floatk3 fn_A(floatk3 A, floatk3 B) {
  floatk3 C;
  C.x = A.y * B.z - A.z * B.y;
  C.y = A.z * B.x - A.x * B.z;
  C.z = A.x * B.y - A.y * B.x;

  return C;
}

floatk3 fn_B(floatk3 A) {
  float B = sqrt(A.x * A.x + A.y * A.y + A.z * A.z);
  A.x /= B;
  A.y /= B;
  A.z /= B;

  return A;
}

floatk3 fn_C(floatk3 A, floatk3 B) {
  A.x += B.x;
  A.y += B.y;
  A.z += B.z;

  return A;
}

floatk3 fn_D(floatk3 A, float B) {
  A.x *= B;
  A.y *= B;
  A.z *= B;

  return A;
}

int fn_E(floatk3 A) {
  int B = (A.x >= 0 && A.x < 512 - 1);
  int C = (A.y >= 0 && A.y < 512 - 1);
  int D = (A.z >= 0 && A.z < 512 - 1);

  return B && C && D;
}

int fn_F(int A, int B, int C) {
  return A * 512 * 512 + B * 512 + C;
}

float fn_G(floatk3 A, __global unsigned char* B) {
  if (!fn_E(A)) {
    return 0;
  }

  int C = __clc_floor(A.x);
  int D = __clc_floor(A.y);
  int E = __clc_floor(A.z);

  int F = __clc_ceil(A.x);
  int G = __clc_ceil(A.y);
  int H = __clc_ceil(A.z);

  float I = A.x - C;
  float J = A.y - D;
  float K = A.z - E;

  float L = I * B[fn_F(E, D, C)] + (1 - I) * B[fn_F(E, D, F)];
  float M = I * B[fn_F(E, G, C)] + (1 - I) * B[fn_F(E, G, F)];
  float N = I * B[fn_F(H, D, C)] + (1 - I) * B[fn_F(H, D, F)];
  float O = I * B[fn_F(H, G, C)] + (1 - I) * B[fn_F(H, G, F)];

  float P = J * L + (1 - J) * M;
  float Q = J * N + (1 - J) * O;

  float R = K * P + (1 - K) * Q;

  return R;
}

__kernel void fn_H(__global unsigned char* A, __global unsigned char* B, __global unsigned char* C) {
  floatk3 D = {.x = 1000, .y = 1000, .z = 1000};
  floatk3 E = {.x = -1, .y = -1, .z = -1};
  floatk3 F = {.x = 0, .y = 0, .z = 1};

  floatk3 G = fn_A(E, F);
  floatk3 H = fn_A(G, E);

  E = fn_B(E);
  G = fn_B(G);
  H = fn_B(H);

  float I = 3.14 / 4;
  float J = tan(I / 2.0) / (64 / 2);
  float K = 0.5;

  int L = 64;

  int M = get_global_id(0) - (64 / 2);

  int N = get_global_id(1) - (64 / 2);

  floatk3 O = fn_C(D, E);
  floatk3 P = fn_C(fn_C(O, fn_D(G, M * J)), fn_D(H, N * J));
  P = fn_C(P, fn_D(D, -1));
  P = fn_B(P);
  floatk3 Q = D;

  int R = 0;
  float S = 0;
  while (S < 255 && R < 5000) {
    R++;
    Q = fn_C(Q, fn_D(P, K));
    int T = fn_G(Q, B);
    S += fn_G(Q, A) * (0.01 + T);
  }

  C[(N + (64 / 2)) * 64 + (M + (64 / 2))] = S > 255 ? 255 : S;
}