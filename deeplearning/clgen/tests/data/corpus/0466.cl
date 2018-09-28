kernel void fn_A(global float* A, global float* B, global float* C) {
  size_t D = get_global_id(0);
  C[D] = A[D] + B[D];
}