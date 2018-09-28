__kernel void fn_A(__global float* A, __global float* B, const int C) {
  int D = get_global_id(0);

  if (D < C) {
    A[D] += 1;
  }
}

__kernel void fn_B(__global float* A, __global float* B, const int C) {
  int D = get_global_id(0);

  for (int E = 0; E < D * 1000; ++E)
    A[D] += 1;
}

__kernel void fn_C(__global int* A, __global int* B, const int C) {
  int D = get_global_id(0);
  if (D < C)
    A[D] = B[D];
}