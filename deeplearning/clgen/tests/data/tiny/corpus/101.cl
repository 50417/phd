__kernel void A(const int a, const float b, __constant float2* c, __constant float2* d, __local float* e, __constant float* f, __global float* g) {
  int h = get_global_id(0);
  int i = get_local_id(0);
  int j = get_local_size(0);

  float2 k;
  k.x = 0.f;
  k.y = 0.f;

  float l;

  int m, n;
  for (m = 0; m < a; m += 256) {
    e[i] = f[m + i];

    barrier(1);

    for (n = 0; n < 256; n++) {
      l = e[n] - dot(d[i], k);

      k.y = k.x;
      k.x = l;

      float o = dot(c[i], k);
      float p = work_group_reduce_add(o);

      if (i == 0) {
        g[get_group_id(0) * a + m + n] = p + b * e[n];
      }
    }
  }
}