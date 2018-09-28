__kernel void fn_A(__global int* A, __global int* B, int C, int D) {
  int E = get_global_id(0);
  int F = get_global_id(1);

  B[F * C + E] = A[E * D + F];
}