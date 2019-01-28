__kernel void A(__global const float* a, __global const float* b, __global float* c, int d) {
  for (int e = 0; e < d; e++)
    c[e] = 0;

  vadd_openmp(a, b, c, d);
}