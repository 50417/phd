kernel void A(__read_only image2d_t a, global uchar* b, unsigned int c, unsigned int d, unsigned int e, unsigned int f, unsigned int g, unsigned int h, unsigned int i) {
  int j = get_global_id(0);
  int k = get_global_id(1);
  int l = get_global_id(2);
  uint4 m;
  const sampler_t n = 0x0000 | 0x0000 | 0x0000;
  int2 o;
  if ((j >= c) || (k >= d) || (l >= e))
    return;
  o.x = f + j;
  o.y = g + k;
  m = read_imageui(a, n, o);
  i += (l * d + k) * c + j;
  b[i] = m.x;
}