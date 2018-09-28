inline int fn_A(const float A, const float B, const int C) {
  return (int)((B * C) + A);
}

inline int fn_B(const float A, const float B, global int* C, const int D) {
  const float E = __clc_floor(A);
  const float F = A - E;

  const float G = __clc_floor(B);
  const float H = B - G;

  const float I = C[fn_A(E, G, D)] * (1 - F) * (1 - H) + C[fn_A(E + 1, G, D)] * F * (1 - H) + C[fn_A(E, G + 1, D)] * (1 - F) * H + C[fn_A(E + 1, G + 1, D)] * F * H;

  return I;
}

kernel void fn_C(global int* A, global int* B, global float* C, global float* D, global float* E, const int F, const int G, const int H, const int I) {
  const size_t J = get_global_id(0);
  if (J >= I) {
    return;
  }
  const size_t K = get_global_id(1);
  if (K >= G) {
    return;
  }

  const int L = H * H;
  const int M = L * 2;
  const int N = J * M;
  const int O = J * 2;
  const int P = J * G * 6 + K * 6;

  const int Q = (int)__clc_floor(C[O] - __clc_floor(H / 2.0f));
  const int R = (int)__clc_floor(C[O + 1] - __clc_floor(H / 2.0f));

  float S[-1 * -1 * 2];
  int T, U, V, W;
  float X, Y;
  float Z[-1 * -1];
  float AA[-1 * -1];
  float AB = 0;
  float AC = 0;
  for (int AD = 0; AD < L; AD++) {
    U = AD * 2;
    T = N + U;

    V = Q + AD % H;
    W = R + AD / H;

    X = V - C[O];
    Y = W - C[O + 1];

    S[U] = V + D[P] + D[P + 2] * X + D[P + 4] * Y;
    S[U + 1] = W + D[P + 1] + D[P + 3] * X + D[P + 5] * Y;

    AA[AD] = A[fn_A(V, W, F)];
    AB += AA[AD];

    Z[AD] = fn_B(S[U], S[U + 1], B, F);
    AC += Z[AD];
  }
  AB /= (float)L;
  AC /= (float)L;

  float AE = 0;
  float AF = 0;
  float AG;
  for (int AD = 0; AD < L; AD++) {
    U = AD * 2;
    T = N + U;

    AG = AA[AD] - AB;
    AE += AG * AG;

    AG = Z[AD] - AC;
    AF += AG * AG;
  }
  const float AH = sqrt(AE);
  const float AI = sqrt(AF);
  const float AJ = AH * AI;

  float AK = 0;
  for (int AD = 0; AD < L; AD++) {
    T = N + AD * 2;

    AG = (AA[AD] - AB) * (Z[AD] - AC);
    AG /= AJ;
    AK += AG;
  }

  T = J * G + K;
  E[T] = AK;
}