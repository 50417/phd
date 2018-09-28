inline int fn_A(const int A) {
  int B = A - 4;
  int C = min(B, 8 - B);
  return clamp(C, -3, 3);
}

inline int fn_B(const int A) {
  return fn_A((A + 4) & 15);
}

inline int fn_C(const int A, const int B) {
  return B * 640 + A;
}

inline int fn_D(const int A, const int B, const int C) {
  return (A >= B + C);
}

inline int fn_E(const int A, const int B, const int C) {
  return (A <= B - C);
}

inline int fn_F(__local int* A, const int B, const int C, const int D, const int E) {
  return -fn_E(A[fn_C(D, E)], B, C) | fn_D(A[fn_C(D, E)], B, C);
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_G(__global int* A, const int B, const int C, __global int* D, const int E, const unsigned F) {
  __local int G[((17 + 3 * 2) * 640)];
  __local int H[((16 + 3 * 2) * 640)];

  for (int I = 3; I < C - 3; I += 17) {
    size_t J = ((I - 3) * 640);
    size_t K = ((I - 3 + 17 + 3 * 2) > C) ? (C - I + 3) * 640 : (17 + 3 * 2) * 640;
    event_t L;
    L = async_work_group_copy(G, A + J, K, 0);
    wait_group_events(1, &L);

    for (int M = 0; M < ((16 + 3 * 2) * 640); M++) {
      H[M] = 0;
    }

    for (int N = 0; N < 17; N++) {
      for (int M = 3; M < B - 3; M++) {
        int O = M;
        int P = I + N;
        int Q = O;
        int R = N + 3;

        int S = G[fn_C(Q, R)];

        int T = fn_F(G, S, E, Q - 3, R + 0) | fn_F(G, S, E, Q + 3, R + 0);
        if (T == 0)
          continue;

        T &= fn_F(G, S, E, Q - 2, R + 2) | fn_F(G, S, E, Q + 2, R - 2);
        T &= fn_F(G, S, E, Q + 0, R + 3) | fn_F(G, S, E, Q + 0, R - 3);
        T &= fn_F(G, S, E, Q + 2, R + 2) | fn_F(G, S, E, Q - 2, R - 2);
        if (T == 0)
          continue;

        T &= fn_F(G, S, E, Q - 3, R + 1) | fn_F(G, S, E, Q + 3, R - 1);
        T &= fn_F(G, S, E, Q - 1, R + 3) | fn_F(G, S, E, Q + 1, R - 3);
        T &= fn_F(G, S, E, Q + 1, R + 3) | fn_F(G, S, E, Q - 1, R - 3);
        T &= fn_F(G, S, E, Q + 3, R + 1) | fn_F(G, S, E, Q - 3, R - 1);
        if (T == 0)
          continue;

        int U = 0;

        for (int I = 0; I < 9; I++)
          U += fn_F(G, S, E, Q + fn_B(I), R + fn_A(I));

        int V = 0, W = 0;
        V = max(V, U);
        W = min(W, U);

        for (int I = 9; I < 16; I++) {
          U -= fn_F(G, S, E, Q + fn_B(I - 9), R + fn_A(I - 9));
          U += fn_F(G, S, E, Q + fn_B(I), R + fn_A(I));
          V = max(V, U);
          W = min(W, U);
        }

        for (int I = 0; I < 9 - 1; I++) {
          U -= fn_F(G, S, E, Q + fn_B(16 - 9 + I), R + fn_A(16 - 9 + I));
          U += fn_F(G, S, E, Q + fn_B(I), R + fn_A(I));
          V = max(V, U);
          W = min(W, U);
        }

        if (V == 9 || W == -9) {
          int X = 0, Y = 0;

          for (int I = 0; I < 16; I++) {
            int Z = G[Q + fn_C(fn_B(I), R + fn_A(I))];
            int AA = abs((int)Z - (int)S) - E;
            X += fn_D(Z, S, E) * AA;
            Y += fn_E(Z, S, E) * AA;
          }

          H[fn_C(Q, R)] = (X < Y) ? (Y) : (X);
        }
      }
    }

    for (int N = 0; N < 16; N++) {
      for (int M = 3; M < B - 3; M++) {
        int O = M;
        int P = I + N;
        int Q = O;
        int R = N + 3;

        int AB = H[fn_C(Q, R)];

        if (AB != 0) {
          int AC = H[fn_C(Q - 1, R - 1)];
          AC = (AC < H[fn_C(Q - 1, R)]) ? (H[fn_C(Q - 1, R)]) : (AC);
          AC = (AC < H[fn_C(Q - 1, R + 1)]) ? (H[fn_C(Q - 1, R + 1)]) : (AC);
          AC = (AC < H[fn_C(Q, R - 1)]) ? (H[fn_C(Q, R - 1)]) : (AC);
          AC = (AC < H[fn_C(Q, R + 1)]) ? (H[fn_C(Q, R + 1)]) : (AC);
          AC = (AC < H[fn_C(Q + 1, R + 1)]) ? (H[fn_C(Q + 1, R + 1)]) : (AC);
          AC = (AC < H[fn_C(Q + 1, R)]) ? (H[fn_C(Q + 1, R)]) : (AC);
          AC = (AC < H[fn_C(Q + 1, R - 1)]) ? (H[fn_C(Q + 1, R - 1)]) : (AC);
          if (AB > AC)
            D[fn_C(O, P)] = AB;
        }
      }
    }
  }
}