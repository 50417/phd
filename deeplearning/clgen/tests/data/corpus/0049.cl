kernel void fn_A(__global float* A, __global float* B, __global float* C, const unsigned int D) {
  int E = get_global_id(0);
  if (E < D)
    C[E] = A[E] + B[E];
}