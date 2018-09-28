kernel void fn_A(global float* A, global float* B, global int* C) {
  A[0] = __builtin_nanf("");
  __builtin_memcpy(A, B, 32);
  A[0] = __builtin_frexpf(B[0], C);
}