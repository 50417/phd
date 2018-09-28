__kernel void fn_A(__global float4* A, __global float4* B, __global float* C) {
  int D = get_global_id(0);
  C[D] = dot(A[D], B[0]);
}