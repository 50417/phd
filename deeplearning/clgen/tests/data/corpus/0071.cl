__kernel void fn_A(const int A, __global float* B, __global float* C, __global float* D) {
  int E;
  int F = get_global_id(0);
  int G = get_global_id(1);
  float H;
  if ((F < A) && (G < A)) {
    H = 0.0;
    for (E = 0; E < A; E++)
      H += B[F * A + E] * C[E * A + G];
    D[F * A + G] = H;
  }
}