__kernel void A(__read_only image2d_t a, __write_only image2d_t b) {
  const sampler_t c = 0x0000 | 0x0002 | 0x0000;
  const int2 d = (int2)(get_global_id(0), get_global_id(1));
  int2 e;
  uint4 f = 0;

  for (e.y = -1; e.y <= 1; e.y++) {
    for (e.x = -1; e.x <= 1; e.x++) {
      f += read_imageui(a, c, d + e);
    }
  }

  uint4 g = f / 9;

  write_imageui(b, d, g);
}