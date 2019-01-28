__kernel void A(int a, __global float* b, __global float* c, __constant float* d, __constant float* e, __constant int* f, __constant int* g, __global float* h) {
  int i, j, k, l, m, n;

  i = get_group_id(0) + 20 + 2;
  j = get_local_id(0) + 20 + 2;

  float o = 0.f;

  for (k = 0; k < 7; k++) {
    float p = 0.f, q = 0.f, r = 0.f;

    for (l = 0; l < 150; l++) {
      n = j + g[(k * 150) + l];
      m = i + f[(k * 150) + l];

      int s = m * a + n;
      float t = b[s] * e[l] + c[s] * d[l];

      p += t;

      float u = t - r;
      r = r + (u / (float)(l + 1));
      q = q + (u * (t - r));
    }

    r = p / ((float)150);

    float v = q / ((float)(150 - 1));

    if (((r * r) / v) > o)
      o = (r * r) / v;
  }

  h[(i * a) + j] = o;
}
__kernel void B(int w, int x, int y, int z, __constant float* aa, __global float* ab, __global float* ac) {
  int ad = y / 2;
  int ae = z / 2;

  int af = get_global_id(0);
  int i = af % w;
  int j = af / w;

  float ag = 0.0f;

  int ah, ai, m, n;
  for (ah = 0; ah < y; ah++) {
    n = i - ad + ah;

    if ((n >= 0) && (n < w)) {
      for (ai = 0; ai < z; ai++) {
        m = j - ae + ai;

        if ((m >= 0) && (m < x) && (aa[(ah * z) + ai] != 0)) {
          int s = (m * w) + n;
          float aj = ab[s];

          if (aj > ag)
            ag = aj;
        }
      }
    }
  }

  ac[(i * x) + j] = ag;
}