__kernel void fn_A(__global const float4* A, __global const float4* B, __global float* C) {
  int D = get_global_id(0);
  float4 E = A[D] * B[D];
  C[D] = E.x + E.y + E.z + E.w;
}