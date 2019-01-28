__kernel void A(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i, __global double* j, int k) {
  int l = get_global_id(0);
  if (l < k) {
    a[l] = b[l];
    a[l] += c[l];
    a[l] += d[l];
    a[l] += e[l];
    a[l] += f[l];
    a[l] += g[l];
    a[l] += h[l];
    a[l] += i[l];
    a[l] += j[l];
  }
}

__kernel void B(__global double* m, __global double* n, __global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i, __global double* j, int k) {
  int l = get_global_id(0);
  if (l < k) {
    m[l] = c[l];
    m[l] -= e[l];
    n[l] = d[l];
    n[l] -= f[l];

    m[l] += g[l];
    n[l] += g[l];

    m[l] -= h[l];
    n[l] += h[l];

    m[l] -= i[l];
    n[l] -= i[l];

    m[l] += j[l];
    n[l] -= j[l];

    m[l] /= a[l];
    n[l] /= a[l];
  }
}

__kernel void C(__global double* m, __global double* n, __global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i, __global double* j, int o, int p, int q) {
  int r = 0;
  double s = 0.1;
  double t = 98;
  int l = get_global_id(0) + o;
  if (l < p) {
    double u = (double)(l)-0.5;
    double v = 4 * s / (t * t) * (u * t - u * u);
    m[r + l * q] = v;
    n[r + l * q] = 0;
    double w = b[r + l * q];
    w += d[r + l * q];
    w += f[r + l * q];
    w += 2 * e[r + l * q];
    w += 2 * h[r + l * q];
    w += 2 * i[r + l * q];
    a[r + l * q] = 1 / (1 - v);
    a[r + l * q] *= w;
  }
}

__kernel void D(__global double* m, __global double* n, __global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i, __global double* j, int o, int p, int q) {
  int x = 399;
  int l = get_global_id(0) + o;
  if (l < p) {
    a[x + l * q] = 1;
    n[x + l * q] = 0;

    double w = b[x + l * q];
    w += d[x + l * q];
    w += f[x + l * q];
    w += 2 * c[x + l * q];
    w += 2 * g[x + l * q];
    w += 2 * j[x + l * q];

    m[x + l * q] = -1.0 + 1.0 / a[x + l * q] * w;
  }
}

__kernel void E(__global double* m, __global double* n, __global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i, __global double* j, int o, int p, int q) {
  int x = 399, r = 0;
  int l = get_global_id(0) + o;
  if (l < p) {
    c[r + l * q] = e[r + l * q] + m[r + l * q] * (2.0 / 3.0) * a[r + l * q];

    g[r + l * q] = i[r + l * q] + (1.0 / 2.0) * (f[r + l * q] - d[r + l * q]) + (1.0 / 2.0) * a[r + l * q] * n[r + l * q] + (1.0 / 6.0) * a[r + l * q] * m[r + l * q];

    j[r + l * q] = h[r + l * q] + (1.0 / 2.0) * (d[r + l * q] - f[r + l * q]) - (1.0 / 2.0) * a[r + l * q] * n[r + l * q] + (1.0 / 6.0) * a[r + l * q] * m[r + l * q];
  }
}

__kernel void F(__global double* m, __global double* n, __global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i, __global double* j, int o, int p, int q) {
  int x = 399, r = 0;
  int l = get_global_id(0) + o;
  if (l < p) {
    e[x + l * q] = c[x + l * q] - (2.0 / 3.0) * a[x + l * q] * m[x + l * q];

    i[x + l * q] = g[x + l * q] + (1.0 / 2.0) * (d[x + l * q] - f[x + l * q]) - (1.0 / 2.0) * a[x + l * q] * n[x + l * q] - (1.0 / 6.0) * a[x + l * q] * m[x + l * q];
    h[x + l * q] = j[x + l * q] + (1.0 / 2.0) * (f[x + l * q] - d[x + l * q]) + (1.0 / 2.0) * a[x + l * q] * n[x + l * q] - (1.0 / 6.0) * a[x + l * q] * m[x + l * q];
  }
}

__kernel void G(__global double* y, __global double* z, __global double* w, int aa, int ab, int ac, int ad) {
  int q = ac;
  int l = get_global_id(0);
  if (l < ad) {
    for (int ae = 0; ae < ac; ++ae) {
      int af = (ae - aa + ac) % ac;
      w[ae + l * q] = z[af + l * q];
    }
  }
}

__kernel void H(__global double* y, __global double* z, __global double* w, int aa, int ab, int ac, int ad) {
  int q = ac;
  int l = get_global_id(0);
  if (l < ac) {
    for (int ag = 0; ag < ad; ++ag) {
      int ah = (ag - ab + ad) % ad;
      y[l + ag * q] = w[l + ah * q];
    }
  }
}

__kernel void I(__global double* y, __global double* ai, __global double* z, __global double* a, __global double* m, __global double* n, double aj, double ak, int aa, int ab, int k) {
  int l = get_global_id(0);
  if (l < k) {
    double al = 3.0 * (aa * m[l] + ab * n[l]);
    ai[l] = a[l] * aj * (1.0 + al + 0.5 * al * al - 1.5 * (m[l] * m[l] + n[l] * n[l]));
    z[l] = y[l] - ak * (y[l] - ai[l]);
  }
}

__kernel void J(__global double* y, __global double* z, __global double* am, int k) {
  int l = get_global_id(0);
  if (l < k) {
    if (am[l] > 0.5)
      z[l] = y[l];
  }
}

__kernel void K(__global double* an, int k) {
  int l = get_global_id(0);
  if (l < k) {
    float w = an[l];
    an[l] = 2 * w + 1.0;
  }
}