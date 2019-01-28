__constant sampler_t a = 0x0000 | 0x0004 | 0x0000; __kernel void A(__read_only image2d_t b, __read_only image2d_t c, __write_only image2d_t d, uint e, uint f) {
  int2 g = (int2)(get_global_id(0), get_global_id(1));

  float4 h = (float4)(0);
  float4 i = (float4)(0);
  float4 j = (float4)(0);
  float4 k = (float4)(0);

  f /= 4;

  for (int l = 0; l < e; l = l + 4) {
    float4 m = read_imagef(b, a, (int2)(l / 4, g << 2));
    float4 n = read_imagef(b, a, (int2)(l / 4, (g << 2) + 1));
    float4 o = read_imagef(b, a, (int2)(l / 4, (g << 2) + 2));
    float4 p = read_imagef(b, a, (int2)(l / 4, (g << 2) + 3));

    float4 q = read_imagef(c, a, (int2)(g, l));
    float4 r = read_imagef(c, a, (int2)(g, l + 1));
    float4 s = read_imagef(c, a, (int2)(g, l + 2));
    float4 t = read_imagef(c, a, (int2)(g, l + 3));

    h.x += m.x * q.x + m.y * r.x + m.z * s.x + m.w * t.x;
    h.y += m.x * q.y + m.y * r.y + m.z * s.y + m.w * t.y;
    h.z += m.x * q.z + m.y * r.z + m.z * s.z + m.w * t.z;
    h.w += m.x * q.w + m.y * r.w + m.z * s.w + m.w * t.w;

    i.x += n.x * q.x + n.y * r.x + n.z * s.x + n.w * t.x;
    i.y += n.x * q.y + n.y * r.y + n.z * s.y + n.w * t.y;
    i.z += n.x * q.z + n.y * r.z + n.z * s.z + n.w * t.z;
    i.w += n.x * q.w + n.y * r.w + n.z * s.w + n.w * t.w;

    j.x += o.x * q.x + o.y * r.x + o.z * s.x + o.w * t.x;
    j.y += o.x * q.y + o.y * r.y + o.z * s.y + o.w * t.y;
    j.z += o.x * q.z + o.y * r.z + o.z * s.z + o.w * t.z;
    j.w += o.x * q.w + o.y * r.w + o.z * s.w + o.w * t.w;

    k.x += p.x * q.x + p.y * r.x + p.z * s.x + p.w * t.x;
    k.y += p.x * q.y + p.y * r.y + p.z * s.y + p.w * t.y;
    k.z += p.x * q.z + p.y * r.z + p.z * s.z + p.w * t.z;
    k.w += p.x * q.w + p.y * r.w + p.z * s.w + p.w * t.w;
  }
  write_imagef(d, (int2)(g, g * 4), h);
  write_imagef(d, (int2)(g, g * 4 + 1), i);
  write_imagef(d, (int2)(g, g * 4 + 2), j);
  write_imagef(d, (int2)(g, g * 4 + 3), k);
}
__kernel void B(__read_only image2d_t b, __read_only image2d_t c, __write_only image2d_t d, uint e, uint f) {
  int2 g = (int2)(get_global_id(0), get_global_id(1));

  float4 h = (float4)(0);
  float4 i = (float4)(0);
  float4 j = (float4)(0);
  float4 k = (float4)(0);
  float4 u = (float4)(0);
  float4 v = (float4)(0);
  float4 w = (float4)(0);
  float4 x = (float4)(0);

  f = f >> 2;

  for (int l = 0; l < e; l = l + 4) {
    float4 m = read_imagef(b, a, (int2)(l >> 2, g << 3));
    float4 n = read_imagef(b, a, (int2)(l >> 2, (g << 3) + 1));
    float4 o = read_imagef(b, a, (int2)(l >> 2, (g << 3) + 2));
    float4 p = read_imagef(b, a, (int2)(l >> 2, (g << 3) + 3));
    float4 y = read_imagef(b, a, (int2)(l >> 2, (g << 3) + 4));
    float4 z = read_imagef(b, a, (int2)(l >> 2, (g << 3) + 5));
    float4 aa = read_imagef(b, a, (int2)(l >> 2, (g << 3) + 6));
    float4 ab = read_imagef(b, a, (int2)(l >> 2, (g << 3) + 7));

    float4 q = read_imagef(c, a, (int2)(g, l));
    float4 r = read_imagef(c, a, (int2)(g, l + 1));
    float4 s = read_imagef(c, a, (int2)(g, l + 2));
    float4 t = read_imagef(c, a, (int2)(g, l + 3));

    h.x += m.x * q.x + m.y * r.x + m.z * s.x + m.w * t.x;
    h.y += m.x * q.y + m.y * r.y + m.z * s.y + m.w * t.y;
    h.z += m.x * q.z + m.y * r.z + m.z * s.z + m.w * t.z;
    h.w += m.x * q.w + m.y * r.w + m.z * s.w + m.w * t.w;

    i.x += n.x * q.x + n.y * r.x + n.z * s.x + n.w * t.x;
    i.y += n.x * q.y + n.y * r.y + n.z * s.y + n.w * t.y;
    i.z += n.x * q.z + n.y * r.z + n.z * s.z + n.w * t.z;
    i.w += n.x * q.w + n.y * r.w + n.z * s.w + n.w * t.w;

    j.x += o.x * q.x + o.y * r.x + o.z * s.x + o.w * t.x;
    j.y += o.x * q.y + o.y * r.y + o.z * s.y + o.w * t.y;
    j.z += o.x * q.z + o.y * r.z + o.z * s.z + o.w * t.z;
    j.w += o.x * q.w + o.y * r.w + o.z * s.w + o.w * t.w;

    k.x += p.x * q.x + p.y * r.x + p.z * s.x + p.w * t.x;
    k.y += p.x * q.y + p.y * r.y + p.z * s.y + p.w * t.y;
    k.z += p.x * q.z + p.y * r.z + p.z * s.z + p.w * t.z;
    k.w += p.x * q.w + p.y * r.w + p.z * s.w + p.w * t.w;

    u.x += y.x * q.x + y.y * r.x + y.z * s.x + y.w * t.x;
    u.y += y.x * q.y + y.y * r.y + y.z * s.y + y.w * t.y;
    u.z += y.x * q.z + y.y * r.z + y.z * s.z + y.w * t.z;
    u.w += y.x * q.w + y.y * r.w + y.z * s.w + y.w * t.w;

    v.x += z.x * q.x + z.y * r.x + z.z * s.x + z.w * t.x;
    v.y += z.x * q.y + z.y * r.y + z.z * s.y + z.w * t.y;
    v.z += z.x * q.z + z.y * r.z + z.z * s.z + z.w * t.z;
    v.w += z.x * q.w + z.y * r.w + z.z * s.w + z.w * t.w;

    w.x += aa.x * q.x + aa.y * r.x + aa.z * s.x + aa.w * t.x;
    w.y += aa.x * q.y + aa.y * r.y + aa.z * s.y + aa.w * t.y;
    w.z += aa.x * q.z + aa.y * r.z + aa.z * s.z + aa.w * t.z;
    w.w += aa.x * q.w + aa.y * r.w + aa.z * s.w + aa.w * t.w;

    x.x += ab.x * q.x + ab.y * r.x + ab.z * s.x + ab.w * t.x;
    x.y += ab.x * q.y + ab.y * r.y + ab.z * s.y + ab.w * t.y;
    x.z += ab.x * q.z + ab.y * r.z + ab.z * s.z + ab.w * t.z;
    x.w += ab.x * q.w + ab.y * r.w + ab.z * s.w + ab.w * t.w;
  }
  write_imagef(d, (int2)(g, g * 8), h);
  write_imagef(d, (int2)(g, g * 8 + 1), i);
  write_imagef(d, (int2)(g, g * 8 + 2), j);
  write_imagef(d, (int2)(g, g * 8 + 3), k);
  write_imagef(d, (int2)(g, g * 8 + 4), u);
  write_imagef(d, (int2)(g, g * 8 + 5), v);
  write_imagef(d, (int2)(g, g * 8 + 6), w);
  write_imagef(d, (int2)(g, g * 8 + 7), x);
}
float4 C(float4 ac, float4 ad, float4 ae, float4 af, float4 ag, float4 ah) {
  float4 ai = mad((float4)ac.x, ad, ah);
  ai = mad((float4)ac.y, ae, ai);
  ai = mad((float4)ac.z, af, ai);
  ai = mad((float4)ac.w, ag, ai);
  return ai;
}
float4 D(float4 ac, float4 ad, float4 ae, float4 af, float4 ag) {
  float4 ai = (float4)ac.x * ad;
  ai = mad((float4)ac.y, ae, ai);
  ai = mad((float4)ac.z, af, ai);
  ai = mad((float4)ac.w, ag, ai);
  return ai;
}

__kernel void E(__read_only image2d_t b, __read_only image2d_t c, __write_only image2d_t d, uint e, uint f) {
  int2 g = (int2)(get_global_id(0), get_global_id(1));

  float4 h;
  float4 i;
  float4 j;
  float4 k;
  float4 u;
  float4 v;
  float4 w;
  float4 x;

  f = f >> 2;

  int8 aj = (int8)(0, 1, 2, 3, 4, 5, 6, 7);
  int4 ak = (int4)(0, 1, 2, 3);
  int al = g.x;
  int am = g.y;
  int8 an = (int8)(am << 3) + aj;
  int ao = 0;
  int ap = 0;
  int4 aq = ak;

  float4 m = read_imagef(b, a, (int2)(0, ans0));
  float4 n = read_imagef(b, a, (int2)(0, ans1));
  float4 o = read_imagef(b, a, (int2)(0, ans2));
  float4 p = read_imagef(b, a, (int2)(0, ans3));
  float4 y = read_imagef(b, a, (int2)(0, ans4));
  float4 z = read_imagef(b, a, (int2)(0, ans5));
  float4 aa = read_imagef(b, a, (int2)(0, ans6));
  float4 ab = read_imagef(b, a, (int2)(0, ans7));
  float4 q = read_imagef(c, a, (int2)(g, 0));
  float4 r = read_imagef(c, a, (int2)(g, 1));
  float4 s = read_imagef(c, a, (int2)(g, 2));
  float4 t = read_imagef(c, a, (int2)(g, 3));
  h = D(m, q, r, s, t);
  i = D(n, q, r, s, t);
  j = D(o, q, r, s, t);
  k = D(p, q, r, s, t);
  u = D(y, q, r, s, t);
  v = D(z, q, r, s, t);
  w = D(aa, q, r, s, t);
  x = D(ab, q, r, s, t);
  for (int l = 4; l < e; l = l + 4) {
    int ap = l >> 2;
    int4 aq = (int4)(l) + ak;
    m = read_imagef(b, a, (int2)(ap ans0));
    n = read_imagef(b, a, (int2)(ap ans1));
    o = read_imagef(b, a, (int2)(ap ans2));
    p = read_imagef(b, a, (int2)(ap ans3));
    q = read_imagef(c, a, (int2)(g, aq0));
    r = read_imagef(c, a, (int2)(g, aq1));
    s = read_imagef(c, a, (int2)(g, aq2));
    t = read_imagef(c, a, (int2)(g, aq3));
    y = read_imagef(b, a, (int2)(ap ans4));
    z = read_imagef(b, a, (int2)(ap ans5));
    aa = read_imagef(b, a, (int2)(ap ans6));
    ab = read_imagef(b, a, (int2)(ap ans7));
    h = C(m, q, r, s, t, h);
    i = C(n, q, r, s, t, i);
    j = C(o, q, r, s, t, j);
    k = C(p, q, r, s, t, k);
    u = C(y, q, r, s, t, u);
    v = C(z, q, r, s, t, v);
    w = C(aa, q, r, s, t, w);
    x = C(ab, q, r, s, t, x);
  }
  am = g.y * 8;
  int8 ar = (int8)(am) + aj;
  write_imagef(d, (int2)(g, ar), h);
  write_imagef(d, (int2)(g, ar), i);
  write_imagef(d, (int2)(g, ar), j);
  write_imagef(d, (int2)(g, ar), k);
  write_imagef(d, (int2)(g, ar), u);
  write_imagef(d, (int2)(g, ar), v);
  write_imagef(d, (int2)(g, ar), w);
  write_imagef(d, (int2)(g, ar), x);
}