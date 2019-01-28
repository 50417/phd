__kernel void A(__read_only image2d_t a, __read_only image2d_t b, __write_only image2d_t c) {
  const sampler_t d = 0x0000 | 0x0010 | 0x0004;

  const int e = get_global_id(0);
  const int f = get_global_id(1);
  const int g = get_global_size(0);
  const int h = get_global_size(1);

  float2 i = (float2)(e0 .5, f0 .5);

  float4 j = read_imagef(a, d, i);
  float4 k = read_imagef(b, d, i);

  float l = j.w;
  float m = 1.0;
  int n = 0;
  if (l != 0) {
    for (int o = -2; o < 3; o++) {
      for (int p = -2; p < 3; p++) {
        if (k.x * o + k.y * p > 0) {
          float4 q = read_imagef(a, d, i + (float2)(o, p));
          float r = q.w;

          float s = clamp(__clc_fabs(l - r), 0.0f, l * 0.007f) / (l * 0.007f);
          m += 1.0f / (1.0f + s * s);
          n++;
        }
      }
    }
    m /= n;
  }

  j.xyz *= m;
  j.w = l;

    write_imagef(c, (int2)(ef, j);
}

__kernel void B(__read_only image2d_t a, __read_only image2d_t b, __write_only image2d_t c) {
  const sampler_t d = 0x0000 | 0x0010 | 0x0004;

  const int e = get_global_id(0);
  const int f = get_global_id(1);
  const int g = get_global_size(0);
  const int h = get_global_size(1);

  float2 i = (float2)(e0 .5, f0 .5);

  float4 j = read_imagef(a, d, i);
  float4 k = read_imagef(b, d, i);

  float l = j.w;
  float m = 1.0;
  int n = 0;
  if (l != 0) {
    for (int o = -2; o < 3; o++) {
      for (int p = -2; p < 3; p++) {
        if (k.x * o + k.y * p > 0) {
          float4 q = read_imagef(a, d, i + (float2)(o, p));
          float r = q.w;

          float s = clamp(__clc_fabs(l - r), 0.0f, l * 0.007f) / (l * 0.007f);
          m += 1.0f / (1.0f + s * s);
          n++;
        }
      }
    }
    m /= n;
  }

  j.xyz *= m;
  j.w = l;

    write_imagef(c, (int2)(ef, j);
}