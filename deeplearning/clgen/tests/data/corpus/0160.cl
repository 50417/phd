kernel void fn_A(global float* A, global float* B, int C, int D) {
  size_t E = get_global_id(0);
  float F = 0.0;
  int G;
  for (G = 0; G < D; G++) {
    F += A[G + C * E];
  }
  B[E] = F;
}