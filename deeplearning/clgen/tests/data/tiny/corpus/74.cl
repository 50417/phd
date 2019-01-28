__kernel void A(__global float* a, __global float* b, __global float* c, __global int* d) {
  int e = get_global_id(0);
  float2 f = (float2) eb* (*d]eb* (*d]);
  float2 g = (float2) ec* (*d]ec* (*d]);

  float2 h;
  h = maxmag(f,g);
  a[e * (*d) + 0] = h[0];
  a[e * (*d) + 1] = h[1];
};