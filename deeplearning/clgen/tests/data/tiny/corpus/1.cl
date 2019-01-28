typedef struct {
  float r_gain;
  float gr_gain;
  float gb_gain;
  float b_gain;
} CLWBConfig;

__kernel void A(__read_only image2d_t a, __write_only image2d_t b, CLWBConfig c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  sampler_t f = 0x0000 | 0x0000 | 0x0000;
  float4 g, h, i, j;
  float4 k, l, m, n;
  g = read_imagef(a, f, (int2)(2 * d, 2 * e));
  h = read_imagef(a, f, (int2)(2 * d + 1, 2 * e));
  i = read_imagef(a, f, (int2)(2 * d, 2 * e + 1));
  j = read_imagef(a, f, (int2)(2 * d + 1, 2 * e + 1));
  k.x = g.x * c.gr_gain;
  k.y = 0.0;
  k.z = 0.0;
  k.w = 1.0;
  l.x = h.x * c.r_gain;
  l.y = 0.0;
  l.z = 0.0;
  l.w = 1.0;
  m.x = i.x * c.b_gain;
  m.y = 0.0;
  m.z = 0.0;
  m.w = 1.0;
  n.x = j.x * c.gb_gain;
  n.y = 0.0;
  n.z = 0.0;
  n.w = 1.0;
  write_imagef(b, (int2)(2 * d, 2 * e), k);
  write_imagef(b, (int2)(2 * d + 1, 2 * e), l);
  write_imagef(b, (int2)(2 * d, 2 * e + 1), m);
  write_imagef(b, (int2)(2 * d + 1, 2 * e + 1), n);
}