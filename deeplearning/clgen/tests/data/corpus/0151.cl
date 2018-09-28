typedef float DATA_TYPE; __kernel void fn_A(__global DATA_TYPE* A, __global DATA_TYPE* B, __global DATA_TYPE* C, DATA_TYPE D, DATA_TYPE E, int F, int G, int H) {
  int I = get_global_id(0);
  int J = get_global_id(1);

  if ((J < F) && (I < G)) {
    C[J * G + I] *= E;
    int K;
    for (K = 0; K < H; K++) {
      C[J * G + I] += D * A[J * H + K] * B[K * G + I];
    }
  }
}