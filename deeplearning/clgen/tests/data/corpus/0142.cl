void fn_A(double4 A, double4* B) {
  double4 C;
  double4 D;
  double4 E;
  double4 F;

  const double4 G = (double4)0.319381530;
  const double4 H = (double4)-0.356563782;
  const double4 I = (double4)1.781477937;
  const double4 J = (double4)-1.821255978;
  const double4 K = (double4)1.330274429;

  const double4 L = (double4)0.0;
  const double4 M = (double4)1.0;
  const double4 N = (double4)2.0;
  const double4 O = (double4)0.2316419;

  const double4 P = (double4)0.398942280;

  D = __clc_fabs(A);
  E = M / (M + O * D);

  C = M - P * exp(-A * A / N) * E * (G + E * (H + E * (I + E * (J + E * K))));

  F = (A < L) ? (M - C) : C;

  *B = F;
}
__kernel void fn_B(const __global double4* A, int B, __global double4* C, __global double4* D) {
  double4 E, F;
  double4 G, H;
  double4 I;
  double4 J;

  size_t K = get_global_id(0);
  size_t L = get_global_id(1);
  double4 M = (double4)2.0;
  double4 N = A[L * B + K];
  double4 O = 10.0 * N + 100.0 * (1.0 - N);
  double4 P = 10.0 * N + 100.0 * (1.0 - N);
  double4 Q = 1.0 * N + 10.0 * (1.0 - N);
  double4 R = 0.01 * N + 0.05 * (1.0 - N);
  double4 S = 0.01 * N + 0.10 * (1.0 - N);

  I = S * sqrt(Q);

  E = (log(O / P) + (R + S * S / M) * Q) / I;
  F = E - I;

  J = P * exp(-R * Q);
  fn_A(E, &G);
  fn_A(F, &H);
  C[L * B + K] = O * G - J * H;
  fn_A(-E, &G);
  fn_A(-F, &H);
  D[L * B + K] = J * H - O * G;
}