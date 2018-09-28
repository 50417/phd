__kernel __attribute__((reqd_work_group_size(16, 4, 1))) void fn_A(__global float* A, __global float* B, __constant float* C, int D, int E, int F) {
  __local float G[4][(4 + 2 * 1) * 16];

  const int H = (get_group_id(0) * 4 - 1) * 16 + get_local_id(0);
  const int I = get_group_id(1) * 4 + get_local_id(1);

  B += I * F + H;
  A += I * F + H;

  for (int J = 1; J < 1 + 4; J++)
    G[get_local_id(1)][get_local_id(0) + J * 16] = B[J * 16];

  for (int J = 0; J < 1; J++)
    G[get_local_id(1)][get_local_id(0) + J * 16] = (H + J * 16 >= 0) ? B[J * 16] : 0;

  for (int J = 1 + 4; J < 1 + 4 + 1; J++)
    G[get_local_id(1)][get_local_id(0) + J * 16] = (H + J * 16 < D) ? B[J * 16] : 0;

  barrier(1);
  for (int J = 1; J < 1 + 4; J++) {
    float K = 0;

    for (int L = -8; L <= 8; L++)
      K += C[8 - L] * G[get_local_id(1)][get_local_id(0) + J * 16 + L];

    A[J * 16] = K;
  }
}

__kernel __attribute__((reqd_work_group_size(16, 8, 1))) void fn_B(__global float* A, __global float* B, __constant float* C, int D, int E, int F) {
  __local float G[16][(4 + 2 * 1) * 8 + 1];

  const int H = get_group_id(0) * 16 + get_local_id(0);
  const int I = (get_group_id(1) * 4 - 1) * 8 + get_local_id(1);
  B += I * F + H;
  A += I * F + H;

  for (int J = 1; J < 1 + 4; J++)
    G[get_local_id(0)][get_local_id(1) + J * 8] = B[J * 8 * F];

  for (int J = 0; J < 1; J++)
    G[get_local_id(0)][get_local_id(1) + J * 8] = (I + J * 8 >= 0) ? B[J * 8 * F] : 0;

  for (int J = 1 + 4; J < 1 + 4 + 1; J++)
    G[get_local_id(0)][get_local_id(1) + J * 8] = (I + J * 8 < E) ? B[J * 8 * F] : 0;

  barrier(1);
  for (int J = 1; J < 1 + 4; J++) {
    float K = 0;

    for (int L = -8; L <= 8; L++)
      K += C[8 - L] * G[get_local_id(0)][get_local_id(1) + J * 8 + L];

    A[J * 8 * F] = K;
  }
}