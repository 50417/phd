__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  unsigned int h = 0;
  unsigned int i = a * a;

  int j = 0;
  int k = 0;

  int l = 16;
  int m = a / l;

  int n = d / m;
  int o = e / m;

  int p = n % l;
  int q = o % l;
  int r = 3;

  j = 0;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  int s = b[f];

  if (g <= r) {
    s = 0;
  }
  if (g == q) {
    s = b[f] + 1;
  }
  if (g >= p) {
    s = 0;
  }

  c[f] = s;
}