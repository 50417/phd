__kernel void fn_A(__global int* A, const int B, const int C, const int D) {
  int E = get_global_id(0);

  int F = E / D;
  int G = E - (F * C);

  if (F >= D || G >= C)
    return;
  else {
    int H = 0;
    float I = 0.f;
    float J = 0.f;

    float K = 0.f;
    float L = 0.f;
    float M = 4.f * G / C - 2.f;
    float N = 4.f * F / D - 2.f;

    float O = I * I + J * J;

    while (H < B && O <= 4.f) {
      H++;
      K = I * I - J * J + M;
      L = 2.f * I * J + N;
      I = K;
      J = L;
      O = I * I + J * J;
    }

    A[F * D + G] = H;
  }
}

__kernel void fn_B(__global int* A, const int B, const int C, const int D) {
  int E = get_global_id(0);
  int F = E / D;
  int G = E - (F * C);
  if (F >= D || G >= C)
    return;

  int H = A[E];
  int I = 0;
  int J = 0;
  int K = 0;
  int L = 0;
  int M = 0;
  int N = 0;
  int O = 0;
  int P = 0;
  if (G > 0)
    P = A[E - 1];
  if (G < C - 1)
    O = A[E + 1];
  if (F > 0)
    I = A[E - C];
  if (F < D - 1)
    L = A[E + C];

  if ((F < D - 1) && (G < C - 1))
    M = A[E + C + 1];
  if ((F < D - 1) && (G > 0))
    N = A[E + C - 1];
  if ((F > 0) && (G > 0))
    K = A[E - C - 1];
  if ((F > 0) && (G < C - 1))
    J = A[E - C + 1];
  int Q = I + L + O + P + J + K + M + N;

  if ((H == 1) && ((Q < 2) || (Q > 3)))
    A[E] = 0;
  else if ((H == 0) && ((Q == 3)))
    A[E] = 1;
}