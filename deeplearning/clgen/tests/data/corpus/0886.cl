__kernel void fn_A(__global char* A, __global char* B, int C, int D) {
  unsigned int E = get_global_id(0);

  unsigned int F = E * 4;

  unsigned char G;

  G = A[F];
  B[F] = A[F + 2];
  B[F] = A[F + 1];
  B[F + 2] = G;

  B[F + 3] = A[F + 3];
}