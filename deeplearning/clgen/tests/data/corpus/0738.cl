__kernel void fn_A(__global float8* A, __global float8* B, __global uint16* C, __global float16* D) {
  uint E = get_global_id(0);
  float8 F = A[E];
  float8 G = B[E];
  D[E] = shuffle2(F, G, *C);
}