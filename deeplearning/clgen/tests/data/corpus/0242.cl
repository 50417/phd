__kernel void fn_A(__global float4* A, __global float4* B, __global float4* C, __global float4* D) {
  D[0] = A[0] * B[0] + C[0] - A[0];
  D[1] = mad(A[1], B[1], C[1]);
}