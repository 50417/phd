__constant sampler_t a = 0x0000 | 0x0002 | 0x0000; __kernel void A(__read_only image2d_t b, __constant float* c, __global float* d, __private int e) {
  const int2 f = {get_global_id(0), get_global_id(1)};

  float g = 0.0f;

  for (int h = -e; h < e + 1; h++) {
    for (int i = -e; i < e + 1; i++) {
      g += c[h + e + (i + e) * (e * 2 + 1)] * read_imagef(b, a, f + (int2)(h, i)).x;
    }
  }

  d[f.x + f.y * get_global_size(0)] = g;
}