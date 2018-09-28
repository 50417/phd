__kernel void fn_A(const __global float* A, __global float* B) {
  const int C = get_global_id(0);

  B[C] += A[C];
}