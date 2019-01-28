__kernel void A(__global float4* a, __global float4* b, __global float4* c, __global float4* d) {
  *d = sincos(*b, c);
  *c *= *a;
  *d *= *a;
}