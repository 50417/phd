typedef float4 keypoint; __kernel void fn_A(__global float* A, float B, __global float* C, float D, __global float* E, int F, int G, int H) {
  int I = (int)get_global_id(1);
  int J = (int)get_global_id(0);

  if (J < G && I < H) {
    int K = J + G * I;
    int L = F * G * H + K;
    E[L] = B * A[K] + D * C[K];
  }
}
__kernel void fn_B(__global keypoint* A, __global keypoint* B, __global int* C, int D, int E) {
  int F = (int)get_global_id(0);
  if (F < D) {
    B[F] = A[F];
  } else if (F < E) {
    keypoint G = A[F];

    if (G.s1 != -1) {
      int H = atomic_add(C, 1);
      if (H < E)
        B[H] = G;
    }
  }
}