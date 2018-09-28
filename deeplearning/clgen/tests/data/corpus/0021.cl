__kernel void fn_A(__global float* A, __global int* B, __global int* C, int D, int E, int F, int G) {
  const int H = get_local_id(0);
  const int I = E - 2;

  int J = *C;

  if (H == 0) {
    B[E - 1] = J;

    for (int K = I; K >= 0; K--) {
      float L = (J < 0) ? 0x1.fffffep127f : (A)[((K)*F + (J - 1))];
      float M = (A)[((K)*F + (J))];
      float N = (J > (D - G)) ? 0x1.fffffep127f : (A)[((K)*F + (J + 1))];

      if (L < M) {
        J += (L < N) ? -1 : 1;
      } else {
        J += (M < N) ? 0 : 1;
      }

      B[K] = J;
    }
  }
}