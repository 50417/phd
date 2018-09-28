__kernel void fn_A(__global int* A, __global int* B, int C, unsigned int D) {
  int E = get_global_id(0);
  if (E < D)
    B[E] = A[E] + C;
}