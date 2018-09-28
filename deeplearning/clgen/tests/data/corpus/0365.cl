__kernel void fn_A(const int A, __global int* B, __global int* C) {
  unsigned int D = get_global_id(0);
  unsigned int E = get_global_id(1);

  unsigned int F = D + A * E;

  C[F] = B[F] + F;
}

__kernel void fn_B(const int A, __global int* B) {
  unsigned int C = get_global_id(0);
  unsigned int D = get_global_id(1);

  unsigned int E = C + A * D;

  B[E] = E;
}

__kernel void fn_C(const int A, __global int* B, __global int* C) {
  unsigned int D = get_global_id(0);
  unsigned int E = get_global_id(1);

  unsigned int F = D + A * E;

  if (B[F] == 0) {
    C[F] = 1;
  } else {
    C[F] = 0;
  }
}

__kernel void fn_D(const int A, __global int* B, __global int* C) {
  unsigned int D = get_global_id(0);
  unsigned int E = get_global_id(1);
  unsigned int F = D + A * E;
  unsigned int G = 0;

  if (B[F - 1] == 1) {
    G = G + 1;
  }
  if (B[F + 1] == 1) {
    G = G + 1;
  }
  if (B[F - 1 - A] == 1) {
    G = G + 1;
  }
  if (B[F - 1 + A] == 1) {
    G = G + 1;
  }
  if (B[F + 1 - A] == 1) {
    G = G + 1;
  }
  if (B[F + 1 + A] == 1) {
    G = G + 1;
  }
  if (B[F - A] == 1) {
    G = G + 1;
  }
  if (B[F + A] == 1) {
    G = G + 1;
  }

  if (G != 2) {
    if (G == 3) {
      C[F] = 1;
    } else {
      C[F] = 0;
    }
  }
}