__kernel void fn_A(const int A, const int B, __global float* C, __global float* D, __global float* E, __global float* F) {
  int G = get_global_id(0);
  if (G < A) {
    float H = F[G];
    for (int I = 0; I < B; ++I) {
      H += D[I + G * B] * E[I];
    }
    C[G] = H;
  }
}

__kernel void fn_B(const int A, __global float* B, __global float* C, __global float* D, __global float* E) {
  int F = get_group_id(0);
  int G = get_local_id(0);

  __local float H[32];

  H[G] = C[F * 32 + G] * D[G];

  for (int I = 32 / 2; I > 0; I >>= 1) {
    barrier(1);
    if (G + I < 32) {
      H[G] += H[G + I];
    }
  }

  if (G == 0) {
    B[F] = H[0] + E[F];
  }
}

__kernel void fn_C(const int A, const int B, __global float* C, __global float* D, __global float* E, __global float* F) {
  __local float G[8 * 2];

  int H = get_local_id(0) / 2;
  int I = get_local_id(0) % 2;

  for (int J = H; J < A; J += 8) {
    G[H * 2 + I] = 0.0f;
    for (int K = I; K < B; K += 2) {
      G[H * 2 + I] += D[K + J * B] * E[K];
    }

    for (int L = 2 / 2; L > 0; L >>= 1) {
      barrier(1);
      if (I + L < 2) {
        G[H * 2 + I] += G[H * 2 + I + L];
      }
    }

    if (I == 0) {
      C[J] = G[H * 2 + 0] + F[J];
    }
  }
}

__kernel void fn_D(const int A, const int B, __global float* C) {
  int D = get_local_id(0);

  for (int E = 0; E < B; ++E) {
    float F = C[E + E * A];
    float G = C[E + D * A] / F;
    barrier(2);
    if (D != E) {
      for (int H = 0; H < A; ++H) {
        C[H + D * A] = C[H + D * A] - G * C[H + A * E];
      }
    }
    barrier(2);
  }

  float G = C[D + D * A];
  for (int H = 0; H < A; ++H) {
    C[H + D * A] = C[H + D * A] / G;
  }
}