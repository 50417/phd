__kernel void fn_A(int A, __global double* B, int C, int D) {
  int E = get_group_id(0) * D + get_local_id(0);
  int F, G;
  B += (E + C);
  double H;

  H = 0.0;

  for (F = 0; F < A; F += 32) {
    for (G = 0; G < A; G += 32)
      B[G] = H;
    B += 32 * D;
  }
}

__kernel void fn_B(int A, int B, __global double* C, int D, int E) {
  int F = get_group_id(0) * 64;

  int G = get_group_id(1) * 32;

  int H = F + get_local_id(0);
  C += D + H + ((G) * (E));
  double I;

  I = 0.0;

  for (int J = 0; J < 32; J++)
    if (G + J < B && H < A && H < J + G)
      C[J * E] = I;
}

__kernel void fn_C(int A, int B, __global double* C, int D, int E) {
  int F = get_group_id(0) * 64;

  int G = get_group_id(1) * 32;

  int H = F + get_local_id(0);
  C += D + H + ((G) * (E));
  double I;

  I = 0.0;

  for (int J = 0; J < 32; J++) {
    if (G + J < B && H < A && H > J + G)
      C[J * E] = I;
  }
}

__kernel void fn_D(int A, int B, __global double* C, int D, int E) {
  int F = get_group_id(0) * 64;

  int G = get_group_id(1) * 32;

  int H = F + get_local_id(0);
  C += D + H + ((G) * (E));
  double I;

  I = 0.0;

  for (int J = 0; J < 32; J++)
    if (G + J < B && H < A)
      C[J * E] = I;
}