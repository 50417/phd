__kernel void A(__global uchar4* a, const float b, const float c, const float d, const float e, const uint f, const int g, const int h) {
  int i = get_global_id(0);

  int j = i % (g / 4);
  int k = i / (g / 4);

  int4 l = {4 * j, 4 * j + 1, 4 * j + 2, 4 * j + 3};
  int4 m = {k, k, k, k};

  float4 n;
  n.s0 = (float)(b + d * (float)l.s0);
  n.s1 = (float)(b + d * (float)l.s1);
  n.s2 = (float)(b + d * (float)l.s2);
  n.s3 = (float)(b + d * (float)l.s3);
  float4 o;
  o.s0 = (float)(c + e * (float)m.s0);
  o.s1 = (float)(c + e * (float)m.s1);
  o.s2 = (float)(c + e * (float)m.s2);
  o.s3 = (float)(c + e * (float)m.s3);

  float4 p = n;
  float4 q = o;

  uint r = 0;
  float4 s;
  int4 t;
  int4 u = 0;

  t.s0 = (p.s0 * p.s0 + q.s0 * q.s0) <= 4.0f;
  t.s1 = (p.s1 * p.s1 + q.s1 * q.s1) <= 4.0f;
  t.s2 = (p.s2 * p.s2 + q.s2 * q.s2) <= 4.0f;
  t.s3 = (p.s3 * p.s3 + q.s3 * q.s3) <= 4.0f;
  float4 v = p;
  float4 w = q;
  for (r = 0; (t.s0 | t.s1 | t.s2 | t.s3) && (r < f); r += 16) {
    p = v;
    q = w;

    s = p * p + n - q * q;
    q = 2.0f * p * q + o;
    p = s * s + n - q * q;
    q = 2.0f * s * q + o;

    s = p * p + n - q * q;
    q = 2.0f * p * q + o;
    p = s * s + n - q * q;
    q = 2.0f * s * q + o;

    s = p * p + n - q * q;
    q = 2.0f * p * q + o;
    p = s * s + n - q * q;
    q = 2.0f * s * q + o;

    s = p * p + n - q * q;
    q = 2.0f * p * q + o;
    p = s * s + n - q * q;
    q = 2.0f * s * q + o;

    s = p * p + n - q * q;
    q = 2.0f * p * q + o;
    p = s * s + n - q * q;
    q = 2.0f * s * q + o;

    s = p * p + n - q * q;
    q = 2.0f * p * q + o;
    p = s * s + n - q * q;
    q = 2.0f * s * q + o;

    s = p * p + n - q * q;
    q = 2.0f * p * q + o;
    p = s * s + n - q * q;
    q = 2.0f * s * q + o;

    s = p * p + n - q * q;
    q = 2.0f * p * q + o;
    p = s * s + n - q * q;
    q = 2.0f * s * q + o;

    t.s0 = (p.s0 * p.s0 + q.s0 * q.s0) <= 4.0f;
    t.s1 = (p.s1 * p.s1 + q.s1 * q.s1) <= 4.0f;
    t.s2 = (p.s2 * p.s2 + q.s2 * q.s2) <= 4.0f;
    t.s3 = (p.s3 * p.s3 + q.s3 * q.s3) <= 4.0f;

    v.s0 = (t.s0 ? p.s0 : v.s0);
    v.s1 = (t.s1 ? p.s1 : v.s1);
    v.s2 = (t.s2 ? p.s2 : v.s2);
    v.s3 = (t.s3 ? p.s3 : v.s3);
    w.s0 = (t.s0 ? q.s0 : w.s0);
    w.s1 = (t.s1 ? q.s1 : w.s1);
    w.s2 = (t.s2 ? q.s2 : w.s2);
    w.s3 = (t.s3 ? q.s3 : w.s3);
    u += t * 16;
  }

  if (!(t.s0 & t.s1 & t.s2 & t.s3)) {
    r = 16;
    do {
      p = v;
      q = w;
      t.s0 = ((p.s0 * p.s0 + q.s0 * q.s0) <= 4.0f) && (u.s0 < f);
      t.s1 = ((p.s1 * p.s1 + q.s1 * q.s1) <= 4.0f) && (u.s1 < f);
      t.s2 = ((p.s2 * p.s2 + q.s2 * q.s2) <= 4.0f) && (u.s2 < f);
      t.s3 = ((p.s3 * p.s3 + q.s3 * q.s3) <= 4.0f) && (u.s3 < f);
      s = p;
      p = p * p + n - q * q;
      q = 2.0f * s * q + o;
      u += t;
      r--;
      v.s0 = (t.s0 ? p.s0 : v.s0);
      v.s1 = (t.s1 ? p.s1 : v.s1);
      v.s2 = (t.s2 ? p.s2 : v.s2);
      v.s3 = (t.s3 ? p.s3 : v.s3);
      w.s0 = (t.s0 ? q.s0 : w.s0);
      w.s1 = (t.s1 ? q.s1 : w.s1);
      w.s2 = (t.s2 ? q.s2 : w.s2);
      w.s3 = (t.s3 ? q.s3 : w.s3);
    } while ((t.s0 | t.s1 | t.s2 | t.s3) && r);
  }
  p = v;
  q = w;
  float4 x = convert_float4(u);
  x.s0 = (float)u.s0 + 1 - native_log2(native_log2(p.s0 * p.s0 + q.s0 * q.s0));
  x.s1 = (float)u.s1 + 1 - native_log2(native_log2(p.s1 * p.s1 + q.s1 * q.s1));
  x.s2 = (float)u.s2 + 1 - native_log2(native_log2(p.s2 * p.s2 + q.s2 * q.s2));
  x.s3 = (float)u.s3 + 1 - native_log2(native_log2(p.s3 * p.s3 + q.s3 * q.s3));

  float y = x.s0 * 2.0f * 3.1416f / 256.0f;
  uchar4 z[4];
  z[0].s0 = ((1.0f + cos(y)) * 0.5f) * 255;
  z[0].s1 = ((1.0f + cos(2.0f * y + 2.0f * 3.1416f / 3.0f)) * 0.5f) * 255;
  z[0].s2 = ((1.0f + cos(y - 2.0f * 3.1416f / 3.0f)) * 0.5f) * 255;
  z[0].s3 = 0xff;
  if (u.s0 == f) {
    z[0].s0 = 0;
    z[0].s1 = 0;
    z[0].s2 = 0;
  }
  if (h) {
    z[0].s0 = u.s0 & 0xff;
    z[0].s1 = (u.s0 & 0xff00) >> 8;
    z[0].s2 = (u.s0 & 0xff0000) >> 16;
    z[0].s3 = (u.s0 & 0xff000000) >> 24;
  }
  a[4 * i] = z[0];
  y = x.s1 * 2.0f * 3.1416f / 256.0f;
  z[1].s0 = ((1.0f + cos(y)) * 0.5f) * 255;
  z[1].s1 = ((1.0f + cos(2.0f * y + 2.0f * 3.1416f / 3.0f)) * 0.5f) * 255;
  z[1].s2 = ((1.0f + cos(y - 2.0f * 3.1416f / 3.0f)) * 0.5f) * 255;
  z[1].s3 = 0xff;
  if (u.s1 == f) {
    z[1].s0 = 0;
    z[1].s1 = 0;
    z[1].s2 = 0;
  }
  if (h) {
    z[1].s0 = u.s1 & 0xff;
    z[1].s1 = (u.s1 & 0xff00) >> 8;
    z[1].s2 = (u.s1 & 0xff0000) >> 16;
    z[1].s3 = (u.s1 & 0xff000000) >> 24;
  }
  a[4 * i + 1] = z[1];
  y = x.s2 * 2.0f * 3.1416f / 256.0f;
  z[2].s0 = ((1.0f + cos(y)) * 0.5f) * 255;
  z[2].s1 = ((1.0f + cos(2.0f * y + 2.0f * 3.1416f / 3.0f)) * 0.5f) * 255;
  z[2].s2 = ((1.0f + cos(y - 2.0f * 3.1416f / 3.0f)) * 0.5f) * 255;
  z[2].s3 = 0xff;
  if (u.s2 == f) {
    z[2].s0 = 0;
    z[2].s1 = 0;
    z[2].s2 = 0;
  }
  if (h) {
    z[2].s0 = u.s2 & 0xff;
    z[2].s1 = (u.s2 & 0xff00) >> 8;
    z[2].s2 = (u.s2 & 0xff0000) >> 16;
    z[2].s3 = (u.s2 & 0xff000000) >> 24;
  }
  a[4 * i + 2] = z[2];
  y = x.s3 * 2.0f * 3.1416f / 256.0f;
  z[3].s0 = ((1.0f + cos(y)) * 0.5f) * 255;
  z[3].s1 = ((1.0f + cos(2.0f * y + 2.0f * 3.1416f / 3.0f)) * 0.5f) * 255;
  z[3].s2 = ((1.0f + cos(y - 2.0f * 3.1416f / 3.0f)) * 0.5f) * 255;
  z[3].s3 = 0xff;
  if (u.s3 == f) {
    z[3].s0 = 0;
    z[3].s1 = 0;
    z[3].s2 = 0;
  }
  if (h) {
    z[3].s0 = u.s3 & 0xff;
    z[3].s1 = (u.s3 & 0xff00) >> 8;
    z[3].s2 = (u.s3 & 0xff0000) >> 16;
    z[3].s3 = (u.s3 & 0xff000000) >> 24;
  }
  a[4 * i + 3] = z[3];
}