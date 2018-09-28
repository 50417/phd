__kernel void fn_A(const int A, __global float* B, __global float* C, __global float* D) {
  int E, F;
  int G = get_global_id(0);
  float H[1024];
  float I;
  if (G < A) {
    for (E = 0; E < A; E++)
      H[E] = B[G * A + E];

    for (F = 0; F < A; F++) {
      I = 0.0f;
      for (E = 0; E < A; E++)
        I += H[E] * C[E * A + F];
      D[G * A + F] = I;
    }
  }
}