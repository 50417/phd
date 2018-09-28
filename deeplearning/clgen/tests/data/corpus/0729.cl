__kernel void fn_A(__global const float* A, __global const float* B, __global float* C, int D) {
  int E = get_global_id(0);
  if (E >= D)
    return;

  C[E] = A[E] + B[E];
}

__kernel void fn_B(__global float* A, __global float* B, int C) {
  int D = get_global_id(0);
  if (D >= C)
    return;

  A[D] = cos((float)D);
  B[D] = sin((float)D);
}