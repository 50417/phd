int fn_A(int A, int B, int C) {
  int D;
  if (A <= B)
    D = B;
  else
    D = A;

  if (D <= C)
    return (C);
  else
    return (D);
}

__kernel void fn_B(__global int* A, __global int* B, __global int* C, __local int* D, __local int* E, int F, int G, int H, int I, int J, int K, int L) {
  int M = get_group_id(0);

  int N = get_local_id(0);

  int O = K * F + L;

  int P = M;
  int Q = H - 1 - M;

  int R = O + F * 64 * Q + 64 * P + N + (F + 1);
  int S = O + F * 64 * Q + 64 * P + N + (1);
  int T = O + F * 64 * Q + 64 * P + (F);
  int U = O + F * 64 * Q + 64 * P;

  if (N == 0) {
    D[0 + N * (64 + 1)] = B[U + N];
  }

  barrier(1);

  for (int V = 0; V < 64; V++)
    E[N + V * 64] = A[R + F * V];

  barrier(1);

  D[0 + (N + 1) * (64 + 1)] = B[T + F * N];

  barrier(1);

  D[(N + 1) + 0 * (64 + 1)] = B[S];

  barrier(1);

  for (int W = 0; W < 64; W++) {
    if (N <= W) {
      int X = N + 1;
      int Y = W - N + 1;

      D[X + Y * (64 + 1)] = fn_A(D[(X - 1) + (Y - 1) * (64 + 1)] + E[(X - 1) + (Y - 1) * 64], D[(X - 1) + (Y) * (64 + 1)] - (G), D[(X) + (Y - 1) * (64 + 1)] - (G));
    }
    barrier(1);
  }

  barrier(1);

  for (int W = 64 - 2; W >= 0; W--) {
    if (N <= W) {
      int X = N + 64 - W;
      int Y = 64 - N;

      D[X + Y * (64 + 1)] = fn_A(D[(X - 1) + (Y - 1) * (64 + 1)] + E[(X - 1) + (Y - 1) * 64], D[(X - 1) + (Y) * (64 + 1)] - (G), D[(X) + (Y - 1) * (64 + 1)] - (G));
    }

    barrier(1);
  }

  for (int V = 0; V < 64; V++)
    B[R + F * V] = D[(N + 1) + (V + 1) * (64 + 1)];

  return;
}

__kernel void fn_C(__global int* A, __global int* B, __global int* C, __local int* D, __local int* E, int F, int G, int H, int I, int J, int K, int L) {
  int M = get_group_id(0);

  int N = get_local_id(0);

  int O = K * F + L;

  int P = M + I - H;
  int Q = I - M - 1;

  int R = O + F * 64 * Q + 64 * P + N + (F + 1);
  int S = O + F * 64 * Q + 64 * P + N + (1);
  int T = O + F * 64 * Q + 64 * P + (F);
  int U = O + F * 64 * Q + 64 * P;

  if (N == 0)
    D[0 + N * (64 + 1)] = B[U];

  for (int V = 0; V < 64; V++)
    E[N + V * 64] = A[R + F * V];

  barrier(1);

  D[0 + (N + 1) * (64 + 1)] = B[T + F * N];

  barrier(1);

  D[(N + 1) + 0 * (64 + 1)] = B[S];

  barrier(1);

  for (int W = 0; W < 64; W++) {
    if (N <= W) {
      int X = N + 1;
      int Y = W - N + 1;

      D[X + Y * (64 + 1)] = fn_A(D[(X - 1) + (Y - 1) * (64 + 1)] + E[(X - 1) + (Y - 1) * 64], D[(X - 1) + (Y) * (64 + 1)] - (G), D[(X) + (Y - 1) * (64 + 1)] - (G));
    }
    barrier(1);
  }

  for (int W = 64 - 2; W >= 0; W--) {
    if (N <= W) {
      int X = N + 64 - W;
      int Y = 64 - N;

      D[X + Y * (64 + 1)] = fn_A(D[(X - 1) + (Y - 1) * (64 + 1)] + E[(X - 1) + (Y - 1) * 64], D[(X - 1) + (Y) * (64 + 1)] - (G), D[(X) + (Y - 1) * (64 + 1)] - (G));
    }

    barrier(1);
  }

  for (int V = 0; V < 64; V++)
    B[R + V * F] = D[(N + 1) + (V + 1) * (64 + 1)];

  return;
}