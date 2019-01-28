__kernel void A(__global float* a, __global float* b, __global float* c, __local float* d, __local float* e, int f, int g) {
  int h = get_group_id(0);
  int i = get_group_id(1);

  int j = get_local_id(0);
  int k = get_local_id(1);

  int l = f * 16 * i;

  int m = l + f - 1;

  int n = 16;

  int o = 16 * h;

  int p = 16 * g;

  float q = 0.0f;

  for (int r = l, s = o; r <= m; r += n, s += p) {
    d[j + k * 16] = b[r + f * k + j];
    e[j + k * 16] = c[s + g * k + j];

    barrier(1);

    for (int t = 0; t < 16; ++t)
      q += d[t + k * 16] * e[j + t * 16];

    barrier(1);
  }

  a[get_global_id(1) * get_global_size(0) + get_global_id(0)] = q;
}