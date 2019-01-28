constant int a = 1; constant int b = 180; constant float c = 0.01745329252f; __kernel void A(__read_only image2d_t d, __global uint* e, sampler_t f, int g, int h, int i, int j) {
  int k = g / 2;
  int2 l = (int2)(get_global_id(0), get_global_id(1));
  float2 m = (float2)(l(float) i2 .0f, l(float) j2 .0f);

  float n = read_imagef(d, f, l).x;

  if (n > 0.0f) {
    for (int o = 0; o < b; o += a) {
      float p = (float)o * c;

      int q = (int)(m.x * cos(p) + m.y * sin(p));

      if (abs(q) > 2 && q >= -k && q < k) {
        size_t r = o * g + q + k;
        atomic_add(&e[r], 1);
      }
    }
  }
}