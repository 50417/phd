typedef float real_t; __kernel void fn_A(__global real_t* A, __global real_t* B, __global real_t* C, size_t D, size_t E, size_t F) {
  size_t G = get_global_id(0);
  size_t H = get_global_id(1);
  size_t I = H;
  size_t J = G;

  real_t K = 0.0;
  for (size_t L = 0; L < E; ++L) {
    K += B[(J * E + L)] * C[(I + L * F)];
  }
  A[(J * F + I)] = K;
}

__kernel void fn_B(__global real_t* A, __global real_t* B, real_t C, size_t D, size_t E) {
  size_t F = get_global_id(0);
  size_t G = get_global_id(1);

  real_t H = C * B[F * E + G];
  A[F * E + G] = H;
}

__kernel void fn_C(__global real_t* A, __global real_t* B, __global real_t* C, size_t D, size_t E) {
  size_t F = get_global_id(0);
  size_t G = get_global_id(1);

  real_t H = B[F * E + G] * C[F * E + G];
  A[F * E + G] = H;
}

__kernel void fn_D(__global real_t* A, __global real_t* B, real_t C, size_t D, size_t E) {
  size_t F = get_global_id(0);
  size_t G = get_global_id(1);

  real_t H = B[F * E + G] + C;
  A[F * E + G] = H;
}

__kernel void fn_E(__global real_t* A, __global real_t* B, __global real_t* C, size_t D, size_t E) {
  size_t F = get_global_id(0);
  size_t G = get_global_id(1);

  real_t H = B[F * E + G] + C[F * E + G];
  A[F * E + G] = H;
}

__kernel void fn_F(__global real_t* A, __global real_t* B, __global real_t* C, size_t D, size_t E) {
  size_t F = get_global_id(0);
  size_t G = get_global_id(1);

  real_t H = B[F * E + G] - C[F * E + G];
  A[F * E + G] = H;
}

__kernel void fn_G(__global real_t* A, __global real_t* B, __global real_t* C, size_t D, size_t E, size_t F) {
  size_t G = get_global_id(0U);

  size_t H = E + F;

  for (size_t I = 0U; I < E; ++I) {
    A[G * H + I] = B[G * E + I];
  }

  for (size_t I = 0U; I < F; ++I) {
    A[G * H + E + I] = C[G * F + I];
  }
}

__kernel void fn_H(__global real_t* A, __global real_t* B, size_t C, size_t D) {
  size_t E = get_global_id(0U);
  size_t F = get_global_id(1U);

  A[F * C + E] = B[E * D + F];
}

__kernel void fn_I(__global real_t* A, __global real_t* B, size_t C, size_t D) {
  size_t E = get_global_id(1);

  real_t F = 0.0;
  for (size_t G = 0U; G < C; ++G) {
    F += B[G * D + E];
  }
  A[E] = F;
}

__kernel void fn_J(__global real_t* A, __global real_t* B, size_t C, size_t D) {
  size_t E = get_global_id(0);

  for (size_t F = 0U; F < D; ++F) {
    A[E] += B[E * D + F];
  }
}

__kernel void fn_K(__global real_t* A, __global real_t* B, size_t C, size_t D) {
  size_t E = get_global_id(0);
  size_t F = get_global_id(1);

  real_t G = B[E * D + F];
  A[E * D + F] = log(G);
}