__kernel void fn_A(__global float* A, __global const float* B, int C, int D) {
  unsigned int E = get_global_id(1);
  unsigned int F = get_global_id(0);

  unsigned int G = E * C + F;
  unsigned int H = F * D + E;
  A[H] = B[G];
}