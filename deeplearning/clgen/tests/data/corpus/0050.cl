__kernel void fn_A(__global float* A, __global float* B, __global float* C) {
  int D = get_local_id(1);
  int E = get_local_id(0);
  int F = get_group_id(1) * 16 * 1;
  int G = get_group_id(0) * 16 * 1;

  __local float H[16 * 1 + ((17 / 2) * 2)][(16 * 1 + ((17 / 2) * 2) + ((32 - (((17 / 2) * 2) + 16 * 1 - 16)) & 31))];

  for (int I = D; I < min(16 * 1 + ((17 / 2) * 2), (4096 + ((17 / 2) * 2))); I += 16) {
    for (int J = E; J < min(16 * 1 + ((17 / 2) * 2), (4096 + ((17 / 2) * 2))); J += 16) {
      H[I][J] = B[(F + I) * (4096 + ((17 / 2) * 2)) + (G + J)];
    }
  }
  barrier(1);

  float K[1][1];
  for (int L = 0; L < 1; L++) {
    for (int M = 0; M < 1; M++) {
      K[L][M] = 0.0f;
    }
  }

  for (int I = 0; I < 17; I++) {
    for (int J = 0; J < 17; J++) {
      for (int L = 0; L < 1; L++) {
        for (int M = 0; M < 1; M++) {
          K[L][M] += H[D + L * 16 + I][E + M * 16 + J] * C[I * 17 + J];
        }
      }
    }
  }

  for (int L = 0; L < 1; L++) {
    for (int M = 0; M < 1; M++) {
      A[(F + D + L * 16) * 4096 + G + E + M * 16] = K[L][M];
    }
  }
}

__kernel void fn_B(__global float* A, __global float* B, __global float* C) {
  int D = get_group_id(0) * get_local_size(0) + get_local_id(0);
  int E = get_group_id(1) * get_local_size(1) + get_local_id(1);
  int F, G;
  float H = 0.0;

  if (E < 4096 && D < 4096) {
    for (G = 0; G < 17; G++) {
      for (F = 0; F < 17; F++) {
        H += B[(E + G) * (4096 + ((17 / 2) * 2)) + (D + F)] * C[G * 17 + F];
      }
    }

    A[E * 4096 + D] = H;
  }
}