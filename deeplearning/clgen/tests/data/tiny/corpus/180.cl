__kernel void A(__global float16* a, __global float16* b, __global float16* c) {
  uint d = get_global_id(0);
  float16 e = a[d];
  float16 f = b[d];
  float16 g = sin(e) * sin(e) + cos(f) * cos(f);
  c[d] = g;
}