__kernel void A(__global float* a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);

  int e = 1;
  int f = d != e;
  c[d] = 0.1 * f;
}