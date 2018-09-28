__kernel void fn_A(__global float* A, __global float* B, __global float* C, __global float* D, __global float* E, __local float* F, int G, int H, int I) {
  int J = get_local_id(0);
  int K = get_group_id(0);

  int L = 1;
  int M = G >> 1;
  int N = M;

  __local float* O = F;
  __local float* P = &O[G];
  __local float* Q = &P[G];
  __local float* R = &Q[G];
  __local float* S = &R[G];

  O[J] = A[J + K * G];
  O[J + N] = A[J + N + K * G];

  P[J] = B[J + K * G];
  P[J + N] = B[J + N + K * G];

  Q[J] = C[J + K * G];
  Q[J + N] = C[J + N + K * G];

  R[J] = D[J + K * G];
  R[J + N] = D[J + N + K * G];

  barrier(1);

  for (int T = 0; T < I; T++) {
    barrier(1);

    L <<= 1;
    int U = L >> 1;
    if (J < N) {
      int V = L * J + L - 1;

      if (V == G - 1) {
        float W = ((O[V]) / (P[V - U]));

        P[V] = P[V] - Q[V - U] * W;
        R[V] = R[V] - R[V - U] * W;
        O[V] = -O[V - U] * W;
        Q[V] = 0;
      } else {
        float X = ((O[V]) / (P[V - U]));
        float Y = ((Q[V]) / (P[V + U]));

        P[V] = P[V] - Q[V - U] * X - O[V + U] * Y;
        R[V] = R[V] - R[V - U] * X - R[V + U] * Y;
        O[V] = -O[V - U] * X;
        Q[V] = -Q[V + U] * Y;
      }
    }
    N >>= 1;
  }

  if (J < 2) {
    int Z = L - 1;
    int AA = (L << 1) - 1;
    float AB = P[AA] * P[Z] - Q[Z] * O[AA];

    S[Z] = (((P[AA] * R[Z] - Q[Z] * R[AA])) / (AB));
    S[AA] = (((R[AA] * P[Z] - R[Z] * O[AA])) / (AB));
  }

  N = 2;
  for (int T = 0; T < I; T++) {
    int U = L >> 1;
    barrier(1);
    if (J < N) {
      int V = L * J + (L >> 1) - 1;

      if (V == U - 1)
        S[V] = (((R[V] - Q[V] * S[V + U])) / (P[V]));
      else
        S[V] = (((R[V] - O[V] * S[V - U] - Q[V] * S[V + U])) / (P[V]));
    }
    L >>= 1;
    N <<= 1;
  }

  barrier(1);

  E[J + K * G] = S[J];
  E[J + M + K * G] = S[J + M];
}

__kernel void fn_B(__global float* A, __global float* B, __global float* C, __global float* D, __global float* E, __local float* F, int G, int H, int I) {
  int J = get_local_id(0);
  int K = get_group_id(0);

  int L = 1;
  int M = G >> 1;
  int N = M;

  __local float* O = F;
  __local float* P = &O[G];
  __local float* Q = &P[G];
  __local float* R = &Q[G];
  __local float* S = &R[G];

  O[J] = A[J + K * G];
  O[J + N] = A[J + N + K * G];

  P[J] = B[J + K * G];
  P[J + N] = B[J + N + K * G];

  Q[J] = C[J + K * G];
  Q[J + N] = C[J + N + K * G];

  R[J] = D[J + K * G];
  R[J + N] = D[J + N + K * G];

  barrier(1);

  for (int T = 0; T < I; T++) {
    barrier(1);

    L <<= 1;
    int U = L >> 1;
    if (J < N) {
      int V = L * J + L - 1;
      int W = V + U;
      W = W & (G - 1);

      float X = ((O[V]) / (P[V - U]));
      float Y = ((Q[V]) / (P[W]));

      P[V] = P[V] - Q[V - U] * X - O[W] * Y;
      R[V] = R[V] - R[V - U] * X - R[W] * Y;
      O[V] = -O[V - U] * X;
      Q[V] = -Q[W] * Y;
    }

    N >>= 1;
  }

  if (J < 2) {
    int Z = L - 1;
    int AA = (L << 1) - 1;
    float AB = P[AA] * P[Z] - Q[Z] * O[AA];

    S[Z] = (((P[AA] * R[Z] - Q[Z] * R[AA])) / (AB));
    S[AA] = (((R[AA] * P[Z] - R[Z] * O[AA])) / (AB));
  }

  N = 2;
  for (int T = 0; T < I; T++) {
    int U = L >> 1;
    barrier(1);
    if (J < N) {
      int V = L * J + (L >> 1) - 1;

      if (V == U - 1)
        S[V] = (((R[V] - Q[V] * S[V + U])) / (P[V]));
      else
        S[V] = (((R[V] - O[V] * S[V - U] - Q[V] * S[V + U])) / (P[V]));
    }
    L >>= 1;
    N <<= 1;
  }

  barrier(1);

  E[J + K * G] = S[J];
  E[J + M + K * G] = S[J + M];
}