__kernel void A(__global uint* a, __global uint* b, __global uint* c, __global uint* d, uint e, __global uint* f, __global uint* g, uint h) {
  int i = get_global_id(0);
  int j = get_local_id(0);
  int k = get_num_groups(0);
  int l = get_group_id(0);

  __local uint m[256];
  __local uint n[256];

  m[j] = 0xFFFFFFFF;
  n[j] = 0xFFFFFFFF;
  if (i < h) {
    m[j] = a[i];
    n[j] = c[i];
  }
  barrier(1);

  __local uint o[256];
  for (uint p = e; p < (e + 4); p++) {
    uint q = m[j];
    uint r = n[j];
    uint s = !((q >> p) & 0x1);
    o[j] = s;
    barrier(1);
    if (j == 256 - 1) {
      for (int t = 1; t < 256; t++) {
        o[t] += o[t - 1];
      }
    }
    barrier(1);
    uint u = s ? o[j] - 1 : o[256 - 1] - o[j] + j;
    m[u] = q;
    n[u] = r;
    barrier(1);
  }

  if (i < h) {
    b[i] = m[j];
    d[i] = n[j];
  }
  barrier(1);

  __local uint v[(1 << 4)];
  if (j < (1 << 4)) {
    v[j] = 0;
  }
  m[j] = (m[j] >> e) & 0xF;
  barrier(1);

  if (j > 0 && m[j] != m[j - 1]) {
    v[m[j]] = j;
  }
  barrier(1);

  if (j < (1 << 4)) {
    g[l * (1 << 4) + j] = v[j];
  }
  barrier(1);

  if (j > 0 && m[j] != m[j - 1]) {
    v[m[j - 1]] = j - v[m[j - 1]];
  }
  barrier(1);

  if (j == 256 - 1) {
    v[m[256 - 1]] = 256 - v[m[256 - 1]];
  }
  barrier(1);

  if (j < (1 << 4)) {
    f[j * k + l] = v[j];
  }
}

__kernel void B(__global uint4* f, __global uint* w, uint h) {
  int i = get_global_id(0);
  int j = get_local_id(0);
  int l = get_group_id(0);

  uint4 x = 0;
  if (i < h) {
    x = f[i];
  }

  __local uint o[256];

  uint4 y;
  y.x = x.x;
  y.y = y.x + x.y;
  y.z = y.y + x.z;
  y.w = y.z + x.w;
  o[j] = y.w;
  barrier(1);

  if (j == 256 - 1) {
    for (int t = 1; t < 256; t++) {
      o[t] += o[t - 1];
    }
  }
  barrier(1);

  uint z = o[j] - y.w;
  if (i < h) {
    uint4 aa;
    aa.x = z;
    aa.y = z + y.x;
    aa.z = z + y.y;
    aa.w = z + y.z;
    f[i] = aa;
  }
  barrier(1);

  if (j == 256 - 1) {
    w[l] = z + y.w;
  }
}

__kernel void C(__global uint4* f, __global uint* ab, uint h) {
  int i = get_global_id(0);
  int j = get_local_id(0);
  int l = get_group_id(0);

  __local uint o[256];

  o[j] = ab[j];
  barrier(1);

  if (j == 256 - 1) {
    for (int t = 1; t < 256; t++) {
      o[t] += o[t - 1];
    }
  }
  barrier(1);

  if (l > 0 && i < h) {
    f[i] = f[i] + o[l - 1];
  }
}

__kernel void D(__global uint* a, __global uint* b, __global uint* c, __global uint* d, __global uint* f, __global uint* ac, uint e, uint h) {
  int i = get_global_id(0);
  int j = get_local_id(0);
  int l = get_group_id(0);
  int k = get_num_groups(0);

  __local uint g[(1 << 4)];
  __local uint ad[(1 << 4)];

  if (j < (1 << 4)) {
    ad[j] = f[j * k + l];
    g[j] = ac[l * (1 << 4) + j];
  }
  barrier(1);

  if (i >= h) {
    return;
  }

  uint m = a[i];
  uint n = c[i];
  uint ae = (m >> e) & 0xF;
  uint af = ad[ae] + j - g[ae];

  b[af] = m;
  d[af] = n;
}