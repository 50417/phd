__kernel void A(__global const T* a, __global const T* b, __global T* c, __local T* d, __local T* e, int f) {
  int g = f;
  int h = f;

  int i = get_group_id(0);
  int j = get_group_id(1);

  int k = get_local_id(0);
  int l = get_local_id(1);

  int m = g * 16 * j;

  int n = m + g - 1;

  int o = 16;

  int p = 16 * i;

  int q = 16 * h;

  T r = 0.0f;

  for (int s = m, t = p; s <= n; s += o, t += q) {
    d[k + l * 16] = a[s + g * l + k];
    e[k + l * 16] = b[t + h * l + k];

    barrier(1);

    for (int u = 0; u < 16; ++u)
      r += d[u + l * 16] * e[k + u * 16];

    barrier(1);
  }

  c[get_global_id(1) * get_global_size(0) + get_global_id(0)] = r;
}