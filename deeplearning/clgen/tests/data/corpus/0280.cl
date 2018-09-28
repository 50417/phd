typedef float DATA_TYPE; __kernel void fn_A(__global DATA_TYPE* A, __global DATA_TYPE* B, __global DATA_TYPE* C, int D, int E) {
  int F = get_global_id(0);

  if (F < D) {
    int G;
    for (G = 0; G < E; G++) {
      C[F] += A[F * E + G] * B[G];
    }
  }
}

__kernel void fn_B(__global DATA_TYPE* A, __global DATA_TYPE* B, __global DATA_TYPE* C, int D, int E) {
  int F = get_global_id(0);
  int G;
  for (G = 0; G < D; G++) {
    B[F] += A[G * E + F] * C[G];
  }
}