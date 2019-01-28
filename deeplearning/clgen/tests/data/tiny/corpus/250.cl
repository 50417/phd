uint A(uint a, volatile __local uint* b, int c) {
  int d = get_local_id(0);
  int e = 2 * d - (d & (32 - 1));
  b[e] = 0;
  e += 32;
  b[e] = a;

  if (0 <= c) {
    b[e] += b[e - 1];
  }
  if (1 <= c) {
    b[e] += b[e - 2];
  }
  if (2 <= c) {
    b[e] += b[e - 4];
  }
  if (3 <= c) {
    b[e] += b[e - 8];
  }
  if (4 <= c) {
    b[e] += b[e - 16];
  }

  return b[e] - a;
}

uint4 B(uint4 f, __local uint* g) {
  uint e = get_local_id(0);

  uint4 h = f;
  uint i[3];
  i[0] = h.x;
  i[1] = h.y + i[0];
  i[2] = h.z + i[1];

  uint a = h.w + i[2];

  a = A(a, g, 4);
  barrier(1);

  if ((e & (32 - 1)) == 32 - 1) {
    g[e >> 5] = a + h.w + i[2];
  }
  barrier(1);

  if (e < 32)
    g[e] = A(g[e], g, 2);

  barrier(1);

  a += g[e >> 5];

  h.x = a;
  h.y = a + i[0];
  h.z = a + i[1];
  h.w = a + i[2];

  return h;
}

uint4 C(uint4 j, __local uint* k, __local uint* l)

{
  int d = get_local_id(0);
  int m = get_local_size(0);

  uint4 n = B(j, k);

  if (d == m - 1) {
    l[0] = n.w + j.w;
  }
  barrier(1);

  uint4 o;
  int e = d * 4;
  o.x = (j.x) ? n.x : l[0] + e - n.x;
  o.y = (j.y) ? n.y : l[0] + e + 1 - n.y;
  o.z = (j.z) ? n.z : l[0] + e + 2 - n.z;
  o.w = (j.w) ? n.w : l[0] + e + 3 - n.w;

  return o;
}

void D(uint4* p, uint q, uint r, __local uint* k, __local uint* l) {
  int d = get_local_id(0);
  int m = get_local_size(0);

  for (uint s = r; s < (r + q); ++s) {
    uint4 t;
    t.x = !(((*p).x >> s) & 0x1);
    t.y = !(((*p).y >> s) & 0x1);
    t.z = !(((*p).z >> s) & 0x1);
    t.w = !(((*p).w >> s) & 0x1);

    uint4 u;

    u = C(t, k, l);

    k[(u.x & 3) * m + (u.x >> 2)] = (*p).x;
    k[(u.y & 3) * m + (u.y >> 2)] = (*p).y;
    k[(u.z & 3) * m + (u.z >> 2)] = (*p).z;
    k[(u.w & 3) * m + (u.w >> 2)] = (*p).w;
    barrier(1);

    (*p).x = k[d];
    (*p).y = k[d + m];
    (*p).z = k[d + 2 * m];
    (*p).w = k[d + 3 * m];

    barrier(1);
  }
}

__kernel void E(__global uint4* v, __global uint4* w, uint q, uint r, uint x, uint y, __local uint* k) {
  int z = get_global_id(0);
  __local uint l[1];

  uint4 p;
  p = v[z];

  barrier(1);

  D(&p, q, r, k, l);

  w[z] = p;
}
__kernel void F(__global uint2* aa, __global uint* ab, __global uint* ac, uint r, uint x, uint y, __local uint* ad) {
  __local uint ae[16];

  uint af = get_group_id(0);
  uint d = get_local_id(0);
  uint ag = get_local_size(0);

  uint2 ah;

  ah = aa[get_global_id(0)];

  ad[2 * d] = (ah.x >> r) & 0xF;
  ad[2 * d + 1] = (ah.y >> r) & 0xF;

  if (d < 16) {
    ae[d] = 0;
  }
  barrier(1);

  if ((d > 0) && (ad[d] != ad[d - 1])) {
    ae[ad[d]] = d;
  }
  if (ad[d + ag] != ad[d + ag - 1]) {
    ae[ad[d + ag]] = d + ag;
  }
  barrier(1);

  if (d < 16) {
    ac[af * 16 + d] = ae[d];
  }
  barrier(1);

  if ((d > 0) && (ad[d] != ad[d - 1])) {
    ae[ad[d - 1]] = d - ae[ad[d - 1]];
  }
  if (ad[d + ag] != ad[d + ag - 1]) {
    ae[ad[d + ag - 1]] = d + ag - ae[ad[d + ag - 1]];
  }

  if (d == ag - 1) {
    ae[ad[2 * ag - 1]] = 2 * ag - ae[ad[2 * ag - 1]];
  }
  barrier(1);

  if (d < 16) {
    ab[d * y + af] = ae[d];
  }
}

__kernel void G(__global uint* ai, __global uint* aj, uint ak, __local uint* al) {
  int d = get_local_id(0);

  int am = 0;
  int an = 1;

  al[am * ak + d] = (d > 0) ? aj[d - 1] : 0;

  for (int ao = 1; ao < ak; ao *= 2) {
    am = 1 - am;
    an = 1 - am;
    barrier(1);

    al[am * ak + d] = al[an * ak + d];

    if (d >= ao)
      al[am * ak + d] += al[an * ak + d - ao];
  }

  barrier(1);

  ai[d] = al[am * ak + d];
}
__kernel void H(__global uint* ap, __global uint2* aa, __global uint* ac, __global uint* aq, __global uint* ar, uint r, uint x, uint y, __local uint2* as) {
  __local uint at[16];
  __local uint au[16];

  __local uint* av = (__local uint*)as;

  uint af = get_group_id(0);

  uint z = get_global_id(0);
  uint d = get_local_id(0);
  uint ag = get_local_size(0);

  as[d] = aa[z];

  if (d < 16) {
    at[d] = aq[d * y + af];
    au[d] = ac[af * 16 + d];
  }
  barrier(1);

  uint aw = (av[d] >> r) & 0xF;
  uint ax = at[aw] + d - au[aw];

  if (ax < x) {
    ap[ax] = av[d];
  }

  aw = (av[d + ag] >> r) & 0xF;
  ax = at[aw] + d + ag - au[aw];

  if (ax < x) {
    ap[ax] = av[d + ag];
  }
}