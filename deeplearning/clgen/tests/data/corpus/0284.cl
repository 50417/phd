__kernel void fn_A(__global float* A, __global float* B, int C, int D, __local float* E) {
  unsigned int F = get_local_size(1);
  unsigned int G = get_local_size(0);

  unsigned int H = get_group_id(1);
  unsigned int I = get_group_id(0);

  unsigned int J = get_global_id(1);
  unsigned int K = get_global_id(0);

  unsigned int L = get_local_id(1);
  unsigned int M = get_local_id(0);

  unsigned int N = J * C + K;
  E[L * (G) + M] = B[N];

  barrier(1);

  unsigned int O = G * I * D + F * H;

  unsigned int P = L * G + M;
  unsigned int Q = P / F;
  unsigned int R = P % F;

  unsigned int S = O + D * Q + R;
  A[S] = E[R * G + Q];
}

__kernel void fn_B(__global float* A, __global const float* B, int C, int D) {
  unsigned int E = get_global_id(1);
  unsigned int F = get_global_id(0);

  unsigned int G = E * C + F;
  unsigned int H = F * D + E;
  A[H] = B[G];
}