__kernel void fn_A(__global float4* A, __global int* B) {
  int C = get_global_id(0);
}