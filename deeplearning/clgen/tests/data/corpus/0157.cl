int fn_A(double A, int B, int C, int D, int E, double F) {
  double G = B, H = C, I = D, J = E;

  if (A > 1.0)
    return 0;
  double K = I * (H - F) + J * (F - G);
  int L = (int)K;
  return L;
}

double fn_B(double A, double B) {
  if (A <= B && A >= -B)
    return 0.42 + 0.5 * cos(3.14159265358979323846264338327950288f * A / B) + 0.08 * cos(2 * 3.14159265358979323846264338327950288f * A / B);
  else
    return 0;
}

double fn_C(double A, double B, double C) {
  if (C <= 1.0) {
    if (__clc_fabs(A) < (double)__clc_pow((double)10, (double)-30))
      return 1.0;
    double D = sin(B * A * 3.14159265358979323846264338327950288f);
    double E = (3.14159265358979323846264338327950288f * B * A);
    if (D / E > 1.0)
      return 1.0;
    return D / E;
  } else {
    double F = 1.0 / C;
    if (__clc_fabs(A) < (double)__clc_pow((double)10, (double)-30))
      return F;
    double D = sin(B * A * 3.14159265358979323846264338327950288f * F);
    double E = (3.14159265358979323846264338327950288f * A * B);
    if (D / E > F)
      return F;
    else
      return D / E;
  }
}

inline double fn_D(double A, __global float* B, float C) {
  A = __clc_fabs(A);
  A *= 512;
  int D = (int)(A);
  if (D >= 65537 || D + 1 >= 65537)
    return 0.0;
  double E = (double)B[D];

  double F = (A - (double)D);
  double G = (double)B[D + 1] - E;
  double H = E + F * G;
  double I = (double)(1.0 / C);
  H = (C < 1.0 && H > I) ? I : H;
  return H;
}

__kernel void fn_E(__global float* A, int B, __global float* C, int D, int E, int F, int G, int H, int I, int J, __global float* K) {
  __global float* L = (__global float*)K;
  int M = get_global_id(0);
  if (M > D)
    return;
  double N = (double)H / (double)I;
  double O = (double)(F + M) * N;
  double P = O;
  int Q = (int)O;
  int R = Q + 1;

  int S = Q - E;
  int T = R - E;
  if (S > 2048 - J) {
    return;
  }

  {
    double U = 0;

    for (int V = 0; V < J; V++) {
      int W = T + V;
      float X = (W >= 0 && W <= 2048 - 1) ? A[W * G] : 0;
      int Y = R + V;
      int Z = Y;
      U += (double)((double)X * fn_D(P - (double)Z, L, N));
    }
    for (int V = 0; V < J; V++) {
      int W = S - V;
      float X = (W >= 0 && W <= 2048 - 1) ? A[W * G] : 0;
      int Y = Q - V;
      int Z = Y;
      U += (double)((double)X * fn_D(P - (double)Z, L, N));
    }
    C[M * G] = (float)U;
  }
  {
    double U = 0;

    for (int V = 0; V < J; V++) {
      int W = T + V;
      float X = (W >= 0 && W <= 2048 - 1) ? A[W * G + 1] : 0;
      int Y = R + V;
      int Z = Y;
      U += (double)((double)X * fn_D(P - (double)Z, L, N));
    }
    for (int V = 0; V < J; V++) {
      int W = S - V;
      float X = (W >= 0 && W <= 2048 - 1) ? A[W * G + 1] : 0;
      int Y = Q - V;
      int Z = Y;
      U += (double)((double)X * fn_D(P - (double)Z, L, N));
    }
    C[M * G + 1] = (float)U;
  }

  return;
}