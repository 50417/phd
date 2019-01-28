inline void A(uint* a, uint* b, uint* c, uint* d, uint e) {
  if ((*a > *c) == e) {
    uint f;
    f = *a;
    *a = *c;
    *c = f;
    f = *b;
    *b = *d;
    *d = f;
  }
}

inline void B(__local uint* a, __local uint* b, __local uint* c, __local uint* d, uint e) {
  if ((*a > *c) == e) {
    uint f;
    f = *a;
    *a = *c;
    *c = f;
    f = *b;
    *b = *d;
    *d = f;
  }
}

__kernel void C(__global uint* g, __global uint* h, __global uint* i, __global uint* j, uint k, uint e) {
  __local uint l[512U];
  __local uint m[512U];

  i += get_group_id(0) * 512U + get_local_id(0);
  j += get_group_id(0) * 512U + get_local_id(0);
  g += get_group_id(0) * 512U + get_local_id(0);
  h += get_group_id(0) * 512U + get_local_id(0);
  l[get_local_id(0) + 0] = i[0];
  m[get_local_id(0) + 0] = j[0];
  l[get_local_id(0) + (512U / 2)] = i[(512U / 2)];
  m[get_local_id(0) + (512U / 2)] = j[(512U / 2)];

  for (uint n = 2; n < k; n <<= 1) {
    uint o = e ^ ((get_local_id(0) & (n / 2)) != 0);
    for (uint p = n / 2; p > 0; p >>= 1) {
      barrier(1);
      uint q = 2 * get_local_id(0) - (get_local_id(0) & (p - 1));
      B(&l[q + 0], &m[q + 0], &l[q + p], &m[q + p], o);
    }
  }

  {
    for (uint p = k / 2; p > 0; p >>= 1) {
      barrier(1);
      uint q = 2 * get_local_id(0) - (get_local_id(0) & (p - 1));
      B(&l[q + 0], &m[q + 0], &l[q + p], &m[q + p], e);
    }
  }

  barrier(1);
  g[0] = l[get_local_id(0) + 0];
  h[0] = m[get_local_id(0) + 0];
  g[(512U / 2)] = l[get_local_id(0) + (512U / 2)];
  h[(512U / 2)] = m[get_local_id(0) + (512U / 2)];
}
__kernel void D(__global uint* g, __global uint* h, __global uint* i, __global uint* j) {
  __local uint l[512U];
  __local uint m[512U];

  i += get_group_id(0) * 512U + get_local_id(0);
  j += get_group_id(0) * 512U + get_local_id(0);
  g += get_group_id(0) * 512U + get_local_id(0);
  h += get_group_id(0) * 512U + get_local_id(0);
  l[get_local_id(0) + 0] = i[0];
  m[get_local_id(0) + 0] = j[0];
  l[get_local_id(0) + (512U / 2)] = i[(512U / 2)];
  m[get_local_id(0) + (512U / 2)] = j[(512U / 2)];

  uint r = get_global_id(0) & ((512U / 2) - 1);

  for (uint n = 2; n < 512U; n <<= 1) {
    uint o = (r & (n / 2)) != 0;
    for (uint p = n / 2; p > 0; p >>= 1) {
      barrier(1);
      uint q = 2 * get_local_id(0) - (get_local_id(0) & (p - 1));
      B(&l[q + 0], &m[q + 0], &l[q + p], &m[q + p], o);
    }
  }

  {
    uint o = (get_group_id(0) & 1);
    for (uint p = 512U / 2; p > 0; p >>= 1) {
      barrier(1);
      uint q = 2 * get_local_id(0) - (get_local_id(0) & (p - 1));
      B(&l[q + 0], &m[q + 0], &l[q + p], &m[q + p], o);
    }
  }

  barrier(1);
  g[0] = l[get_local_id(0) + 0];
  h[0] = m[get_local_id(0) + 0];
  g[(512U / 2)] = l[get_local_id(0) + (512U / 2)];
  h[(512U / 2)] = m[get_local_id(0) + (512U / 2)];
}

__kernel void E(__global uint* g, __global uint* h, __global uint* i, __global uint* j, uint k, uint n, uint p, uint e) {
  uint s = get_global_id(0);
  uint r = s & (k / 2 - 1);

  uint o = e ^ ((r & (n / 2)) != 0);
  uint q = 2 * s - (s & (p - 1));

  uint a = i[q + 0];
  uint b = j[q + 0];
  uint c = i[q + p];
  uint d = j[q + p];

  A(&a, &b, &c, &d, o);

  g[q + 0] = a;
  h[q + 0] = b;
  g[q + p] = c;
  h[q + p] = d;
}

__kernel void F(__global uint* g, __global uint* h, __global uint* i, __global uint* j, uint k, uint p, uint n, uint e) {
  __local uint l[512U];
  __local uint m[512U];

  i += get_group_id(0) * 512U + get_local_id(0);
  j += get_group_id(0) * 512U + get_local_id(0);
  g += get_group_id(0) * 512U + get_local_id(0);
  h += get_group_id(0) * 512U + get_local_id(0);
  l[get_local_id(0) + 0] = i[0];
  m[get_local_id(0) + 0] = j[0];
  l[get_local_id(0) + (512U / 2)] = i[(512U / 2)];
  m[get_local_id(0) + (512U / 2)] = j[(512U / 2)];

  uint r = get_global_id(0) & ((k / 2) - 1);
  uint o = e ^ ((r & (n / 2)) != 0);
  for (; p > 0; p >>= 1) {
    barrier(1);
    uint q = 2 * get_local_id(0) - (get_local_id(0) & (p - 1));
    B(&l[q + 0], &m[q + 0], &l[q + p], &m[q + p], o);
  }

  barrier(1);
  g[0] = l[get_local_id(0) + 0];
  h[0] = m[get_local_id(0) + 0];
  g[(512U / 2)] = l[get_local_id(0) + (512U / 2)];
  h[(512U / 2)] = m[get_local_id(0) + (512U / 2)];
}