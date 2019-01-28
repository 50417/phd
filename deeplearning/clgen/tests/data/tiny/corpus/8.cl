__kernel void A(const int a, const int b, const int c, const __global float* d, const __global float* e, __global float* f, __local float* g) {
  int h = get_global_id(0);
  int i = get_local_id(0);
  int j = get_local_size(0);
  int k = h * c;
  int l = b >> 2;

  for (int m = 0; m < c; m++) {
    int n = m * b;
    for (int o = i; (((o & 3) == 0) && o < b); o += j) {
      *((__local float4*)&g[o]) = *((__global float4*)&e[o + n]);
    }

    barrier(1);

    int p = b * h;
    int q = 0;
    float r = 0.0f;
    for (int s = 0; s < l; s++) {
      float4 t = (*((__global float4*)&d[p]));
      float4 u = (*((__local float4*)&g[q]));
      r += dot(t, u);
      q += 4;
      p += 4;
    }
    f[k + m] = r;

    barrier(1);
  }
}