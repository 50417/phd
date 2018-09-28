__kernel void fn_A(__global float* A, __global float* B, __global float* C, int D) {
  int E = get_global_id(0);

  if (E >= D) {
    return;
  }

  int F = E << 2;
  C[E] = A[F] * B[F] + A[F + 1] * B[F + 1] + A[F + 2] * B[F + 2] + A[F + 3] * B[F + 3];
}