__kernel void A(__global const unsigned int* a, __global const unsigned int* b, __global const float* c, __global float* d, unsigned int e) {
  __local unsigned int f[128];
  __local float g[128];
  __local float h[128];

  unsigned int i = a[e];
  unsigned int j = 0;
  unsigned int k = 0;
  float l = d[0];
  float m;
  unsigned int n = (i / get_local_size(0) + 1) * get_local_size(0);
  unsigned int o = a[1];

  for (unsigned int p = get_local_id(0); p < n; p += get_local_size(0)) {
    if (p < i) {
      g[get_local_id(0)] = c[p];
      unsigned int q = b[p];
      f[get_local_id(0)] = q;
      h[get_local_id(0)] = d[q];
    }

    barrier(1);

    if (get_local_id(0) == 0) {
      for (unsigned int r = 0; r < get_local_size(0); ++r) {
        if (j < e && p + r == o) {
          d[j] = l / m;
          ++j;
          if (j < e) {
            o = a[j + 1];
            l = d[j];
          }
        }

        if (j < e && f[r] < j) {
          if (f[r] < k)
            l -= g[r] * h[r];
          else if (f[r] < j)
            l -= g[r] * d[f[r]];
        } else if (f[r] == j)
          m = g[r];
      }

      k = j;
    }

    barrier(2);
  }
}