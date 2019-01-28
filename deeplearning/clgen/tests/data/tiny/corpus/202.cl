__constant sampler_t a = 0x0000 | 0x0004 | 0x0000; __kernel void A(__read_only image2d_t b, __constant float* c, __write_only image2d_t d, __private unsigned char e) {
  const int2 f = {get_global_id(0), get_global_id(1)};
  const unsigned char g = (e - 1) / 2;

  float h = 0.0f;
  int i = get_image_channel_data_type(b);
  for (int j = -g; j <= g; j++) {
    for (int k = -g; k <= g; k++) {
      const int2 l = {j, k};
      if (i == 0x10DE) {
        h += c[j + g + (k + g) * e] * read_imagef(b, a, f + l).x;
      } else if (i == 0x10DA || i == 0x10DB) {
        h += c[j + g + (k + g) * e] * read_imageui(b, a, f + l).x;
      } else {
        h += c[j + g + (k + g) * e] * read_imagei(b, a, f + l).x;
      }
    }
  }

  int m = get_image_channel_data_type(d);
  if (m == 0x10DE) {
    write_imagef(d, f, h);
  } else if (m == 0x10DA || m == 0x10DB) {
    write_imageui(d, f, __clc_round(h));
  } else {
    write_imagei(d, f, __clc_round(h));
  }
}