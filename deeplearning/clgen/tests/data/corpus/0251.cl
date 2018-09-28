inline const int fn_A(const int A, const int B, const int C) {
  return A + B - C;
}

inline const int fn_B(const int A, const int B) {
  return B - A - 1;
}

__kernel void fn_C(__global float* A, __global float* B, const int C, const int D, const int E) {
  const int F = (E - 1) / 2;

  const int G = get_global_id(1);
  const int H = get_global_id(0);

  const int I = G;
  const int J = H + F;

  const int K = D + 2 * F;
  const int L = C + F;

  if (G < C && H < D) {
    for (int M = 0; M < F * E + F; M++) {
      const int N = M * C * D + G * D + H;
      B[N] = A[M * L * K + I * K + J];
    }

    for (int O = F; O < E; O++) {
      int P = 0;
      if (O == F) {
        P = F + 1;
      }
      for (int Q = P; Q < E; Q++) {
        const int N = (O * E + Q) * C * D + G * D + H;

        const int R = fn_A(G, O, F);
        const int S = F + fn_A(H, Q, F);
        const int T = fn_B(O, E);
        const int U = fn_B(Q, E);
        const int V = T * E * L * K + U * L * K + R * K + S;

        B[N] = A[V];
      }
    }
  }
}