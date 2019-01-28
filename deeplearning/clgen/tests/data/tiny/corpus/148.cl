typedef unsigned int u32; u32 A(__local u32* a, u32 b, int c, int d) {
  u32 e;
  int f = 1;
  for (int g = b >> 1; g > 0; g >>= 1, f <<= 1) {
    barrier(1);
    for (int h = c; h < g; h += d) {
      int i = f * (2 * h + 1) - 1;
      int j = f * (2 * h + 2) - 1;
      a[j] += a[i];
    }
  }

  barrier(1);

  if (c == 0) {
    e = a[b - 1];
    a[b - 1] = 0;
  }

  barrier(1);

  f >>= 1;
  for (int g = 1; g < b; g <<= 1, f >>= 1) {
    barrier(1);
    for (int h = c; h < g; h += d) {
      int i = f * (2 * h + 1) - 1;
      int j = f * (2 * h + 2) - 1;
      u32 k = a[i];
      a[i] = a[j];
      a[j] += k;
    }
  }
  barrier(1);

  return e;
}

__kernel void B(__global u32* l, __global u32* m, __global u32* n, uint4 o) {
  __local u32 p[128 * 2];

  int q = get_global_id(0);
  int c = get_local_id(0);

  p[2 * c] = (2 * q < o.x) ? m[2 * q] : 0;
  p[2 * c + 1] = (2 * q + 1 < o.x) ? m[2 * q + 1] : 0;

  u32 r = A(p, 128 * 2, get_local_id(0), get_local_size(0));

  if (c == 0)
    n[get_group_id(0)] = r;

  if ((2 * q) < o.x) {
    l[2 * q] = p[2 * c];
  }
  if ((2 * q + 1) < o.x) {
    l[2 * q + 1] = p[2 * c + 1];
  }
}

__kernel void C(__global u32* l, __global u32* s, uint4 o) {
  const u32 t = 128 * 2;

  int u = get_group_id(0) + 1;
  int c = get_local_id(0);

  u32 v = s[u];

  int w = min((u + 1) * (t), o.x);
  for (int x = u * t + c; x < w; x += get_local_size(0)) {
    l[x] += v;
  }
}

__kernel void D(__global u32* l, uint4 o) {
  __local u32 p[2048];
  int q = get_global_id(0);
  int c = get_local_id(0);
  int d = get_local_size(0);

  for (int x = c; x < o.z; x += d) {
    p[x] = (x < o.y) ? l[x] : 0;
  }

  barrier(1);

  u32 r = A(p, o.z, get_local_id(0), get_local_size(0));

  for (int x = c; x < o.y; x += d) {
    l[x] = p[x];
  }

  if (q == 0) {
    l[o.y] = r;
  }
}