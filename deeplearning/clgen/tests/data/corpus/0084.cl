__kernel void fn_A(__global float* A, __global float* B, __global int* C, __global int* D) {
  int E = get_global_id(0);
  float F = (float)(B[E * (*D) + 0]);
  int G = (int)(C[E * (*D) + 0]);

  float H;
  H = rootn(F, G);
  A[E] = H;
};