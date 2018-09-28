__kernel void fn_A(__global float* A, __global float* B, __constant float* C, int D, int E, int F, int G, int H, int I, int J, int K, float L) {
  int M = get_global_id(0);
  int N = get_global_id(1);

  __constant float* O = C;
  __constant float* P = C + 9;

  if (M < F && N < G) {
    int Q = mad24(N, H, J + M);
    int R = mad24(N, I, K + M);

    float S = D + M;
    float T = E + N;
    float U, V;

    float W = S / L - P[0];
    float X = T / L - P[1];

    float Y;
    U = O[0] * W + O[1] * X + O[2] * (1 - P[2]);
    V = O[3] * W + O[4] * X + O[5] * (1 - P[2]);
    Y = O[6] * W + O[7] * X + O[8] * (1 - P[2]);

    U /= Y;
    V /= Y;

    A[Q] = U;
    B[R] = V;
  }
}

__kernel void fn_B(__global float* A, __global float* B, __constant float* C, int D, int E, int F, int G, int H, int I, int J, int K, float L) {
  int M = get_global_id(0);
  int N = get_global_id(1);

  if (M < F && N < G) {
    int O = mad24(N, H, J + M);
    int P = mad24(N, I, K + M);

    float Q = D + M;
    float R = E + N;
    float S, T;

    Q /= L;
    float U = sin(Q);
    float V = R / L;
    float W = cos(Q);

    float X;
    S = C[0] * U + C[1] * V + C[2] * W;
    T = C[3] * U + C[4] * V + C[5] * W;
    X = C[6] * U + C[7] * V + C[8] * W;

    if (X > 0) {
      S /= X;
      T /= X;
    } else
      S = T = -1;

    A[O] = S;
    B[P] = T;
  }
}

__kernel void fn_C(__global float* A, __global float* B, __constant float* C, int D, int E, int F, int G, int H, int I, int J, int K, float L) {
  int M = get_global_id(0);
  int N = get_global_id(1);

  if (M < F && N < G) {
    int O = mad24(N, H, J + M);
    int P = mad24(N, I, K + M);

    float Q = D + M;
    float R = E + N;
    float S, T;

    R /= L;
    Q /= L;

    float U = sin(R);
    float V = U * sin(Q);
    float W = -cos(R);
    float X = U * cos(Q);

    float Y;
    S = C[0] * V + C[1] * W + C[2] * X;
    T = C[3] * V + C[4] * W + C[5] * X;
    Y = C[6] * V + C[7] * W + C[8] * X;

    if (Y > 0) {
      S /= Y;
      T /= Y;
    } else
      S = T = -1;

    A[O] = S;
    B[P] = T;
  }
}

__kernel void fn_D(__global float* A, __global float* B, __constant float* C, int D, int E, int F, int G, int H, int I) {
  int J = get_global_id(0);
  int K = get_global_id(1);

  if (J < D && K < E) {
    int L = mad24(K, F, J + H);
    int M = mad24(K, G, J + I);

    float N = C[0] * J + C[1] * K + C[2];
    float O = C[3] * J + C[4] * K + C[5];

    A[L] = N;
    B[M] = O;
  }
}

__kernel void fn_E(__global float* A, __global float* B, __constant float* C, int D, int E, int F, int G, int H, int I) {
  int J = get_global_id(0);
  int K = get_global_id(1);

  if (J < D && K < E) {
    int L = mad24(K, F, J + H);
    int M = mad24(K, G, J + I);

    float N = 1.0f / (C[6] * J + C[7] * K + C[8]);
    float O = N * (C[0] * J + C[1] * K + C[2]);
    float P = N * (C[3] * J + C[4] * K + C[5]);

    A[L] = O;
    B[M] = P;
  }
}