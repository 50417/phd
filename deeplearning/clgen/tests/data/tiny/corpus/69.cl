void A(__global float* a, unsigned int b, unsigned int c, __global float* d, unsigned int e, unsigned int f, unsigned int g, unsigned int h) {
  for (unsigned int i = 0; i < c; ++i) {
    for (unsigned int j = 0; j < h; ++j) {
      a[i * b + j] = d[i * e + j + g];
    }
  }
}

void B(__global float* a, unsigned int b, unsigned int c, __global float* k, unsigned int l, unsigned int m, unsigned int h) {
  for (unsigned int i = 0; i < m; ++i) {
    for (unsigned int j = 0; j < l; ++j) {
      a[i * b + j + h] = k[i * l + j];
    }
  }
}

void C(__global float* a, unsigned int b, unsigned int c, __global float* d, unsigned int e, unsigned int f, __global float* k, unsigned int l, unsigned int m, unsigned int g) {
  unsigned int h = e - g;
  A(a, b, c, d, e, f, g, h);
  if (h > 0) {
    B(a, b, c, k, l, m, h);
  }
}

__kernel void D(__global unsigned int* n, __global float* d, __global unsigned int* o, __global unsigned int* p, __global float* k, __global unsigned int* q, __global unsigned int* r, __global float* a, __global unsigned int* s, __global unsigned int* t, __global unsigned int* u,

                unsigned int v) {
  for (unsigned int i = get_global_id(0); i < v; i += get_global_size(0)) {
    if ((n[2 * i] > 0) && (n[2 * i + 1] > 0) && u[i] > 0) {
      C(a + s[i], t[2 * i], t[2 * i + 1], d + o[i], p[2 * i], p[2 * i + 1], k + q[i], r[2 * i], r[2 * i + 1], n[2 * i + 1]);
    }
  }
}