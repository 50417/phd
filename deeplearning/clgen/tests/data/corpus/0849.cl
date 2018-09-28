float fn_A(float A) {
  return 1.0f / (1.0f + exp(-A));
}

__attribute__((reqd_work_group_size(1, 1, 1))) __kernel void fn_B(__global float* A, __global float* B, __global float* C) {
  for (int D = 0; D < 6; ++D) {
    for (int E = 0; E < 784; ++E) {
      float F = 0.0f;
      for (int G = 0; G < 25; G += 5) {
        for (int H = 0; H < 5; ++H) {
          F += A[D * 25 + G + H] * B[(G + H) * 784 + E];
        }
      }
      C[D * 784 + E] = F;
    }
  }
}