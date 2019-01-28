__constant sampler_t a = 0x0000 | 0x0000 | 0x0000; __kernel void A(__read_only image2d_t b, __global char* c, __global char* d, __private float e, __private float f) {
  const int2 g = {get_global_id(0), get_global_id(1)};
  const uint h = g.x + g.y * get_global_size(0);

  int2 i[8] = {{1, 0}, {0, 1}, {1, 1}, {-1, 0}, {0, -1}, {-1, -1}, {-1, 1}, {1, -1}};

  if (c[h] == 2) {
    float j = (float)read_imageui(b, a, g).x;
    if (j >= e && j <= f) {
      c[h] = 1;

      for (int k = 0; k < 8; k++) {
        int2 l = g + i[k];
        if (l.x < 0 || l.y < 0 || l.x >= get_global_size(0) || l.y >= get_global_size(1))
          continue;
        uint m = l.x + l.y * get_global_size(0);
        if (c[m] == 0) {
          c[m] = 2;
          d[0] = 0;
        }
      }
    } else {
      c[h] = 0;
    }
  }
}