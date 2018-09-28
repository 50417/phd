struct tree_global {
  volatile int nextNode;
  volatile int activeNodes;
  int depth;
  int pad;
};

__kernel void fn_A(__global float4* A, __global float4* B, __global float* C, const float D, __global uint* E, __global int* F, __global float4* G, __global float* H, __global float4* I) {
  const int J = get_global_id(0);

  float4 K = A[J];
  float L = C[J];
  float4 M = 0;

  B[J] += M;
}