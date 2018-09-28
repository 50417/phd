__kernel void fn_A(__global int* A, __global int* B, __local int* C, int D) {
  int E = get_global_id(0);

  int F = get_local_id(0);
  int G = get_group_id(0);

  if (F < 9) {
    C[F] = 0;
  }

  barrier(1);

  if (E < D) {
    int H = A[E];

    atomic_add(&C[H], 1);
  }

  barrier(1);

  if (F < 9) {
    B[G * 16 + F] = C[F];
  }
}

__kernel void fn_B(__global int* A, __global int* B, int C) {
  int D = get_global_id(0);

  int E = get_local_id(0);
  int F = get_group_id(0);

  if (E < 9) {
    int G = 0;
    int H = 0;

    while (G < C) {
      H += A[G * 16 + E];
      G++;
    }

    B[E] = H;
  }
}