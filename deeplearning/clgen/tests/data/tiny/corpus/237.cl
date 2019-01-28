__kernel void A(__global float* a, __global float* b, int c, int d) {
  int e = get_local_id(0) + get_local_size(0) * get_group_id(0);
  int f;

  if (e < c) {
    for (f = 0; f < d; f++)
      b[e + c * f] = a[e * d + f];
  }
  return;
}
__kernel void B(__global float* g, __global float* h, int d, int c, int i, __global int* j, __constant float* k

                ) {
  const unsigned int l = get_num_groups(0) * get_group_id(1) + get_group_id(0);

  const unsigned int e = l * get_local_size(0) * get_local_size(1) + get_local_id(0);

  int m = -1;

  if (e < c) {
    int f, n;
    float o = 0x1.fffffep127f;
    float p;

    for (f = 0; f < i; f++) {
      int q = f * d;
      float r = 0.0;

      for (n = 0; n < d; n++) {
        int s = e + n * c;
        float t = (g[s] - k[q + n]);
        r += t * t;
      }
      p = r;

      if (p < o) {
        o = p;
        m = f;
      }
    }
  }
  if (e < c) {
    j[e] = m;
  }
}