__kernel void A(__read_only image2d_t a, __write_only image2d_t b, sampler_t c, int d, int e) {
  float f[9] = {1.0f, 2.0f, 1.0f, 2.0f, 4.0f, 2.0f, 1.0f, 2.0f, 1.0f};
  int2 g = (int2)(get_global_id(0) - 1, get_global_id(1) - 1);
  int2 h = (int2)(get_global_id(0) + 1, get_global_id(1) + 1);
  int2 i = (int2)(get_global_id(0), get_global_id(1));
  if (i.x < d && i.y < e) {
    int j = 0;
    float4 k = (float4)(1.0f, 0.0f, 0.0f, 0.0f);
    for (int l = g.y; l <= h.y; l++) {
      for (int m = g.x; m <= h.x; m++) {
        k += (read_imagef(a, c, (int2)(m, l)) * (f[j] / 16.0f));
        j += 1;

        write_imagef(b, i, k);
      }
    }
  }
}