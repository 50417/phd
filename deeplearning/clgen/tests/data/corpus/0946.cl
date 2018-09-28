__kernel void fn_A(__global const float* A, __global const float* B, __global float* C, int D) {
  int E = get_global_id(0);

  if (E >= D) {
    return;
  }

  C[E] = A[E] + B[E];
}