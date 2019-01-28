constant float a[25] = {1.0f / 90.0f, 2.0f / 90.0f, 4.0f / 90.0f, 2.0f / 90.0f, 1.0f / 90.0f, 2.0f / 90.0f, 4.0f / 90.0f, 7.0f / 90.0f, 4.0f / 90.0f, 2.0f / 90.0f, 4.0f / 90.0f, 7.0f / 90.0f, 10.0f / 90.0f, 7.0f / 90.0f, 4.0f / 90.0f, 2.0f / 90.0f, 4.0f / 90.0f, 7.0f / 90.0f, 4.0f / 90.0f, 2.0f / 90.0f, 1.0f / 90.0f, 2.0f / 90.0f, 4.0f / 90.0f, 2.0f / 90.0f, 1.0f / 90.0f};

__kernel void A(__read_only image2d_t b, __write_only image2d_t c, sampler_t d, int e, int f) {
  int2 g = (int2)(get_global_id(0), get_global_id(1));

  float4 h = (float4)(0.0);

  for (int i = 0; i < 25; i++) {
    int2 j = (int2)(i5 - 2, i5 - 2);

    h += read_imagef(b, d, g + j) * a[i];
  }

  write_imagef(c, g, h);
}