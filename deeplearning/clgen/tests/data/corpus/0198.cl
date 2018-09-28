__kernel void fn_A(__global const uint* A, __global const uint* B, __global uint* C, uint D) {
  int E = get_global_id(0);

  C[E] = A[E] ^ B[E] ^ D;
}