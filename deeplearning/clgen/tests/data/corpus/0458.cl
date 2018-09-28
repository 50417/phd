__kernel void fn_A(const double A, const double B, const double C, const double D, const int E, const int F, __global double* G, __global double* H) {
  int I = get_global_id(0);
  int J = get_global_id(1);

  if (I < F && J < E) {
    H[J * E + I] = A * sin((I + .5) * B) * sin((J + .5) * C);
    G[J * E + I] = D * (cos(2. * (I)*B) + cos(2. * (J)*C)) + 50000.;
  }
}

__kernel void fn_B(const double A, const double B, const int C, const int D, __global const double* E, __global double* F, __global double* G) {
  int H = get_global_id(0);
  int I = get_global_id(1);

  if (H < D && I < C) {
    F[(I + 1) * C + H] = -(E[(I + 1) * C + H + 1] - E[(I + 1) * C + H]) / B;
    G[I * C + H + 1] = (E[(I + 1) * C + H + 1] - E[I * C + H + 1]) / A;
  }
}

__kernel void fn_C(const double A, const double B, const int C,

                   __global const double* D, __global const double* E, __global const double* F,

                   __global double* G, __global double* H, __global double* I, __global double* J) {
  int K = get_global_id(0);
  int L = get_global_id(1);

  G[(L + 1) * C + K] = 0.5 * (F[(L + 1) * C + K] + F[L * C + K]) * D[(L + 1) * C + K];
  H[L * C + K + 1] = 0.5 * (F[L * C + K + 1] + F[L * C + K]) * E[L * C + K + 1];
  I[(L + 1) * C + K + 1] = (A * (E[(L + 1) * C + K + 1] - E[L * C + K + 1]) - B * (D[(L + 1) * C + K + 1] - D[(L + 1) * C + K])) / (F[L * C + K] + F[(L + 1) * C + K] + F[(L + 1) * C + K + 1] + F[L * C + K + 1]);
  J[L * C + K] = F[L * C + K] + 0.25 * (D[(L + 1) * C + K] * D[(L + 1) * C + K] + D[L * C + K] * D[L * C + K] + E[L * C + K + 1] * E[L * C + K + 1] + E[L * C + K] * E[L * C + K]);
}

__kernel void fn_D(const int A, const int B, const int C, __global double* D, __global double* E, __global double* F, __global double* G) {
  int H = get_global_id(0);
  int I = get_global_id(1);

  if (H < B) {
    D[H] = D[A * C + H];
    E[A * C + H + 1] = E[H + 1];
    F[H + 1] = F[A * C + H + 1];
    G[A * C + H] = G[H];
  }

  if (I < A) {
    D[(I + 1) * C + B] = D[(I + 1) * C];
    E[I * C] = E[I * C + B];
    F[(I + 1) * C] = F[(I + 1) * C + B];
    G[I * C + B] = G[I * C];
  }

  D[B] = D[A * C];
  E[A * C] = E[B];
  F[0] = F[A * C + B];
  G[A * C + B] = G[0];
}

__kernel void fn_E(const double A, const double B, const double C, const int D, __global const double* E, __global const double* F, __global const double* G, __global const double* H, __global const double* I, __global const double* J, __global const double* K, __global double* L, __global double* M, __global double* N) {
  int O = get_global_id(0);
  int P = get_global_id(1);

  L[(P + 1) * D + O] = I[(P + 1) * D + O] + A * (G[(P + 1) * D + O + 1] + G[(P + 1) * D + O]) * (F[(P + 1) * D + O + 1] + F[P * D + O + 1] + F[P * D + O] + F[(P + 1) * D + O]) - B * (H[(P + 1) * D + O] - H[P * D + O]);

  M[P * D + O + 1] = J[P * D + O + 1] - A * (G[(P + 1) * D + O + 1] + G[P * D + O + 1]) * (E[(P + 1) * D + O + 1] + E[P * D + O + 1] + E[P * D + O] + E[P * D + O + 1]) - C * (H[P * D + O + 1] - H[P * D + O]);

  N[P * D + O] = K[P * D + O] - B * (E[(P + 1) * D + O] - E[P * D + O]) - C * (F[P * D + O + 1] - F[P * D + O]);
}

__kernel void fn_F(const int A, const int B, const int C, __global double* D, __global double* E, __global double* F) {
  int G = get_global_id(0);
  int H = get_global_id(1);

  if (G < B) {
    D[G] = D[A * C + G];
    E[A * C + G + 1] = E[G + 1];
    F[A * C + G] = F[G];
  }

  if (H < A) {
    D[(H + 1) * C + B] = D[(H + 1) * C];
    E[H * C] = E[H * C + B];
    F[H * C + B] = F[H * C];
  }

  D[B] = D[A * C];
  E[A * C] = E[B];
  F[A * C + B] = F[0];
}

__kernel void fn_G(const int A, const int B, const int C, const double D, __global double* E, __global double* F, __global double* G, __global double* H, __global double* I, __global double* J, __global double* K, __global double* L, __global double* M) {
  int N = get_global_id(0);
  int O = get_global_id(1);

  H[O * C + N] = E[O * C] + D * (K[O * C + N] - 2. * E[O * C + N] + H[O * C + N]);
  I[O * C + N] = F[O * C] + D * (L[O * C + N] - 2. * F[O * C + N] + I[O * C + N]);
  J[O * C + N] = G[O * C] + D * (M[O * C + N] - 2. * G[O * C + N] + J[O * C + N]);
}