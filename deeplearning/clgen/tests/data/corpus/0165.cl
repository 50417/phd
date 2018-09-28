kernel void fn_A(global float* A, global float* B, int C, int D) {
  int E = get_global_id(0);

  float F = A[D * (C + 1) + E];

  if (E != D) {
    F *= B[E];
  }

  A[D * (C + 1) + E] = F;
}

kernel void fn_B(global float* A, global float* B, int C, int D) {
  float E = 0;

  for (int F = 0; F < D; F++) {
    E += A[D * (C + 1) + F];
  }

  for (int F = D + 1; F < C; F++) {
    E += A[D * (C + 1) + F];
  }

  B[D] = (A[D * (C + 1) + C] - E) / A[D * (C + 1) + D];
}

kernel void fn_C(global float* A, global float* B, global float* C, int D, int E) {
  int F = get_global_id(0);

  if (F != E) {
    B[E * (D + 1) + F] = A[E * (D + 1) + F] * C[F];
  }
}

kernel void fn_D(global float* A, global float* B, global float* C, int D, int E) {
  B[E * (D + 1) + D] = A[E * (D + 1) + D];

  for (int F = 0; F < E; F++) {
    B[E * (D + 1) + D] -= B[E * (D + 1) + F];
  }

  for (int F = E + 1; F < D; F++) {
    B[E * (D + 1) + D] -= B[E * (D + 1) + F];
  }

  C[E] = B[E * (D + 1) + D] / A[E * (D + 1) + E];
}