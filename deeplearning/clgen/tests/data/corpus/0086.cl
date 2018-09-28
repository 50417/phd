__kernel void fn_A(__global const char* A, const int B, __global const char* C, __global float2* D, const int E, __global const float* F, const float G, const int H, const int I, const int J, __global int* K) {
  float L = G * F[1];
  const int M = get_global_id(0);
  const int N = get_global_id(1);

  if (N > 0 && N < H - 1 && M > 0 && M < I - 1

      ) {
    const float O = ((__global const float*)(A + (N)*B))[M];

    if (O > L) {
      float P = O;
      P = fmax(((__global const float*)(A + (N - 1) * B))[M - 1], P);
      P = fmax(((__global const float*)(A + (N - 1) * B))[M], P);
      P = fmax(((__global const float*)(A + (N - 1) * B))[M + 1], P);

      P = fmax(((__global const float*)(A + (N)*B))[M - 1], P);
      P = fmax(((__global const float*)(A + (N)*B))[M + 1], P);

      P = fmax(((__global const float*)(A + (N + 1) * B))[M - 1], P);
      P = fmax(((__global const float*)(A + (N + 1) * B))[M], P);
      P = fmax(((__global const float*)(A + (N + 1) * B))[M + 1], P);

      if (O == P) {
        const int Q = atomic_add(K, 1);

        if (Q < J) {
          D[Q].x = O;
          D[Q].y = __builtin_astype(M | (N << 16), float);
        }
      }
    }
  }
}

__kernel void fn_B(__global float2* A, const int B, const int C, const int D) {
  const int E = get_global_id(0);
  if (E >= B / 2) {
    return;
  }

  const int F = (((E / (1 << C)) % 2)) == 1 ? 1 : 0;

  const int G = 1 << (C - D);
  const int H = 2 * G;

  const int I = min((E % G) + (E / G) * H, B);

  const int J = min(I + G, B);

  const float2 K = A[I];
  const float2 L = A[J];

  const float M = K.x;
  const float N = L.x;

  const bool O = M > N;

  float2 P = O ? K : L;
  float2 Q = O ? L : K;

  A[I] = F ? Q : P;
  A[J] = F ? P : Q;
}

__kernel void fn_C(__global float* A, int B, __global int* C) {
  C[0] = 0;
  float D = A[0];
  float E = A[B];
  for (int F = 1; F < B; ++F) {
    D = min(D, A[F]);
    E = max(E, A[F + B]);
  }
  A[0] = D;
  A[1] = E;
}