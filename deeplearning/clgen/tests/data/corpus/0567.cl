__kernel void fn_A(__global int* A, __global int* B, __global float* C, __global int* D, __global float* E, __global float* F, int G, int H) {
  int I = get_global_id(0);

  if (D[I] != 0) {
    D[I] = 0;

    int J = A[I];
    int K;
    if (I + 1 < (G)) {
      K = A[I + 1];
    } else {
      K = H;
    }

    for (int L = J; L < K; L++) {
      int M = B[L];

      if (F[M] > (E[I] + C[L])) {
        F[M] = (E[I] + C[L]);
      }
    }
  }
}

__kernel void fn_B(__global int* A, __global int* B, __global float* C, __global int* D, __global float* E, __global float* F, int G) {
  int H = get_global_id(0);

  if (E[H] > F[H]) {
    E[H] = F[H];
    D[H] = 1;
  }

  F[H] = E[H];
}