void fn_A(__local float* A, __local int* B) {
  uint C = get_local_id(0);
  uint D = get_local_size(0);
  int E;
  float F, G, H;

  for (uint I = D / 2; I > 32; I >>= 1) {
    if (C < I) {
      F = A[C];
      G = A[C + I];
      H = (F >= G) ? F : G;
      E = (F >= G) ? C : C + I;
      A[C] = H;
      B[C] = B[E];
    }
    barrier(1);
  }

  if (C < 32) {
    F = A[C];
    G = A[C + 32];
    H = (F > G) ? F : G;
    E = (F > G) ? C : C + 32;
    A[C] = H;
    B[C] = B[E];

    F = A[C];
    G = A[C + 16];
    H = (F > G) ? F : G;
    E = (F > G) ? C : C + 16;
    A[C] = H;
    B[C] = B[E];

    F = A[C];
    G = A[C + 8];
    H = (F > G) ? F : G;
    E = (F > G) ? C : C + 8;
    A[C] = H;
    B[C] = B[E];

    F = A[C];
    G = A[C + 4];
    H = (F > G) ? F : G;
    E = (F > G) ? C : C + 4;
    A[C] = H;
    B[C] = B[E];

    F = A[C];
    G = A[C + 2];
    H = (F > G) ? F : G;
    E = (F > G) ? C : C + 2;
    A[C] = H;
    B[C] = B[E];

    F = A[C];
    G = A[C + 1];
    H = (F > G) ? F : G;
    E = (F > G) ? C : C + 1;
    A[C] = H;
    B[C] = B[E];
  }
}

__kernel void fn_B(__global float* A, __global int* B, __global float* C, __global float* D, __global float* E, __local float* F, __local int* G, int H, int I, int J) {
  uint K = get_group_id(0) + get_group_id(1) * get_num_groups(0);
  uint L = get_local_id(0);
  uint M = get_local_size(0);

  uint N = K;

  float O = -1.0f;
  int P = -1;
  float Q;
  for (int R = L; R < H; R += M) {
    Q = C[R] + D[N * H + R];
    if (Q > O) {
      O = Q;
      P = R;
    }
  }
  F[L] = O;
  G[L] = P;
  barrier(1);

  fn_A(F, G);

  if (L == 0) {
    A[N] = F[0] + E[I * H + N];
    B[(J - 1) * H + N] = G[0];
  }
}

__kernel void fn_C(__global float* A, __global int* B, __global float* C, __global int* D, int E, int F) {
  if (get_global_id(0) == 0) {
    float G = 0.0;
    int H = -1;
    for (int I = 0; I < E; I++) {
      if (C[I] > G) {
        G = C[I];
        H = I;
      }
    }
    *A = G;

    B[F - 1] = H;
    mem_fence(2);
    for (int J = F - 2; J >= 0; J--) {
      B[J] = D[J * E + B[J + 1]];
      mem_fence(2);
    }
  }
}