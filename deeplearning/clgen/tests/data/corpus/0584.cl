void kernel fn_A(global unsigned int* A, global unsigned int* B, local unsigned int* C, unsigned int D, global unsigned int* E) {
  int F = get_global_size(0);
  int G = get_local_size(0);
  int H = get_group_id(0);

  int I = H * G * 2;

  if (H == get_num_groups(0) - 1) {
    int J = get_global_id(0);
    int K = get_local_id(0);

    A += I;
    E += I;

    int L = K;
    int M = K + G;
    int N = (((L) >> 5) + ((L) >> (2 * 5)));
    int O = (((M) >> 5) + ((M) >> (2 * 5)));

    if (I + L < D)
      C[L + N] = A[L];
    else
      C[L + N] = 0;

    if (I + M < D)
      C[M + O] = A[M];
    else
      C[M + O] = 0;

    int P = 1;

    for (int Q = G; Q > 0; Q >>= 1) {
      barrier(1);

      if (K < Q) {
        int L = P * (2 * K + 1) - 1;
        int M = L + P;
        L += (((L) >> 5) + ((L) >> (2 * 5)));
        M += (((M) >> 5) + ((M) >> (2 * 5)));
        C[M] += C[L];
      }
      P <<= 1;
    }
    barrier(1);

    if (K == 0) {
      int R = G * 2 - 1 + (((G * 2 - 1) >> 5) + ((G * 2 - 1) >> (2 * 5)));
      B[H] = C[R];
      C[R] = 0;
    }

    for (int Q = 1; Q < G << 1; Q <<= 1) {
      P >>= 1;
      barrier(1);
      if (K < Q) {
        int L = P * (2 * K + 1) - 1;
        int M = L + P;
        L += (((L) >> 5) + ((L) >> (2 * 5)));
        M += (((M) >> 5) + ((M) >> (2 * 5)));
        int S = C[L];
        C[L] = C[M];
        C[M] += S;
      }
    }
    barrier(1);

    if (I + L <= D)
      E[L] = C[L + N];

    if (I + M <= D)
      E[M] = C[M + O];

  } else {
    int J = get_global_id(0);
    int K = get_local_id(0);

    A += I;
    E += I;

    int L = K;
    int M = K + G;
    int N = (((L) >> 5) + ((L) >> (2 * 5)));
    int O = (((M) >> 5) + ((M) >> (2 * 5)));

    C[L + N] = A[L];
    C[M + O] = A[M];

    int P = 1;

    for (int Q = G; Q > 0; Q >>= 1) {
      barrier(1);

      if (K < Q) {
        int L = P * (2 * K + 1) - 1;
        int M = L + P;
        L += (((L) >> 5) + ((L) >> (2 * 5)));
        M += (((M) >> 5) + ((M) >> (2 * 5)));
        C[M] += C[L];
      }
      P <<= 1;
    }
    barrier(1);

    if (K == 0) {
      int R = G * 2 - 1 + (((G * 2 - 1) >> 5) + ((G * 2 - 1) >> (2 * 5)));
      B[H] = C[R];
      C[R] = 0;
    }

    for (int Q = 1; Q < G << 1; Q <<= 1) {
      P >>= 1;
      barrier(1);
      if (K < Q) {
        int L = P * (2 * K + 1) - 1;
        int M = L + P;
        L += (((L) >> 5) + ((L) >> (2 * 5)));
        M += (((M) >> 5) + ((M) >> (2 * 5)));
        int S = C[L];
        C[L] = C[M];
        C[M] += S;
      }
    }
    barrier(1);

    E[L] = C[L + N];
    E[M] = C[M + O];
  }
}

void kernel fn_B(global unsigned int* A, global unsigned int* B, unsigned int C)

{
  size_t D = get_global_id(0);
  size_t E = get_local_id(0);

  local unsigned int F;
  if (E == 0) {
    if (D >= C)
      F = B[D / C];
    else
      F = 0;
  }
  barrier(1);

  A[D] += F;
}