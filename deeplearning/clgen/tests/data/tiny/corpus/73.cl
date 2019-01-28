__kernel void A(__global float* a, int b, int c, __global float* d, int e, int f, __global float* g, int h, int i, int j, int k) {
  int l = get_global_id(0);
  int m = get_global_id(1);

  if (l < j && m < k) {
    int n = mad24(m, b, l + c);
    int o = mad24(m, e, l + f);
    int p = mad24(m, h, l + i);

    float q = a[n];
    float r = d[o];
    float s = atan2(r, q);

    if (s < 0)
      s += (2 * 0x1.921fb6p+1f);

    g[p] = s;
  }
}
__kernel void B(__global float* a, int b, int c, __global float* d, int e, int f, __global float* g, int h, int i, int j, int k) {
  int l = get_global_id(0);
  int m = get_global_id(1);

  if (l < j && m < k) {
    int n = mad24(m, b, l + c);
    int o = mad24(m, e, l + f);
    int p = mad24(m, h, l + i);

    float q = a[n];
    float r = d[o];
    float s = atan2(r, q);
    s = 180 * s / 0x1.921fb6p+1f;

    if (s < 0)
      s += 360;

    g[p] = s;
  }
}