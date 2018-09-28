kernel void fn_A(global float* A, constant float* B) {
  __builtin_memcpy(A, B, 32);
}