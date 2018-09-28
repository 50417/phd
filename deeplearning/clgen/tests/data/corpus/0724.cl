__attribute__((always_inline)) float fn_A(int A, float* B) {
  if (A > 512)
    A -= 1024;

  float C = A * -0x1.921fb6p-8F;
  *B = cos(C);
  return sin(C);
}

__attribute__((always_inline)) float4 fn_B(int4 A, float4* B) {
  A -= (A > 512) & 1024;
  float4 C = convert_float4(A) * -0x1.921fb6p-8F;
  *B = cos(C);
  return sin(C);
}
__attribute__((always_inline)) void fn_C(uint A, const __global float* B, const __global float* C, __local float* D) {
  const __global float4* E;
  __local float* F;

  E = (const __global float4*)(B + (A << 2));
  float4 G = E[0 * 64];
  float4 H = E[1 * 64];
  float4 I = E[2 * 64];
  float4 J = E[3 * 64];

  E = (const __global float4*)(C + (A << 2));
  float4 K = E[0 * 64];
  float4 L = E[1 * 64];
  float4 M = E[2 * 64];
  float4 N = E[3 * 64];

  do {
    float4 O = G + I;
    float4 P = H + J;
    float4 Q = O + P;
    float4 R = G - I;
    float4 S = O - P;
    float4 T = H - J;
    float4 U = K + M;
    float4 V = L + N;
    float4 W = U + V;
    float4 X = K - M;
    float4 Y = U - V;
    float4 Z = L - N;
    G = Q;
    K = W;
    H = R + Z;
    L = X - T;
    J = R - Z;
    N = T + X;
    I = S;
    M = Y;
  } while (0);

  int4 AA = (int)(A << 2) + (int4)(0, 1, 2, 3);
  do {
    float4 AB;
    float4 AC = fn_B(AA * 1, &AB);
    do {
      float4 AD = AB * H - AC * L;
      L = AB * L + AC * H;
      H = AD;
    } while (0);
    float4 AE;
    float4 AF = fn_B(AA * 2, &AE);
    do {
      float4 AD = AE * I - AF * M;
      M = AE * M + AF * I;
      I = AD;
    } while (0);
    float4 AG;
    float4 AH = fn_B(AA * 3, &AG);
    do {
      float4 AD = AG * J - AH * N;
      N = AG * N + AH * J;
      J = AD;
    } while (0);
  } while (0);

  F = D + ((A << 2) + (A >> 3));

  F[0] = G.x;
  F[1] = G.y;
  F[2] = G.z;
  F[3] = G.w;
  F += 66 * 4;

  F[0] = H.x;
  F[1] = H.y;
  F[2] = H.z;
  F[3] = H.w;
  F += 66 * 4;

  F[0] = I.x;
  F[1] = I.y;
  F[2] = I.z;
  F[3] = I.w;
  F += 66 * 4;

  F[0] = J.x;
  F[1] = J.y;
  F[2] = J.z;
  F[3] = J.w;
  F += 66 * 4;

  F[0] = K.x;
  F[1] = K.y;
  F[2] = K.z;
  F[3] = K.w;
  F += 66 * 4;

  F[0] = L.x;
  F[1] = L.y;
  F[2] = L.z;
  F[3] = L.w;
  F += 66 * 4;

  F[0] = M.x;
  F[1] = M.y;
  F[2] = M.z;
  F[3] = M.w;
  F += 66 * 4;

  F[0] = N.x;
  F[1] = N.y;
  F[2] = N.z;
  F[3] = N.w;

  barrier(1);
}

__attribute__((always_inline)) void fn_D(uint A, __local float* B) {
  __local float* C;

  C = B + (A + (A >> 5));

  float4 D, E, F, G;

  D.x = C[0 * 66];
  E.x = C[1 * 66];
  F.x = C[2 * 66];
  G.x = C[3 * 66];
  C += 66 * 4;

  D.y = C[0 * 66];
  E.y = C[1 * 66];
  F.y = C[2 * 66];
  G.y = C[3 * 66];
  C += 66 * 4;

  D.z = C[0 * 66];
  E.z = C[1 * 66];
  F.z = C[2 * 66];
  G.z = C[3 * 66];
  C += 66 * 4;

  D.w = C[0 * 66];
  E.w = C[1 * 66];
  F.w = C[2 * 66];
  G.w = C[3 * 66];
  C += 66 * 4;

  float4 H, I, J, K;

  H.x = C[0 * 66];
  I.x = C[1 * 66];
  J.x = C[2 * 66];
  K.x = C[3 * 66];
  C += 66 * 4;

  H.y = C[0 * 66];
  I.y = C[1 * 66];
  J.y = C[2 * 66];
  K.y = C[3 * 66];
  C += 66 * 4;

  H.z = C[0 * 66];
  I.z = C[1 * 66];
  J.z = C[2 * 66];
  K.z = C[3 * 66];
  C += 66 * 4;

  H.w = C[0 * 66];
  I.w = C[1 * 66];
  J.w = C[2 * 66];
  K.w = C[3 * 66];

  do {
    float4 L = D + F;
    float4 M = E + G;
    float4 N = L + M;
    float4 O = D - F;
    float4 P = L - M;
    float4 Q = E - G;
    float4 R = H + J;
    float4 S = I + K;
    float4 T = R + S;
    float4 U = H - J;
    float4 V = R - S;
    float4 W = I - K;
    D = N;
    H = T;
    E = O + W;
    I = U - Q;
    G = O - W;
    K = Q + U;
    F = P;
    J = V;
  } while (0);

  int X = (int)(A << 2);
  do {
    float Y;
    float Z = fn_A(X * 1, &Y);
    do {
      float4 AA = Y * E - Z * I;
      I = Y * I + Z * E;
      E = AA;
    } while (0);
    float AB;
    float AC = fn_A(X * 2, &AB);
    do {
      float4 AA = AB * F - AC * J;
      J = AB * J + AC * F;
      F = AA;
    } while (0);
    float AD;
    float AE = fn_A(X * 3, &AD);
    do {
      float4 AA = AD * G - AE * K;
      K = AD * K + AE * G;
      G = AA;
    } while (0);
  } while (0);

  barrier(1);

  C = B + ((A << 2) + (A >> 3));

  C[0] = D.x;
  C[1] = E.x;
  C[2] = F.x;
  C[3] = G.x;
  C += 66 * 4;

  C[0] = D.y;
  C[1] = E.y;
  C[2] = F.y;
  C[3] = G.y;
  C += 66 * 4;

  C[0] = D.z;
  C[1] = E.z;
  C[2] = F.z;
  C[3] = G.z;
  C += 66 * 4;

  C[0] = D.w;
  C[1] = E.w;
  C[2] = F.w;
  C[3] = G.w;
  C += 66 * 4;

  C[0] = H.x;
  C[1] = I.x;
  C[2] = J.x;
  C[3] = K.x;
  C += 66 * 4;

  C[0] = H.y;
  C[1] = I.y;
  C[2] = J.y;
  C[3] = K.y;
  C += 66 * 4;

  C[0] = H.z;
  C[1] = I.z;
  C[2] = J.z;
  C[3] = K.z;
  C += 66 * 4;

  C[0] = H.w;
  C[1] = I.w;
  C[2] = J.w;
  C[3] = K.w;

  barrier(1);
}

__attribute__((always_inline)) void fn_E(uint A, __local float* B) {
  __local float* C;

  C = B + (A + (A >> 5));

  float4 D, E, F, G;

  D.x = C[0 * 66];
  E.x = C[1 * 66];
  F.x = C[2 * 66];
  G.x = C[3 * 66];
  C += 66 * 4;

  D.y = C[0 * 66];
  E.y = C[1 * 66];
  F.y = C[2 * 66];
  G.y = C[3 * 66];
  C += 66 * 4;

  D.z = C[0 * 66];
  E.z = C[1 * 66];
  F.z = C[2 * 66];
  G.z = C[3 * 66];
  C += 66 * 4;

  D.w = C[0 * 66];
  E.w = C[1 * 66];
  F.w = C[2 * 66];
  G.w = C[3 * 66];
  C += 66 * 4;

  float4 H, I, J, K;

  H.x = C[0 * 66];
  I.x = C[1 * 66];
  J.x = C[2 * 66];
  K.x = C[3 * 66];
  C += 66 * 4;

  H.y = C[0 * 66];
  I.y = C[1 * 66];
  J.y = C[2 * 66];
  K.y = C[3 * 66];
  C += 66 * 4;

  H.z = C[0 * 66];
  I.z = C[1 * 66];
  J.z = C[2 * 66];
  K.z = C[3 * 66];
  C += 66 * 4;

  H.w = C[0 * 66];
  I.w = C[1 * 66];
  J.w = C[2 * 66];
  K.w = C[3 * 66];

  do {
    float4 L = D + F;
    float4 M = E + G;
    float4 N = L + M;
    float4 O = D - F;
    float4 P = L - M;
    float4 Q = E - G;
    float4 R = H + J;
    float4 S = I + K;
    float4 T = R + S;
    float4 U = H - J;
    float4 V = R - S;
    float4 W = I - K;
    D = N;
    H = T;
    E = O + W;
    I = U - Q;
    G = O - W;
    K = Q + U;
    F = P;
    J = V;
  } while (0);

  int X = (int)((A >> 2) << 4);
  do {
    float Y;
    float Z = fn_A(X * 1, &Y);
    do {
      float4 AA = Y * E - Z * I;
      I = Y * I + Z * E;
      E = AA;
    } while (0);
    float AB;
    float AC = fn_A(X * 2, &AB);
    do {
      float4 AA = AB * F - AC * J;
      J = AB * J + AC * F;
      F = AA;
    } while (0);
    float AD;
    float AE = fn_A(X * 3, &AD);
    do {
      float4 AA = AD * G - AE * K;
      K = AD * K + AE * G;
      G = AA;
    } while (0);
  } while (0);

  barrier(1);

  C = B + A;

  C[0 * 66] = D.x;
  C[1 * 66] = D.y;
  C[2 * 66] = D.z;
  C[3 * 66] = D.w;
  C += 66 * 4;

  C[0 * 66] = E.x;
  C[1 * 66] = E.y;
  C[2 * 66] = E.z;
  C[3 * 66] = E.w;
  C += 66 * 4;

  C[0 * 66] = F.x;
  C[1 * 66] = F.y;
  C[2 * 66] = F.z;
  C[3 * 66] = F.w;
  C += 66 * 4;

  C[0 * 66] = G.x;
  C[1 * 66] = G.y;
  C[2 * 66] = G.z;
  C[3 * 66] = G.w;
  C += 66 * 4;

  C[0 * 66] = H.x;
  C[1 * 66] = H.y;
  C[2 * 66] = H.z;
  C[3 * 66] = H.w;
  C += 66 * 4;

  C[0 * 66] = I.x;
  C[1 * 66] = I.y;
  C[2 * 66] = I.z;
  C[3 * 66] = I.w;
  C += 66 * 4;

  C[0 * 66] = J.x;
  C[1 * 66] = J.y;
  C[2 * 66] = J.z;
  C[3 * 66] = J.w;
  C += 66 * 4;

  C[0 * 66] = K.x;
  C[1 * 66] = K.y;
  C[2 * 66] = K.z;
  C[3 * 66] = K.w;

  barrier(1);
}

__attribute__((always_inline)) void fn_F(uint A, __local float* B) {
  __local float* C;

  C = B + ((A & 0x3) + ((A >> 2) & 0x3) * (66 * 4) + ((A >> 4) << 2));

  float4 D, E, F, G;

  D.x = C[0 * 66];
  D.y = C[1 * 66];
  D.z = C[2 * 66];
  D.w = C[3 * 66];
  C += 16;

  E.x = C[0 * 66];
  E.y = C[1 * 66];
  E.z = C[2 * 66];
  E.w = C[3 * 66];
  C += 16;

  F.x = C[0 * 66];
  F.y = C[1 * 66];
  F.z = C[2 * 66];
  F.w = C[3 * 66];
  C += 16;

  G.x = C[0 * 66];
  G.y = C[1 * 66];
  G.z = C[2 * 66];
  G.w = C[3 * 66];
  C += 66 * 4 * 4 - 3 * 16;

  float4 H, I, J, K;

  H.x = C[0 * 66];
  H.y = C[1 * 66];
  H.z = C[2 * 66];
  H.w = C[3 * 66];
  C += 16;

  I.x = C[0 * 66];
  I.y = C[1 * 66];
  I.z = C[2 * 66];
  I.w = C[3 * 66];
  C += 16;

  J.x = C[0 * 66];
  J.y = C[1 * 66];
  J.z = C[2 * 66];
  J.w = C[3 * 66];
  C += 16;

  K.x = C[0 * 66];
  K.y = C[1 * 66];
  K.z = C[2 * 66];
  K.w = C[3 * 66];

  do {
    float4 L = D + F;
    float4 M = E + G;
    float4 N = L + M;
    float4 O = D - F;
    float4 P = L - M;
    float4 Q = E - G;
    float4 R = H + J;
    float4 S = I + K;
    float4 T = R + S;
    float4 U = H - J;
    float4 V = R - S;
    float4 W = I - K;
    D = N;
    H = T;
    E = O + W;
    I = U - Q;
    G = O - W;
    K = Q + U;
    F = P;
    J = V;
  } while (0);

  int X = (int)((A >> 4) << 6);
  do {
    float Y;
    float Z = fn_A(X * 1, &Y);
    do {
      float4 AA = Y * E - Z * I;
      I = Y * I + Z * E;
      E = AA;
    } while (0);
    float AB;
    float AC = fn_A(X * 2, &AB);
    do {
      float4 AA = AB * F - AC * J;
      J = AB * J + AC * F;
      F = AA;
    } while (0);
    float AD;
    float AE = fn_A(X * 3, &AD);
    do {
      float4 AA = AD * G - AE * K;
      K = AD * K + AE * G;
      G = AA;
    } while (0);
  } while (0);

  barrier(1);

  C = B + A;

  C[0 * 68] = D.x;
  C[1 * 68] = D.y;
  C[2 * 68] = D.z;
  C[3 * 68] = D.w;
  C += 68 * 4;

  C[0 * 68] = E.x;
  C[1 * 68] = E.y;
  C[2 * 68] = E.z;
  C[3 * 68] = E.w;
  C += 68 * 4;

  C[0 * 68] = F.x;
  C[1 * 68] = F.y;
  C[2 * 68] = F.z;
  C[3 * 68] = F.w;
  C += 68 * 4;

  C[0 * 68] = G.x;
  C[1 * 68] = G.y;
  C[2 * 68] = G.z;
  C[3 * 68] = G.w;
  C += 68 * 4;

  C[0 * 68] = H.x;
  C[1 * 68] = H.y;
  C[2 * 68] = H.z;
  C[3 * 68] = H.w;
  C += 68 * 4;

  C[0 * 68] = I.x;
  C[1 * 68] = I.y;
  C[2 * 68] = I.z;
  C[3 * 68] = I.w;
  C += 68 * 4;

  C[0 * 68] = J.x;
  C[1 * 68] = J.y;
  C[2 * 68] = J.z;
  C[3 * 68] = J.w;
  C += 68 * 4;

  C[0 * 68] = K.x;
  C[1 * 68] = K.y;
  C[2 * 68] = K.z;
  C[3 * 68] = K.w;

  barrier(1);
}

__attribute__((always_inline)) void fn_G(uint A, const __local float* B, __global float* C, __global float* D) {
  const __local float* E;

  E = B + ((A & 0xf) + (A >> 4) * (68 * 4));

  float4 F, G, H, I;

  F.x = E[0 * 68];
  F.y = E[1 * 68];
  F.z = E[2 * 68];
  F.w = E[3 * 68];
  E += 16;

  G.x = E[0 * 68];
  G.y = E[1 * 68];
  G.z = E[2 * 68];
  G.w = E[3 * 68];
  E += 16;

  H.x = E[0 * 68];
  H.y = E[1 * 68];
  H.z = E[2 * 68];
  H.w = E[3 * 68];
  E += 16;

  I.x = E[0 * 68];
  I.y = E[1 * 68];
  I.z = E[2 * 68];
  I.w = E[3 * 68];

  E += 68 * 4 * 4 - 3 * 16;

  float4 J, K, L, M;

  J.x = E[0 * 68];
  J.y = E[1 * 68];
  J.z = E[2 * 68];
  J.w = E[3 * 68];
  E += 16;

  K.x = E[0 * 68];
  K.y = E[1 * 68];
  K.z = E[2 * 68];
  K.w = E[3 * 68];
  E += 16;

  L.x = E[0 * 68];
  L.y = E[1 * 68];
  L.z = E[2 * 68];
  L.w = E[3 * 68];
  E += 16;

  M.x = E[0 * 68];
  M.y = E[1 * 68];
  M.z = E[2 * 68];
  M.w = E[3 * 68];

  do {
    float4 N = F + H;
    float4 O = G + I;
    float4 P = N + O;
    float4 Q = F - H;
    float4 R = N - O;
    float4 S = G - I;
    float4 T = J + L;
    float4 U = K + M;
    float4 V = T + U;
    float4 W = J - L;
    float4 X = T - U;
    float4 Y = K - M;
    F = P;
    J = V;
    G = Q + Y;
    K = W - S;
    I = Q - Y;
    M = S + W;
    H = R;
    L = X;
  } while (0);

  __global float4* Z = (__global float4*)(C + (A << 2));
  Z[0 * 64] = F;
  Z[1 * 64] = G;
  Z[2 * 64] = H;
  Z[3 * 64] = I;

  Z = (__global float4*)(D + (A << 2));
  Z[0 * 64] = J;
  Z[1 * 64] = K;
  Z[2 * 64] = L;
  Z[3 * 64] = M;
}
__kernel void fn_H(__global float* A, __global float* B) {
  __local float C[68 * 4 * 4 * 2];

  __global float* D;
  __global float* E;
  uint F = get_global_id(0);
  uint G = F & 0x3fU;
  uint H = (F >> 6) * (1024 + 0);

  D = A + H;
  E = B + H;

  fn_C(G, D, E, C);
  fn_D(G, C);
  fn_E(G, C);
  fn_F(G, C);
  fn_G(G, C, D, E);
}