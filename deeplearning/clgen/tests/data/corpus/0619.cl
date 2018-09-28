__kernel void fn_A(__global float4* A) {
  A[get_local_id(0)] = __clc_ceil(A[get_local_id(0)]);
}