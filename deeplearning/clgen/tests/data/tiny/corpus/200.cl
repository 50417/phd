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

__kernel void C(__global uint* g, __global uint* h, __global uint* i, __global uint* j, uint k, uint l) {
  __local uint m[1024];
  __local uint n[1024];

  i += get_group_id(0) * 1024 + get_local_id(0);
  j += get_group_id(0) * 1024 + get_local_id(0);
  g += get_group_id(0) * 1024 + get_local_id(0);
  h += get_group_id(0) * 1024 + get_local_id(0);
  m[get_local_id(0) + 0] = i[0];
  n[get_local_id(0) + 0] = j[0];
  m[get_local_id(0) + (1024 / 2)] = i[(1024 / 2)];
  n[get_local_id(0) + (1024 / 2)] = j[(1024 / 2)];

  for (uint o = 2; o < k; o <<= 1) {
    uint p = ((get_local_id(0) & (o / 2)) != 0);
    for (uint q = o / 2; q > 0; q >>= 1) {
      barrier(1);
      uint r = 2 * get_local_id(0) - (get_local_id(0) & (q - 1));
      B(&m[r + 0], &n[r + 0], &m[r + q], &n[r + q], p);
    }
  }

  {
    for (uint q = k / 2; q > 0; q >>= 1) {
      barrier(1);
      uint r = 2 * get_local_id(0) - (get_local_id(0) & (q - 1));
      B(&m[r + 0], &n[r + 0], &m[r + q], &n[r + q], l);
    }
  }

  barrier(1);
  g[0] = m[get_local_id(0) + 0];
  h[0] = n[get_local_id(0) + 0];
  g[(1024 / 2)] = m[get_local_id(0) + (1024 / 2)];
  h[(1024 / 2)] = n[get_local_id(0) + (1024 / 2)];
}
__kernel void D(__global uint* g, __global uint* h, __global uint* i, __global uint* j) {
  __local uint m[1024];
  __local uint n[1024];

  i += get_group_id(0) * 1024 + get_local_id(0);
  j += get_group_id(0) * 1024 + get_local_id(0);
  g += get_group_id(0) * 1024 + get_local_id(0);
  h += get_group_id(0) * 1024 + get_local_id(0);
  m[get_local_id(0) + 0] = i[0];
  n[get_local_id(0) + 0] = j[0];
  m[get_local_id(0) + (1024 / 2)] = i[(1024 / 2)];
  n[get_local_id(0) + (1024 / 2)] = j[(1024 / 2)];

  uint s = get_global_id(0) & ((1024 / 2) - 1);

  for (uint o = 2; o < 1024; o <<= 1) {
    uint p = (s & (o / 2)) != 0;
    for (uint q = o / 2; q > 0; q >>= 1) {
      barrier(1);
      uint r = 2 * get_local_id(0) - (get_local_id(0) & (q - 1));
      B(&m[r + 0], &n[r + 0], &m[r + q], &n[r + q], p);
    }
  }

  {
    uint p = (get_group_id(0) & 1);
    for (uint q = 1024 / 2; q > 0; q >>= 1) {
      barrier(1);
      uint r = 2 * get_local_id(0) - (get_local_id(0) & (q - 1));
      B(&m[r + 0], &n[r + 0], &m[r + q], &n[r + q], p);
    }
  }

  barrier(1);
  g[0] = m[get_local_id(0) + 0];
  h[0] = n[get_local_id(0) + 0];
  g[(1024 / 2)] = m[get_local_id(0) + (1024 / 2)];
  h[(1024 / 2)] = n[get_local_id(0) + (1024 / 2)];
}

__kernel void E(__global uint* g, __global uint* h, __global uint* i, __global uint* j, uint k, uint o, uint q, uint l) {
  uint t = get_global_id(0);
  uint s = t & (k / 2 - 1);

  uint p = l ^ ((s & (o / 2)) != 0);
  uint r = 2 * t - (t & (q - 1));

  uint a = i[r + 0];
  uint b = j[r + 0];
  uint c = i[r + q];
  uint d = j[r + q];

  A(&a, &b, &c, &d, p);

  g[r + 0] = a;
  h[r + 0] = b;
  g[r + q] = c;
  h[r + q] = d;
}

__kernel void F(__global uint* g, __global uint* h, __global uint* i, __global uint* j, uint k, uint q, uint o, uint l) {
  __local uint m[1024];
  __local uint n[1024];

  i += get_group_id(0) * 1024 + get_local_id(0);
  j += get_group_id(0) * 1024 + get_local_id(0);
  g += get_group_id(0) * 1024 + get_local_id(0);
  h += get_group_id(0) * 1024 + get_local_id(0);
  m[get_local_id(0) + 0] = i[0];
  n[get_local_id(0) + 0] = j[0];
  m[get_local_id(0) + (1024 / 2)] = i[(1024 / 2)];
  n[get_local_id(0) + (1024 / 2)] = j[(1024 / 2)];

  uint s = get_global_id(0) & ((k / 2) - 1);
  uint p = l ^ ((s & (o / 2)) != 0);
  for (; q > 0; q >>= 1) {
    barrier(1);
    uint r = 2 * get_local_id(0) - (get_local_id(0) & (q - 1));
    B(&m[r + 0], &n[r + 0], &m[r + q], &n[r + q], p);
  }

  barrier(1);
  g[0] = m[get_local_id(0) + 0];
  h[0] = n[get_local_id(0) + 0];
  g[(1024 / 2)] = m[get_local_id(0) + (1024 / 2)];
  h[(1024 / 2)] = n[get_local_id(0) + (1024 / 2)];
}