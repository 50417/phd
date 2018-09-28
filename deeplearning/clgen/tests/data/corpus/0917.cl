__kernel void fn_A(__global float* A, __global float* B, const float16 C, const unsigned int D) {
  int E;

  E = get_global_id(0);
  if (E < D) {
    int F, G;
    __global float* H = A + E * 16;
    __global float* I = B + E * 16;

    for (E = 0; E < 3; E++) {
      for (F = 0; F < 3; F++) {
        float J = 0.0;
        for (G = 0; G < 3; G++)
          J += C[3 * E + G] * H[3 * G + F];
        I[3 * E + F] = J;
      }
    }
  }
}