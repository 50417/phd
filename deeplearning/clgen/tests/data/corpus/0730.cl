inline void fn_A(__local int* A, int B) {
  int C = get_local_id(0);
  int D = (C * 2) + 1;

  int E = 1 + (int)log2((float)B);
  for (int F = 0; F < E; F++) {
    barrier(1);
    int G = (0x1 << F) - 1;
    if ((C & G) == G) {
      int H = (0x1 << F);
      int I = D - H;
      A[D] += A[I];
    }
  }
}

inline void fn_B(__local int* A, int B) {
  int C = get_local_id(0);
  int D = (C * 2) + 1;

  int E = (int)log2((float)B);
  for (int F = E; F > -1; F--) {
    barrier(1);
    int G = (0x1 << F) - 1;
    if ((C & G) == G) {
      int H = (0x1 << F);
      int I = D - H;
      int J = A[I];
      A[I] = A[D];
      A[D] += J;
    }
  }
}

inline void fn_C(__local int* A, int B) {
  int C = get_local_id(0);
  int D = (C * 2) + 1;
  fn_A(A, B);
  if (D == (B - 1)) {
    A[D] = 0;
  }
  fn_B(A, B);
}
__kernel void fn_D(__global int* A, __local int* B, int C) {
  int D = get_global_id(0);
  int E = (D * 2);
  int F = (D * 2) + 1;

  B[E] = A[E];
  B[F] = A[F];

  fn_C(B, C);

  A[E] = B[E];
  A[F] = B[F];
}

__kernel void fn_E(__global int* A, __local int* B, int C) {
  int D = get_global_id(0);
  int E = (D * 2);
  int F = (D * 2) + 1;
  int G = 2 * get_local_size(0);

  B[E] = E < C ? A[E] : 0;
  B[F] = F < C ? A[F] : 0;

  fn_A(B, G);
  if (F == (G - 1)) {
    B[F] = 0;
  }
  fn_B(B, G);

  if (E < C)
    A[E] = B[E];
  if (F < C)
    A[F] = B[F];
}
__kernel void fn_F(__global int* A, __local int* B, __global int* C, int D

                   ) {
  int E = get_local_size(0);

  int F = get_global_id(0);
  int G = (2 * F);
  int H = (2 * F) + 1;

  int I = get_local_id(0);
  int J = (2 * I);
  int K = (2 * I) + 1;
  int L = get_group_id(0);

  int M = E * 2;
  int N = get_num_groups(0);

  B[J] = (G < D) ? A[G] : 0;
  B[K] = (H < D) ? A[H] : 0;

  fn_A(B, M);

  if (I == (E - 1)) {
    C[L] = B[K];
    B[K] = 0;
  }

  fn_B(B, M);

  if (G < D) {
    A[G] = B[J];
  }
  if (H < D) {
    A[H] = B[K];
  }
}
__kernel void fn_G(__global int* A, __local int* B, __global int* C, int D

                   ) {
  int E = get_global_id(0);
  int F = (2 * E);
  int G = (2 * E) + 1;

  int H = get_local_id(0);
  int I = (2 * H);
  int J = (2 * H) + 1;
  int K = get_group_id(0);

  B[I] = (F < D) ? A[F] : 0;
  B[J] = (G < D) ? A[G] : 0;

  B[I] += C[K];
  B[J] += C[K];

  if (F < D) {
    A[F] = B[I];
  }
  if (G < D) {
    A[G] = B[J];
  }
}