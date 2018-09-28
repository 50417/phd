__kernel void fn_A(global unsigned int* restrict A, global unsigned int* restrict B) {
  int C = get_global_id(0);
  int D = get_global_id(1);
  int E = get_global_size(0);
  int F = get_global_size(1);
  int G = C + D * E;
  long int H = E * F;

  int I[3][3] = {{-1, -2, -1}, {0, 0, 0}, {1, 2, 1}};
  int J[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};

  int K = 0, L = 0, M = 0;
  int N = 0, O = 0;

  if (G < H && (C > 1 && D > 1) && (C < (E - 1) && D < (F - 1))) {
    for (N = 0; N < 3; N++) {
      for (O = 0; O < 3; O++) {
        L += (J[N][O]) * A[(C + O - 1) + (E * (D + N - 1))];
        K += (I[N][O]) * A[(C + O - 1) + (E * (D + N - 1))];
      }
    }

    M = abs(K) + abs(L);

    if (M > 255)
      B[G] = 255;
    else
      B[G] = M;
  }
}

__kernel void fn_B(global unsigned int* restrict A, global unsigned int* restrict B, const unsigned int C) {
  int D = get_global_id(0);
  int E = get_global_id(1);
  int F = get_global_size(0);
  int G = get_global_size(1);
  int H = D + E * F;
  long int I = F * G;
  double J = 0.0174533;
  double K = F / 2;
  double L = G / 2;

  if (A[H] > 250) {
    for (int M = 0; M < 180; M++) {
      double N = (((double)D - K) * cos((double)M * J)) + (((double)E - L) * sin((double)M * J));
      B[(int)((__clc_round(N + C) * 180.0)) + M]++;
    }
  }
}