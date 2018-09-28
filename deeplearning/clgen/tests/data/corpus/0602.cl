__kernel void fn_A(__global const float* A, __global const float* B, int C, __global float* D) {
  int E = get_global_id(0);
  if (E >= C)
    return;
  D[E] = A[E] + B[E];
}

__kernel void fn_B(__global const float* A, __global const float* B, __global float* C, int D) {
  int E = get_global_id(0);
  if (E >= D)
    return;
  C[E] = A[E] - B[E];
}
__kernel void fn_C(__global const float* A, __global const float* B, __global float* C, int D) {
  int E = get_global_id(0);
  if (E >= D)
    return;
  C[E] = A[E] / B[E];
}
__kernel void fn_D(__global const float* A, __global const float* B, __global float* C, int D) {
  int E = get_global_id(0);
  if (E >= D)
    return;
  C[E] = A[E] * B[E];
}
__kernel void fn_E(__global const float* A, __global const float* B, __global const float* C, __global float* D, int E) {
  int F = get_global_id(0);
  if (F >= E)
    return;
  D[F] = A[F] * B[F] + C[F];
}