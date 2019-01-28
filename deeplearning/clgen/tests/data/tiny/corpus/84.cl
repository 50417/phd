__kernel void A(__global float* a, __global float* b, __global int* c) {
  int d = get_global_id(0);
  float4 e = (float4) db* (*c]db* (*c]db* (*c]db* (*c]);

  float4 f;
  f = tan(e);
  a[d * (*c) + 0] = f[0];
  a[d * (*c) + 1] = f[1];
  a[d * (*c) + 2] = f[2];
  a[d * (*c) + 3] = f[3];
};