__kernel void fn_A(__global float* A, __global float* B, const int C, const int D) {
  const int E = get_global_id(0);

  if (E < D * C) {
    A[E] += B[E];
  }
}

__kernel void fn_B(__global float* A, __global float* B, const int C, const int D) {
  const int E = get_global_id(0);

  if (E < D * C) {
    A[E] += B[E];
  }
}