__kernel void A(__global float* a, __global float* b, int c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = f * c + e;

  float h, i, j, k, l, m, n, o = 0;

  if (e < 1 || f < 1 || e > c - 2 || f > d - 2) {
    b[g] = 0;
  } else {
    h = a[g - c - 1];
    i = a[g - c];
    j = a[g - c + 1];
    k = a[g - 1];
    l = a[g + 1];
    m = a[g + c - 1];
    n = a[g + c];
    o = a[g + c + 1];

    float p = h + 2 * i + j - m - 2 * n - o;
    float q = h + 2 * k + m - j - 2 * l - o;

    b[g] = sqrt(p * p + q * q);
  }
}