__kernel void A(__global uchar* a, __global uchar* b, __global __const uint* c, uint d) {
  uint4 e = (uint4)(get_global_id(0), get_global_id(1), get_global_id(2), 0);

  __const uint f = e.x * (1 + d) + e.y * c[0] * (1 + d) + e.z * c[0] * c[1] * (1 + d);

  uint4 g = (uint4)(0);
  uint h = 0;

  uchar4 i = vload4(f, a);

  if (i.x != 0) {
    for (uint j = 0; j < d; ++j) {
      uchar4 k = vload4(f + 1 + j, a);

      if ((k.x + k.y + k.z + k.w) != 0) {
        g.x += k.x;
        g.y += k.y;
        g.z += k.z;
        g.w += k.w;
        h++;
      }
    }

    g /= h;

    vstore4(g e.x + e.y * c[0] + e.z * c[0] * c[1], b);
  } else
    vstore4((uchar4)(0, 0, 0, 0), e.x + e.y * c[0] + e.z * c[0] * c[1], b);
}