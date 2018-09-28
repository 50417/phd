__kernel void fn_A(const int A, const int B, const int C, __global float* D, __global float* E, __global float* F) {
  int G, H;
  int I = get_global_id(0);
  float J;
  if (I < B) {
    for (H = 0; H < A; H++) {
      J = 0.0f;
      for (G = 0; G < C; G++)
        J += D[I * B + G] * E[G * C + H];
      F[I * B + H] = J;
    }
  }
}