__kernel void A(__global float* a, uint4 b, __global const float* c, unsigned int d, __global const float* e, uint4 f) {
  float g = c[0];
  if ((d >> 2) > 1) {
    for (unsigned int h = 1; h < (d >> 2); ++h)
      g += c[h];
  }
  if (d & (1 << 0))
    g = -g;
  if (d & (1 << 1))
    g = ((float)(1)) / g;

  for (unsigned int h = get_global_id(0); h < b.z; h += get_global_size(0))
    a[h * b.y + b.x] = e[h * f.y + f.x] * g;
}