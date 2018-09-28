__kernel void fn_A(__global double* A, __global double* B, __global double* C) {
  int D = get_local_id(0);
  int E = get_local_id(1);
  int F = get_global_size(0);
  int G = get_global_id(0);
  int H = get_global_id(1);

  int I = E * 16 + D;
  int J = H * F + G;

  __local double K[16 * 16];
  __local double L[16 * 16];

  double M[8];
  double N = 0.0;

  for (int O = 0; O < F / 16; O++) {
    K[I] = A[O * 16 + H * F + D];
    L[I] = B[O * 16 + G * F + E];

    barrier(1);

    M[0] = K[0 + E * 16] * L[0 + D * 16] + K[8 + E * 16] * L[8 + D * 16];
    M[1] = K[1 + E * 16] * L[1 + D * 16] + K[9 + E * 16] * L[9 + D * 16];
    M[2] = K[2 + E * 16] * L[2 + D * 16] + K[10 + E * 16] * L[10 + D * 16];
    M[3] = K[3 + E * 16] * L[3 + D * 16] + K[11 + E * 16] * L[11 + D * 16];
    M[4] = K[4 + E * 16] * L[4 + D * 16] + K[12 + E * 16] * L[12 + D * 16];
    M[5] = K[5 + E * 16] * L[5 + D * 16] + K[13 + E * 16] * L[13 + D * 16];
    M[6] = K[6 + E * 16] * L[6 + D * 16] + K[14 + E * 16] * L[14 + D * 16];
    M[7] = K[7 + E * 16] * L[7 + D * 16] + K[15 + E * 16] * L[15 + D * 16];

    M[0] += M[4];
    M[1] += M[5];
    M[2] += M[6];
    M[3] += M[7];

    M[0] += M[2];
    M[1] += M[3];

    N += M[0] + M[1];

    barrier(1);
  }

  C[J] -= N;
}