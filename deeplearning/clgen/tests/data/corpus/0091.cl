__kernel void fn_A(__global const float* A, __global const float* B, __global float* C, const int D) {
  const int E = get_global_id(0);

  if (E < D)
    C[E] = A[E] + B[E];
}