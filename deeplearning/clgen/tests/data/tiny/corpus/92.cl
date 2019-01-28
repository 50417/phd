__kernel void A(__read_only image2d_t a, __write_only image2d_t b, __constant float* c, int d, int e) {
  int2 f = (int2)(get_global_id(0), get_global_id(1));
  const sampler_t g = 0x0000 | 0x0002 | 0x0000;

  int h = __clc_floor((float)d / 2.0f);
  int i = __clc_floor((float)e / 2.0f);
  int j = 0;
  float4 k = (0, 0, 0, 0);
  for (int l = -i; l <= i; l++) {
    for (int m = -h; m <= h; m++) {
      float4 n = read_imagef(a, g, (int2)(fm, fl));
      float o = c[j];
      float4 p = sqrt(n * o);
      k = max(k, p);
      j++;
    }
  }
  write_imagef(b, f, k);
}