__kernel void A(__global double* a, unsigned long b, unsigned long c) {
  int d = get_local_id(0);
  int e = get_local_id(1);
  int f = get_group_id(0);
  int g = get_group_id(1);

  int h = e * 16 + d;
  int i = c * 16 * (b + 1) + e * b + d;
  int j = i + (g + 1) * b * 16;
  int k = i + (f + 1) * b * 16;
  int l = i + (g + 1) * b * 16 + (f + 1) * 16;

  __local double m[16 * 16];
  __local double n[16 * 16];
  __local double o[16 * 16];

  if (f <= g) {
    o[h] = a[l];
    m[h] = a[j];
    n[h] = a[k];
  }

  barrier(1);

  if (f <= g) {
    double p[8];

    p[0] = m[0 + e * 16] * n[0 + d * 16] + m[8 + e * 16] * n[8 + d * 16];
    p[1] = m[1 + e * 16] * n[1 + d * 16] + m[9 + e * 16] * n[9 + d * 16];
    p[2] = m[2 + e * 16] * n[2 + d * 16] + m[10 + e * 16] * n[10 + d * 16];
    p[3] = m[3 + e * 16] * n[3 + d * 16] + m[11 + e * 16] * n[11 + d * 16];
    p[4] = m[4 + e * 16] * n[4 + d * 16] + m[12 + e * 16] * n[12 + d * 16];
    p[5] = m[5 + e * 16] * n[5 + d * 16] + m[13 + e * 16] * n[13 + d * 16];
    p[6] = m[6 + e * 16] * n[6 + d * 16] + m[14 + e * 16] * n[14 + d * 16];
    p[7] = m[7 + e * 16] * n[7 + d * 16] + m[15 + e * 16] * n[15 + d * 16];

    p[0] += p[4];
    p[1] += p[5];
    p[2] += p[6];
    p[3] += p[7];

    p[0] += p[2];
    p[1] += p[3];

    p[0] += p[1];

    a[l] = o[h] - p[0];
  }
}