__kernel void fn_A(const __global float* A, const __global float* B, uint C, uint D, __global float* E) {
  uint F = get_global_id(0);
  if (F < D) {
    const __global float* G = A + F * C;

    float H = 0;
    for (int I = 0; I < C; ++I)
      H += G[I] * B[I];

    E[F] = H;
  }
}

__kernel void fn_B(const __global float* A, const __global float* B, uint C, uint D, __global float* E) {
  for (uint F = get_global_id(0); F < D; F += get_global_size(0)) {
    const __global float* G = A + F * C;

    float H = 0;
    for (uint I = 0; I < C; ++I)
      H += G[I] * B[I];

    E[F] = H;
  }
}

__kernel void fn_C(const __global float* A, const __global float* B, uint C, uint D, __global float* E, __local float* F) {
  for (uint G = get_group_id(0); G < D; G += get_num_groups(0)) {
    const __global float* H = A + G * C;

    float I = 0;
    for (uint J = get_local_id(0); J < C; J += get_local_size(0))
      I += H[J] * B[J];

    F[get_local_id(0)] = I;

    barrier(1);

    if (get_local_id(0) == 0) {
      float K = 0;
      for (uint L = 0; L < get_local_size(0); ++L)
        K += F[L];
      E[G] = K;
    }

    barrier(1);
  }
}

__kernel void fn_D(const __global float* A, const __global float* B, uint C, uint D, __global float* E, __local float* F) {
  for (uint G = get_group_id(0); G < D; G += get_num_groups(0)) {
    const __global float* H = A + G * C;

    float I = 0;
    for (uint J = get_local_id(0); J < C; J += get_local_size(0))
      I += H[J] * B[J];

    F[get_local_id(0)] = I;

    for (uint K = 1; K < get_local_size(0); K *= 2) {
      barrier(1);

      uint L = 2 * K * get_local_id(0);

      if (L < get_local_size(0)) {
        F[L] += F[L + K];
      }
    }

    if (get_local_id(0) == 0)
      E[G] = F[0];

    barrier(1);
  }
}

__kernel void fn_E(const __global float* A, const __global float* B, uint C, uint D, __global float* E, __local float* F) {
  for (uint G = get_group_id(0); G < D; G += get_num_groups(0)) {
    const __global float* H = A + G * C;

    float I = 0;
    for (uint J = get_local_id(0); J < C; J += get_local_size(0))
      I += H[J] * B[J];

    F[get_local_id(0)] = I;

    for (uint K = get_local_size(0) / 2; K > 0; K /= 2) {
      barrier(1);

      if (get_local_id(0) < K) {
        F[get_local_id(0)] += F[get_local_id(0) + K];
      }
    }

    if (get_local_id(0) == 0)
      E[G] = F[0];

    barrier(1);
  }
}

__kernel void fn_F(const __global float* A, const __global float* B, uint C, uint D, __global float* E, __local float* F) {
  for (uint G = get_group_id(0); G < D; G += get_num_groups(0)) {
    const __global float* H = A + G * C;

    float I = 0;
    for (uint J = get_local_id(0); J < C; J += get_local_size(0))
      I += H[J] * B[J];

    F[get_local_id(0)] = I;

    barrier(1);

    uint K = get_local_id(0) & (32 - 1);

    float L = 0.0f;
    if (get_local_id(0) < get_local_size(0) / 2) {
      volatile __local float* M = F + 2 * get_local_id(0) - K;
      M[0] += M[32];
      M[0] += M[16];
      M[0] += M[8];
      M[0] += M[4];
      M[0] += M[2];
      M[0] += M[1];
      L = M[0];
    }

    barrier(1);

    if (K == 0)
      F[get_local_id(0) / 32] = L;

    barrier(1);

    uint N = get_local_size(0) / (2 * 32);

    if (get_local_id(0) < N / 2) {
      volatile __local float* M = F + get_local_id(0);
      if (N >= 8)
        M[0] += M[4];
      if (N >= 4)
        M[0] += M[2];
      if (N >= 2)
        M[0] += M[1];
    }

    if (get_local_id(0) == 0)
      E[G] = F[0];

    barrier(1);
  }
}