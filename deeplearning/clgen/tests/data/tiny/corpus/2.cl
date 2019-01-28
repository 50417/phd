__kernel void A(__write_only image2d_t a, __write_only image2d_t b, __global uint2* c, uint d, float e, float f, float g) {
  if (d == 0) {
    return;
  }

  int h = get_global_id(0);
  if (h >= d) {
    return;
  }

  uint2 i = c[h];

    write_imagef (a, (int2)(i 2, i (float4)(e));
    if (i.y % 2 == 0) {
    write_imagef(b, (int2)(i 2, i 2), (floag 0.0f));
    }
}