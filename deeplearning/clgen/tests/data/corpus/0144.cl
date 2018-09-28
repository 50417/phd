__kernel void fn_A(__global float* A, __global float* B) {
  int C = get_global_id(0);
  int D = get_group_id(0);
  int E = get_local_id(0);

  __local float F[1];

  if (E == 0) {
    F[0] = A[D];
  }
  barrier(1);

  B[C] += F[0];
}

__kernel void fn_B(__global float* A, __global float* B, __local float* C, const uint D) {
  int E = get_local_id(0);

  int F = 1;

  C[2 * E] = B[2 * E];
  C[2 * E + 1] = B[2 * E + 1];

  for (int G = D >> 1; G > 0; G >>= 1) {
    barrier(1);

    if (E < G) {
      int H = F * (2 * E + 1) - 1;
      int I = F * (2 * E + 2) - 1;

      C[I] += C[H];
    }
    F *= 2;
  }

  if (E == 0) {
    C[D - 1] = 0;
  }

  for (int G = 1; G < D; G *= 2) {
    F >>= 1;
    barrier(1);

    if (E < G) {
      int H = F * (2 * E + 1) - 1;
      int I = F * (2 * E + 2) - 1;

      float J = C[H];
      C[H] = C[I];
      C[I] += J;
    }
  }

  barrier(1);

  A[2 * E] = C[2 * E];
  A[2 * E + 1] = C[2 * E + 1];
}

__kernel void fn_C(__global float* A, __global float* B, __local float* C, const uint D, const uint E, __global float* F)

{
  int G = get_local_id(0);
  int H = get_global_id(0);
  int I = get_group_id(0);

  int J = 1;

  C[2 * G] = B[2 * H];
  C[2 * G + 1] = B[2 * H + 1];

  for (int K = D >> 1; K > 0; K >>= 1) {
    barrier(1);

    if (G < K) {
      int L = J * (2 * G + 1) - 1;
      int M = J * (2 * G + 2) - 1;

      C[M] += C[L];
    }
    J *= 2;
  }

  barrier(1);

  int N = get_group_id(0);

  F[I] = C[D - 1];

  barrier(1 | 2);

  C[D - 1] = 0;

  for (int K = 1; K < D; K *= 2) {
    J >>= 1;
    barrier(1);

    if (G < K) {
      int L = J * (2 * G + 1) - 1;
      int M = J * (2 * G + 2) - 1;

      float O = C[L];
      C[L] = C[M];
      C[M] += O;
    }
  }

  barrier(1);

  if (N == 0) {
    A[2 * H] = C[2 * G];
    A[2 * H + 1] = C[2 * G + 1];
  } else {
    A[2 * H] = C[2 * G];
    A[2 * H + 1] = C[2 * G + 1];
  }
}