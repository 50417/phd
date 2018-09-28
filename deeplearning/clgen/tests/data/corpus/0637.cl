__kernel void fn_A(__global uint* A, __global uint* B, int C) {
  __global uint* D = C > 0 ? A : B;

  __local uint E[256];

  for (uint C = 0; C < 256; C += 1) {
    D[C] += E[C];
  }
}