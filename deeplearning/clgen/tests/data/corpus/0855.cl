__kernel void fn_A(__global int* A, __global int* B, __global int* C) {
  int D = get_global_id(0);
  C[D] = 1;
}
__kernel void fn_B(__global int* A, __global int* B, __global int* C) {
  int D = get_global_id(0);
  C[D] = A[D];
}
__kernel void fn_C(__global int* A, __global int* B, __global int* C) {
  int D = get_global_id(0);
  C[D] = A[D] + B[D];
}

__kernel void fn_D(__global int* A, __global int* B, __global int* C) {
  int D = get_global_id(0);
  int E = 0;
  for (int F = 0; F < 1024; F++)
    E += F;
  C[D] = E;
}
__kernel void fn_E(__global int* A, __global int* B, __global int* C) {
  int D = get_global_id(0);
  for (int E = 0; E < 1024; E++)
    C[D] += A[D];
}
__kernel void fn_F(__global int* A, __global int* B, __global int* C) {
  int D = get_global_id(0);
  for (int E = 0; E < 1024; E++)
    C[D] += A[D] + B[D];
}