unsigned char fn_A(unsigned char A) {
  return 25 * log((float)A + 1);
}

__kernel void fn_B(__global char* A, __global char* B, int C, int D) {
  unsigned int E = get_global_id(0);

  unsigned int F = E * 4;

  B[F] = fn_A(A[F]);
  B[F + 1] = fn_A(A[F + 1]);
  B[F + 2] = fn_A(A[F + 2]);
  B[F + 3] = A[F + 3];
}