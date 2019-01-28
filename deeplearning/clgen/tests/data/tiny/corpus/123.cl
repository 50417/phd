__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, const int f, const int g, const int h, const int i, const int j, const int k) {
  const int l = get_global_id(0);

  if (l < f) {
    int m = l * g;

    float n = 0.0f;
    float o = 0.0f;

    for (int p = 0; p < i; p++) {
      for (int q = 0; q < g; q++) {
        n += e[m + q];
      }

      m += h;
    }
    n /= (i * g);

    a[l] = n;

    if (j > 0) {
      c[l] = (k * c[l] + n) / (k + 1);
    }

    float r = 0.0f;

    m = l * g;

    for (int p = 0; p < i; p++) {
      for (int q = 0; q < g; q++) {
        r = e[m + q] - n;
        o += r * r;
      }
      m += h;
    }
    o /= i * g;

    b[l] = o;

    if (j > 0) {
      d[l] = (k * d[l] + o) / (k + 1);
    }
  }
}
__kernel void B(__global float* s, __global float* t, __global float* e, __constant float* a, __constant float* b, __constant float* u, __constant float* v, const int g, const int h, const int i) {
  const int w = get_global_id(0);

  if (w < h * i) {
    int l = (w % h) / g;

    float x = (e[w] - a[l]) * native_rsqrt(b[l] + 1.0E-5);

    t[w] = x;

    s[w] = u[l] * x + v[l];
  }
}
__kernel void C(__global float* y, __global float* z, __global float* aa, __global float* t, const int h, const int i) {
  const int ab = get_global_id(0);

  if (ab < h) {
    float ac = 0.0F;
    float ad = 0.0F;

    int w = ab;

    for (int p = 0; p < i; p++) {
      ac += aa[w] * t[w];
      ad += aa[w];

      w += h;
    }

    y[ab] = ac;
    z[ab] = ad;
  }
}
__kernel void D(__global float* ae, __global float* af, __global float* ag, __global float* ah, __global float* y, __global float* z, const int f, const int g, const float ai, const float aj, const int i) {
  const int l = get_global_id(0);

  if (l < f) {
    int m = l * g;
    int ak = 0;

    float al = 0.0F;
    float am = 0.0F;

    for (int q = 0; q < g; q++) {
      ak = m + q;

      al += y[ak];
      am += z[ak];
    }

    ag[l] = al;
    ah[l] = am;

    ae[l] = (ai * ae[l]) - aj * al;
    af[l] = (ai * af[l]) - aj * am;
  }
}
__kernel void E(__global float* u, __global float* v, __constant float* ae, __constant float* af, const int an) {
  int ao = get_global_id(0);

  if (ao < an) {
    u[ao] += ae[ao];
    v[ao] += af[ao];
  }
}
__kernel void F(__global float* ap, __global float* aa, __global float* t, __constant float* u, __constant float* o, __constant float* ag, __constant float* ah, const int g, const int h, const int i) {
  const int w = get_global_id(0);

  if (w < h * i) {
    int l = (w % h) / g;
    int m = l * g;
    int q = w % g;

    float aq = 0.0F;

    aq = aa[w] - ah[m + q] / g - ag[l] * t[w] / g;
    aq *= (u[l] * native_rsqrt(o[l] + 1.0E-5));

    ap[w] = aq;
  }
}