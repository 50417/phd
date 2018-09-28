typedef struct {
  float weight;

  long assign;
  float cost;
} Point_Struct;

__kernel void fn_A(__global char* A, short B, int C) {
  const int D = get_global_id(0);
  A[D] = B;
}

__kernel void fn_B(__global Point_Struct* A, __global float* B, __global float* C, __global int* D, __global char* E, __local float* F, int G, int H, long I, int J) {
  const int K = get_global_id(0);
  const int L = get_local_id(0);

  if (K < G) {
    if (L == 0)
      for (int M = 0; M < H; M++) {
        F[M] = B[M * G + I];
      }
    barrier(1);

    float N = 0.0;
    for (int M = 0; M < H; M++)
      N += (B[(M * G) + K] - F[M]) * (B[(M * G) + K] - F[M]);
    N = N * A[K].weight;

    float O = A[K].cost;

    int P = K * (J + 1);

    if (N < O) {
      E[K] = '1';
      int Q = P + J;
      C[Q] = N - O;
    }

    else {
      int R = A[K].assign;
      int S = P + D[R];
      C[S] += O - N;
    }
  }
}