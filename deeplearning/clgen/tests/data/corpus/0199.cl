__kernel void fn_A(const __global float* A, __global float* B, int C, int D) {
  const int E = get_global_id(0);
  const int F = get_global_id(1);
  float G = 0.0f;
  for (int H = 0; H < D; H++) {
    const int I = (F + H) * C + E;
    for (int J = 0; J < D; J++) {
      G += A[I + J];
    }
  }
  B[F * get_global_size(0) + E] = G;
}