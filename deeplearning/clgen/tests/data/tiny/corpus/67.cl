constant float a[49] = {1.0 / 307.0,  2.0 / 307.0,  4.0 / 307.0, 7.0 / 307.0, 4.0 / 307.0, 2.0 / 307.0,  1.0 / 307.0,  2.0 / 307.0,  4.0 / 307.0, 7.0 / 307.0, 10.0 / 307.0, 7.0 / 307.0, 4.0 / 307.0, 2.0 / 307.0,  4.0 / 307.0, 7.0 / 307.0, 10.0 / 307.0, 14.0 / 307.0, 10.0 / 307.0, 7.0 / 307.0, 4.0 / 307.0, 7.0 / 307.0, 10.0 / 307.0, 14.0 / 307.0, 19.0 / 307.0,
                        14.0 / 307.0, 10.0 / 307.0, 7.0 / 307.0, 4.0 / 307.0, 7.0 / 307.0, 10.0 / 307.0, 14.0 / 307.0, 10.0 / 307.0, 7.0 / 307.0, 4.0 / 307.0, 2.0 / 307.0,  4.0 / 307.0, 7.0 / 307.0, 10.0 / 307.0, 7.0 / 307.0, 4.0 / 307.0, 2.0 / 307.0,  1.0 / 307.0,  2.0 / 307.0,  4.0 / 307.0, 7.0 / 307.0, 4.0 / 307.0, 2.0 / 307.0,  1.0 / 307.0};
__kernel void A(__read_only image2d_t b, __write_only image2d_t c, sampler_t d, int e, int f) {
  int2 g = (int2)(get_global_id(0), get_global_id(1));
  float4 h = (float4)(0.0);
  for (int i = 0; i < 49; i++) {
    int2 j = (int2)(i7 - 3, i7 - 3);
    h += read_imagef(b, d, g + j) * a[i];
  }
  write_imagef(c, g, h);
}