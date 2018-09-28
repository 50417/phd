struct match_t {
  float u1p;
  float v1p;
  float u1c;
  float v1c;
};

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void fn_A(const uint A, const uint B, __global const struct match_t* restrict C, const float D, __global const double* restrict E, __global uchar* restrict F) {
  __local float G[9];
  const size_t H = get_global_id(0) % (B);

  if (get_local_id(0) < 9) {
    const size_t I = get_global_id(0) / B;
    G[get_local_id(0)] = E[I * 9 + get_local_id(0)];
  }

  barrier(1);

  if (H < A) {
    float J = G[0];
    float K = G[1];
    float L = G[2];
    float M = G[3];
    float N = G[4];
    float O = G[5];
    float P = G[6];
    float Q = G[7];
    float R = G[8];

    struct match_t S = C[H];
    float T = S.u1p;
    float U = S.v1p;
    float V = S.u1c;
    float W = S.v1c;

    float X = J * T + K * U + L;
    float Y = M * T + N * U + O;
    float Z = P * T + Q * U + R;

    float AA = J * V + M * W + P;
    float AB = K * V + N * W + Q;

    float AC = V * X + W * Y + Z;

    float AD = AC * AC / (X * X + Y * Y + AA * AA + AB * AB);

    F[get_global_id(0)] = __clc_fabs(AD) < D;
  }
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void fn_B(__global const uchar* restrict A, __global ushort* restrict B, const uint C, const uint D, __local ushort* restrict E) {
  const size_t F = get_group_id(0);
  const unsigned G = F * D;

  ushort H = 0;
  for (unsigned I = get_local_id(0); I < C; I += get_local_size(0)) {
    H += A[G + I];
  }

  E[get_local_id(0)] = H;

  barrier(1);

  for (uint J = get_local_size(0) / 2; J > 0; J /= 2) {
    if (get_local_id(0) < J) {
      E[get_local_id(0)] += E[get_local_id(0) + J];
    }

    barrier(1);
  }

  if (get_local_id(0) == 0) {
    B[get_group_id(0)] = E[0];
  }
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void fn_C(__global const uchar* restrict A, __global const ushort* restrict B, const uint C, const uint D, const uint E, __global uchar* restrict F, __global ushort* restrict G) {
  ushort H = G[get_group_id(0)];

  int I = -1;
  for (unsigned J = 0; J < C; J++) {
    const ushort K = B[J];
    if (K > H) {
      I = J;
      H = K;
    }
  }

  barrier(2);

  if (get_global_id(0) < D) {
    if (I != -1) {
      F[get_global_id(0)] = A[I * E + get_global_id(0)];
      if (get_local_id(0) == 0)
        G[get_group_id(0)] = H;
    }
  }
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void fn_D(__global const float* restrict A, const uint B, const float C, const float D, __global float* restrict E) {
  const uint F = get_global_id(0);
  const float G = A[F];
  const bool H = G > C;
  float I = 0;
  for (uint J = 0; J < B; J++) {
    const float K = G - A[J];
    const float L = exp(-K * K * D);
    I += L;
  }
  E[F] = H ? I : 0;
}