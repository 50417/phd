__kernel void A(__global float* a, __global float* b, __global float* c) {
  int d = get_global_id(0);
  c[d] = a[d] * b[d];
}