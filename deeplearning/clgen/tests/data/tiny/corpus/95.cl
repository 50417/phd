__kernel void A(__global const T* a, __global T* b, __local T* c) {
  int d = get_local_id(0);
  int e = get_local_size(0);

  int f = get_group_id(0) * e;
  a += f;
  b += f;

  T g = a[d];
  c[d] = g;
  barrier(1);

  for (int h = 1; h < e; h <<= 1) {
    bool i = ((d & (h << 1)) != 0);

    for (int j = h; j > 0; j >>= 1) {
      int k = d ^ j;
      T l = c[k];
      bool m = (l < g) || (l == g && k < d);
      bool n = m ^ (k < d) ^ i;
      g = n ? l : g;
      barrier(1);
      c[d] = g;
      barrier(1);
    }
  }

  b[d] = g;
}