__kernel void fn_A(__global const float* A, int B, __global const float* C, int D, __global float* E, int F, int G, float H, float I) {
  float J[16];
  for (int K = 0; K < 16; K++)
    J[K] = 0.0f;

  int L = get_local_id(1) * get_local_size(0) + get_local_id(0);
  int M = get_group_id(0) * 16 + L;
  int N = get_group_id(1) * 16 + get_local_id(0);

  __local float O[16][16];

  for (int K = 0; K < G; K += 16) {
    float P;
    O[get_local_id(1)][get_local_id(0)] = C[N + (K + get_local_id(1)) * D];
    barrier(1);
    for (int Q = 0; Q < 16; Q++) {
      P = A[M + (K + Q) * B];
      for (int R = 0; R < 16; R++)
        J[R] += P * O[Q][R];
    }
    barrier(1);
  }
  int S = F * get_group_id(1) * 16 + M;
  for (int K = 0; K < 16; K++) {
    E[S + K * F] = E[S + K * F] * I + H * J[K];
  }
}