__kernel void A(__global uint* a, __global uint* b, int c, int d, int e, int f, int g, __global uint* h) {
  const size_t i = get_global_size(0);
  const size_t j = get_global_size(1);
  const size_t k = get_global_id(0);
  const size_t l = get_global_id(1);
  const size_t m = k + l * i;

  int n = m;

  while (n < c) {
    h[n] = 0;

    int o = 0;
    int p = d - 1;

    while (o <= p) {
      int q = (p + o) / 2;
      if (b[q] == a[n] + g + e) {
        h[n] = a[n] - f;
        break;
      } else if (b[q] > a[n] + g + e)
        p = q - 1;
      else
        o = q + 1;
    }

    n += i * j;
  }
}