typedef struct Params {
  float A;
  float B;

  int C;

} Params;

__kernel void fn_A(__global const float* A, __global const float* B, __global float* C, __constant struct Params* D) {
  int E = get_global_id(0);
  C[E] = D->A * A[E] + D->B * B[E] + D->C;
}