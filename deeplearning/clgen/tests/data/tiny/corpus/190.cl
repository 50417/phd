typedef float4 keypoint; typedef struct t_keypoint {
  keypoint kp;
  unsigned char desc[128];
} t_keypoint;
__kernel void A(__global t_keypoint* a, __global t_keypoint* b, __global int2* c, __global int* d, int e, float f, int g, int h) {
  int i = get_global_id(0);
  if (!(0 <= i && i < g))
    return;

  float j = 1000000000000.0f, k = 1000000000000.0f;
  int l = 0;
  int m;

  unsigned char n[128];
  for (int o = 0; o < 128; o++)
    n[o] = ((a[i]).desc)[o];

  for (int o = 0; o < h; o++) {
    int p = 0;
    for (int q = 0; q < 128; q++) {
      unsigned char r = n[q], s = ((b[o]).desc)[q];
      p += ((r > s) ? (r - s) : (-r + s));
    }

    if (p < j) {
      k = j;
      j = p;
      l = o;
    } else if (p < k) {
      k = p;
    }
  }

  if (k != 0 && j / k < f) {
    int2 t = 0;
    t.s0 = i;
    t.s1 = l;
    m = atomic_add(d, 1);
    if (m < e)
      c[m] = t;
  }
}
__kernel void B(__global t_keypoint* a, __global t_keypoint* b, __global char* u, int v, int w, __global int2* c, __global int* d, int e, float f, int g, int h) {
  int i = get_global_id(0);
  if (!(0 <= i && i < g))
    return;

  float j = 1000000000000.0f, k = 1000000000000.0f;
  int l = 0;
  int m;

  keypoint x = a[i].kp;
  int y = x.s0, z = x.s1;

  if (z < w && y < v && u[z * v + y] == 0)
    return;

  unsigned char n[128];
  for (int o = 0; o < 128; o++)
    n[o] = ((a[i]).desc)[o];

  for (int o = 0; o < h; o++) {
    int p = 0;
    for (int q = 0; q < 128; q++) {
      x = b[o].kp;
      y = x.s0, z = x.s1;
      if (z < w && y < v && u[z * v + y] != 0) {
        unsigned char r = n[q], s = ((b[o]).desc)[q];
        p += ((r > s) ? (r - s) : (-r + s));
      }
    }

    if (p < j) {
      k = j;
      j = p;
      l = o;
    } else if (p < k) {
      k = p;
    }
  }

  if (k != 0 && j / k < f) {
    int2 t = 0;
    t.s0 = i;
    t.s1 = l;
    m = atomic_add(d, 1);
    if (m < e)
      c[m] = t;
  }
}