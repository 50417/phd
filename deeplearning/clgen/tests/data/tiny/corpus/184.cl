typedef struct Params {
  float A;
  float B;
  float x[2];
  int C;
} Params;

__kernel void A(__global const float* a, __global const float* b, __global float* c, __constant struct Params* d) {
  int e = get_global_id(0);
  c[e] = d->A * a[e] + d->B * b[e] + d->C;
}