__kernel void fn_A(__global float* A, __global float* B, __global float* C, __global float* D, __global float* E, __local float* F, int G, int H, int I) {
  int J = get_local_id(0);
  int K = get_group_id(0);

  int L = 1;

  __local float* M = F;
  __local float* N = &M[G + 1];
  __local float* O = &N[G + 1];
  __local float* P = &O[G + 1];
  __local float* Q = &P[G + 1];

  M[J] = A[J + K * G];
  N[J] = B[J + K * G];
  O[J] = C[J + K * G];
  P[J] = D[J + K * G];

  float R, S, T, U;

  barrier(1);

  for (int V = 0; V < I; V++) {
    int W = J;

    if (W < L) {
      float X = ((O[W]) / (N[W + L]));

      S = N[W] - M[W + L] * X;
      U = P[W] - P[W + L] * X;
      R = 0;
      T = -O[W + L] * X;
    } else if ((G - W - 1) < L) {
      float Y = ((M[W]) / (N[W - L]));

      S = N[W] - O[W - L] * Y;
      U = P[W] - P[W - L] * Y;
      R = -M[W - L] * Y;
      T = 0;
    } else {
      float Z = ((M[W]) / (N[W - L]));
      float X = ((O[W]) / (N[W + L]));

      S = N[W] - O[W - L] * Z - M[W + L] * X;
      U = P[W] - P[W - L] * Z - P[W + L] * X;
      R = -M[W - L] * Z;
      T = -O[W + L] * X;
    }

    barrier(1);

    N[W] = S;
    P[W] = U;
    M[W] = R;
    O[W] = T;

    L *= 2;
    barrier(1);
  }

  if (J < L) {
    int AA = J;
    int AB = J + L;
    float AC = N[AB] * N[AA] - O[AA] * M[AB];

    Q[AA] = (((N[AB] * P[AA] - O[AA] * P[AB])) / (AC));
    Q[AB] = (((P[AB] * N[AA] - P[AA] * M[AB])) / (AC));
  }

  barrier(1);

  E[J + K * G] = Q[J];
}

__kernel void fn_B(__global float* A, __global float* B, __global float* C, __global float* D, __global float* E, __local float* F, int G, int H, int I) {
  int J = get_local_id(0);
  int K = get_group_id(0);

  int L = 1;

  __local float* M = F;
  __local float* N = &M[G + 1];
  __local float* O = &N[G + 1];
  __local float* P = &O[G + 1];
  __local float* Q = &P[G + 1];

  M[J] = A[J + K * G];
  N[J] = B[J + K * G];
  O[J] = C[J + K * G];
  P[J] = D[J + K * G];

  float R, S, T, U;

  barrier(1);

  for (int V = 0; V < I; V++) {
    int W = J;

    int X = W + L;
    X = X & (G - 1);

    int Y = W - L;
    Y = Y & (G - 1);

    float Z = ((M[W]) / (N[Y]));
    float AA = ((O[W]) / (N[X]));

    S = N[W] - O[Y] * Z - M[X] * AA;
    U = P[W] - P[Y] * Z - P[X] * AA;
    R = -M[Y] * Z;
    T = -O[X] * AA;

    barrier(1);

    N[W] = S;
    P[W] = U;
    M[W] = R;
    O[W] = T;

    L *= 2;
    barrier(1);
  }

  if (J < L) {
    int AB = J;
    int AC = J + L;
    float AD = N[AC] * N[AB] - O[AB] * M[AC];

    Q[AB] = (((N[AC] * P[AB] - O[AB] * P[AC])) / (AD));
    Q[AC] = (((P[AC] * N[AB] - P[AB] * M[AC])) / (AD));
  }

  barrier(1);

  E[J + K * G] = Q[J];
}