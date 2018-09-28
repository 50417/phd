__kernel void fn_A(__global float* const A, __global const float* const B, __constant float* const C, const int D, const int E, const int F, const int G) {
  bool H = true;
  const int I = get_global_id(0);
  const int J = get_global_id(1);
  const int K = get_local_id(0);
  const int L = get_local_id(1);
  const int M = get_local_size(0);
  const int N = get_local_size(1);
  __local float O[8 + 2 * 8][8 + 2 * 8];

  const int P = D + 2 * 8;
  const int Q = P * (E + 2 * 8);

  int R = 0;
  int S = 0;

  R += 8 * P + 8 + G;

  R += J * P + I;

  float T[8];
  float U[8];
  float V;

  const int W = K + 8;
  const int X = L + 8;

  if (I >= D)
    H = false;
  if (J >= E)
    H = false;

  for (int Y = 8 - 2; Y >= 0; Y--) {
    U[Y] = B[R];
    R += Q;
  }

  V = B[R];
  S = R;
  R += Q;

  for (int Y = 0; Y < 8; Y++) {
    T[Y] = B[R];
    R += Q;
  }

  for (int Z = 0; Z < F; Z++) {
    for (int Y = 8 - 1; Y > 0; Y--)
      U[Y] = U[Y - 1];
    U[0] = V;
    V = T[0];
    for (int Y = 0; Y < 8 - 1; Y++)
      T[Y] = T[Y + 1];
    T[8 - 1] = B[R];

    R += Q;
    S += Q;
    barrier(1);
    if (L < 8) {
      O[L][W] = B[S - 8 * P];
      O[L + N + 8][W] = B[S + N * P];
    }

    if (K < 8) {
      O[X][K] = B[S - 8];
      O[X][K + M + 8] = B[S + M];
    }
    O[X][W] = V;
    barrier(1);

    float AA = C[0] * V;
    for (int Y = 1; Y <= 8; Y++) {
      AA += C[Y] * (T[Y - 1] + U[Y - 1] + O[X - Y][W] + O[X + Y][W] + O[X][W - Y] + O[X][W + Y]);
    }

    if (H)
      A[S] = AA;
  }
}