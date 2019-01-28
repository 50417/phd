__kernel void A(__global const float* a, __global const float* b, __global float* c, int d, int e) {
  for (int f = 0; f < d * e; f++)
    c[f] = 0;

  vadd_openmp(a, b, c, d, e);
}