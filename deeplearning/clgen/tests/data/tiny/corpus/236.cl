kernel void A(const int a, const int b, const float c, const float d, const float e, const float f, global uint* g, global uint* h, const int i, const int j) {
  unsigned int k = get_global_id(0);
  unsigned int l = get_global_id(1);

  float m = c + k * e / a;
  float n = d + l * f / b;

  float o = 0;
  float p = 0;

  float q = 0;
  int r = 0;

  while (q < 4 && r < j) {
    float s = o * o;
    float t = p * p;
    p = 2 * o * p + n;
    o = s - t + m;
    q = s + t;
    r++;
  }

  if (r == j) {
    g[l * a + k] = 0;

  } else {
    float u = (float)r / j;
    int v = (int)(u * i);
    g[l * a + k] = h[v];
  }
}