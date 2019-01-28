__kernel void A(__global const T* a, __global uint* b, const uint c, const uint d, const uint e) {
  size_t f = get_global_id(0);

  if (f > d - c)
    return;

  f += c;

  T g = a[f];
  uint h = ((uint)g >> e) & ((1 << 2) - 1);

  atomic_add(&b[h], 1);
}

__kernel void B(__global uint* b) {
  uint i = 0;
  for (size_t j = 0; j < (1 << 2); ++j) {
    uint k = b[j];
    b[j] = i;
    i += k;
  }
}

__kernel void C(__global const T* a, __global T* l, __global uint* b, const uint c, const uint d, const uint e) {
  size_t f = get_global_id(0);

  if (f > d - c)
    return;

  f += c;

  T g = a[f];
  uint h = ((uint)g >> e) & ((1 << 2) - 1);

  uint m = atomic_add(&b[h], 1);

  l[c + m] = g;
}