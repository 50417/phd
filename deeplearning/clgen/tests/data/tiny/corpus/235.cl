const sampler_t a = 0x0000 | 0x0004 | 0x0000; float A(float4 b) {
  return 0.299f * b.x + 0.587f * b.y + 0.114f * b.z;
}

kernel void B(read_only image2d_t c, write_only image2d_t d, write_only image2d_t e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  float h = +1.0f * A(read_imagef(c, a, (int2)(f - 1, g - 1))) - 1.0f * A(read_imagef(c, a, (int2)(f + 1, g - 1))) + 2.0f * A(read_imagef(c, a, (int2)(f - 1, g))) - 2.0f * A(read_imagef(c, a, (int2)(f + 1, g))) + 1.0f * A(read_imagef(c, a, (int2)(f - 1, g + 1))) - 1.0f * A(read_imagef(c, a, (int2)(f + 1, g + 1)));

  float b = +1.0f * A(read_imagef(c, a, (int2)(f - 1, g - 1))) + 2.0f * A(read_imagef(c, a, (int2)(f, g - 1))) + 1.0f * A(read_imagef(c, a, (int2)(f + 1, g - 1))) - 1.0f * A(read_imagef(c, a, (int2)(f - 1, g + 1))) - 2.0f * A(read_imagef(c, a, (int2)(f, g + 1))) - 1.0f * A(read_imagef(c, a, (int2)(f + 1, g + 1)));

  write_imagef(d, (int2)(f, g), h);
  write_imagef(e, (int2)(f, g), b);
}

kernel void C(read_only image2d_t d, read_only image2d_t e, write_only image2d_t i, write_only image2d_t j, write_only image2d_t k, constant float* l, int m) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  float n = 0.0f;
  float o = 0.0f;
  float p = 0.0f;

  for (int q = -m; q <= m; q++) {
    float r = read_imagef(d, a, (int2)(f + q, g)).x;
    float s = read_imagef(e, a, (int2)(f + q, g)).x;

    n += l[q + m] * (r * r);
    o += l[q + m] * (r * s);
    p += l[q + m] * (s * s);
  }

  write_imagef(i, (int2)(f, g), (float4)(n));
  write_imagef(j, (int2)(f, g), (float4)(o));
  write_imagef(k, (int2)(f, g), (float4)(p));
}

kernel void D(read_only image2d_t i, read_only image2d_t j, read_only image2d_t k, write_only image2d_t t, constant float* l, int m, float u) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  float n = 0.0f;
  float o = 0.0f;
  float p = 0.0f;

  for (int q = -m; q <= m; q++) {
    n += l[q + m] * read_imagef(i, a, (int2)(f, g + q)).x;
    o += l[q + m] * read_imagef(j, a, (int2)(f, g + q)).x;
    p += l[q + m] * read_imagef(k, a, (int2)(f, g + q)).x;
  }

  float v = n * p - o * o;
  float w = n + p;

  const float x = 0.04f;

  float y = v - x * (w * w);

  write_imagef(t, (int2)(f, g), (y > u) ? (float4)(y) : (float4)(-0x1.fffffep127f));
}

kernel void E(read_only image2d_t t, write_only image2d_t z) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  float aa = read_imagef(t, a, (int2)(f, g)).x;

  bool ab = true;
  for (int ac = -1; ac <= 1; ac++)
    for (int ad = -1; ad <= 1; ad++)
      if (read_imagef(t, a, (int2)(f + ad, g + ac)).x > aa)
        ab = false;

  write_imagef(z, (int2)(f, g), (ab) ? 1.0f : 0.0f);
}