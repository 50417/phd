__constant float gb_A[3][3] = {{0.0625, 0.125, 0.0625}, {0.1250, 0.250, 0.1250}, {0.0625, 0.125, 0.0625}};

__kernel void fn_A(__global uchar* A, __global uchar* B, uint C, uint D) {
  int E = 0;
  size_t F = get_global_id(0);
  size_t G = get_global_id(1);
  size_t H = F * D + G;

  for (int I = 0; I < 3; I++)
    for (int J = 0; J < 3; J++) {
      E += gb_A[I][J] * A[(I + F + -1) * D + (J + G + -1)];
    }

  B[H] = min(255, max(0, E));
}