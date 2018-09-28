__kernel void fn_A(const int A, const int B, const int C, const int D, __global const int* E, __global const int* F, __global int* G) {
  const int H = get_global_id(0);
  const int I = get_global_id(1);
  int J = 0;

  if ((H <= A) && (I <= C)) {
    for (int K = 0; K < C; K++) {
      J += E[H * B + K] * F[I + D * K];
    }

    G[I + B * H] = J;
  }
}