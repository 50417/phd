__kernel void A(__global uint* a, __global uint* b) {
  const int c = (int)get_global_id(0);
  const uint3 d = vload3(c, a);
  vstore3(d, c, b);
}