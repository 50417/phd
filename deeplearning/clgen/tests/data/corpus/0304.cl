kernel void fn_A(int A, global float* B, local float* C) {
  if ((int)get_global_id(0) < A) {
    B[get_global_id(0)] += 1.0f;
  }
}

kernel void fn_B(int A, global float* B) {
  if ((int)get_global_id(0) < A) {
    B[get_global_id(0)] += 1.0f;
  }
}

kernel void fn_C(global float* A) {
  int B = get_local_id(0);
  int C = get_local_size(0);

  for (int D = (C >> 1); D > 0; D >>= 1) {
    if (B < D) {
      A[B] = A[B] + A[B + D];
    }
    barrier(1);
  }
}

kernel void fn_D(global float* A, local float* B) {
  int C = get_local_id(0);
  int D = get_local_size(0);

  B[C] = A[C];
  barrier(1);

  for (int E = (D >> 1); E > 0; E >>= 1) {
    if (C < E) {
      B[C] = B[C] + B[C + E];
    }
    barrier(1);
  }

  A[C] = B[C];
}

kernel void fn_E(global float* A, local float* B) {
  int C = get_local_id(0);
  int D = get_local_size(0);
  B[C] = A[C];

  for (int E = (D >> 1); E > 0; E >>= 1) {
    B[C] = C < E ? B[C] + B[C + E] : B[C];
    barrier(1);
  }

  A[C] = B[C];
}

kernel void fn_F(global float* A, local float* B) {
  int C = get_local_id(0);
  int D = get_local_size(0);
  B[C] = A[C];

  for (int E = (D >> 1); E > 0; E >>= 1) {
    B[C] = B[C] + B[C + E];
    barrier(1);
  }

  A[C] = B[C];
}

kernel void fn_G(global float* A, global float* B, local float* C) {
  int D = get_global_id(0);
  int E = get_local_id(0);
  int F = get_local_size(0);
  int G = get_group_id(0);

  C[E] = A[D];
  barrier(1);
  for (int H = (F >> 1); H > 0; H >>= 1) {
    if (E < H) {
      C[E] = C[E] + C[E + H];
    }
    barrier(1);
  }

  A[D] = C[E];
  if (E == 0) {
    B[G] = C[0];
  }
}

kernel void fn_H(global int* A, global int* B, local int* C) {
  int D = get_global_id(0);
  int E = get_local_id(0);
  int F = get_local_size(0);
  int G = get_group_id(0);

  C[E] = A[D];
  barrier(1);
  for (int H = (F >> 1); H > 0; H >>= 1) {
    if (E < H) {
      C[E] = C[E] + C[E + H];
    }
    barrier(1);
  }

  A[D] = C[E];
  if (E == 0) {
    B[G] = C[0];
  }
}

kernel void fn_I(global int* A, global int* B) {
  int C = get_global_id(0);
  int D = get_local_id(0);
  int E = get_local_size(0);
  int F = get_group_id(0);

  barrier(1);
  for (int G = (E >> 1); G > 0; G >>= 1) {
    if (D < G) {
      A[C] = A[C] + A[C + G];
    }
    barrier(1);
  }

  if (D == 0) {
    B[F] = A[C];
  }
}

kernel void fn_J(global int* A, global int* B, local int* C, local int* D) {
  int E = get_global_id(0);
  int F = get_local_id(0);
  int G = get_local_size(0);
  int H = get_group_id(0);

  C[F] = A[E];
  barrier(1);
  int I = 0;
  int J = C[F];
  for (int K = 0; K < G; K++) {
    I += J * C[K];
  }
  D[F] = I;
  barrier(1);
  for (int L = (G >> 1); L > 0; L >>= 1) {
    if (F < L) {
      D[F] = D[F] + D[F + L];
    }
    barrier(1);
  }

  if (F == 0) {
    B[H] = D[0];
  }
}

kernel void fn_K(global int* A, global int* B, global int* C) {
  int D = get_global_id(0);
  int E = get_local_id(0);
  int F = get_local_size(0);
  int G = get_group_id(0);

  const int H = G * F;

  int I = 0;
  int J = A[D];
  for (int K = 0; K < F; K++) {
    I += A[H + K] * J;
  }
  B[D] = I;
  barrier(1);
  for (int L = (F >> 1); L > 0; L >>= 1) {
    if (E < L) {
      B[D] = B[D] + B[D + L];
    }
    barrier(1);
  }

  if (E == 0) {
    C[G] = B[D];
  }
}