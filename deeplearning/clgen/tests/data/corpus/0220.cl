kernel void fn_A(global float* A, global float* B, global int* C) {
  int D = get_global_id(0);
  B[D] = lgamma_r(A[D], C + D);
};