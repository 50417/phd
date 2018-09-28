__kernel void fn_A(int A, int B, __global int* C, __global int* D, __global int* E) {
  int F = get_global_id(0);
  int G = get_global_id(1);
  int H = 0;

  if ((F < B) && (G < A)) {
    H = 0;
    for (int I = 0; I < A; ++I) {
      H += C[F * B + I] * D[I * A + G];
    }
    E[F * B + G] = H;
  }
}