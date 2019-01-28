__kernel void A(const int a, __global float* b, __global float* c, __global float* d, __global float* e) {
  size_t f = get_global_id(0);
  if (f < a) {
    d[f] = c[f] * b[f];
    e[f] = 1.0f;
  }
}

__kernel void B(const int a, const int g, __local float* h, __global float* d, __global float* i)

{
  size_t j = get_local_id(0);
  size_t k = get_global_id(0);
  size_t l = get_local_size(0);
  size_t m = get_global_size(0);

  float n = 0.f;
  int o;
  for (o = k; o < a; o += m) {
    n += d[g + o];
  }

  h[j] = n;

  barrier(1);

  if (l >= 512) {
    if (j < 256) {
      h[j] += h[j + 256];
    }
    barrier(1);
  }
  if (l >= 256) {
    if (j < 128) {
      h[j] += h[j + 128];
    }
    barrier(1);
  }
  if (l >= 128) {
    if (j < 64) {
      h[j] += h[j + 64];
    }
    barrier(1);
  }
  if (l >= 64) {
    if (j < 32) {
      h[j] += h[j + 32];
    }
    barrier(1);
  }
  if (l >= 32) {
    if (j < 16) {
      h[j] += h[j + 16];
    }
    barrier(1);
  }
  if (l >= 16) {
    if (j < 8) {
      h[j] += h[j + 8];
    }
    barrier(1);
  }
  if (l >= 8) {
    if (j < 4) {
      h[j] += h[j + 4];
    }
    barrier(1);
  }
  if (l >= 4) {
    if (j < 2) {
      h[j] += h[j + 2];
    }
    barrier(1);
  }
  if (l >= 2) {
    if (j < 1) {
      h[j] += h[j + 1];
    }
    barrier(1);
  }

  for (o = k; o < a; o += m) {
    d[g + o] /= h[0];
  }

  if (k == 0) {
    i[0] += log(h[0]);
  }
}

__kernel void C(const int a, __local float* h, __global float* p, __global float* q) {
  size_t r = get_local_id(0);
  size_t s = get_local_id(1);

  size_t t = get_global_id(0);
  size_t u = get_global_id(1);

  if ((t < a) && (u < a)) {
    size_t v = u * a + t;
    h[s * 17 + r] = p[v];
  }

  barrier(1);

  t = get_group_id(1) * 16 + r;
  u = get_group_id(0) * 16 + s;

  if ((t < a) && (u < a)) {
    size_t w = u * a + t;
    q[w] = h[r * 17 + s];
  }
}

__kernel void D(const int a, const int x, __local float* h, __constant float* y, __global float* q, __global float* b, __global float* d) {
  size_t r = get_local_id(0);
  size_t t = get_global_id(0);

  size_t s = get_local_id(1);
  size_t u = get_global_id(1);

  int z = a / 16;

  float aa = 0.f;

  int o;
  for (o = 0; o < z; ++o) {
    int ab = o * 16 + r;
    aa += q[u * a + ab] * y[ab];
  }

  h[s * 17 + r] = aa;

  barrier(1);

  if (t == 0) {
    int ac = s * 17;

    aa = h[ac] + h[ac + 1] + h[ac + 2] + h[ac + 3] + h[ac + 4] + h[ac + 5] + h[ac + 6] + h[ac + 7] + h[ac + 8] + h[ac + 9] + h[ac + 10] + h[ac + 11] + h[ac + 12] + h[ac + 13] + h[ac + 14] + h[ac + 15];

    d[x + u] = aa * b[x + u];
  }
}

__kernel void E(const int a, const int ad, __global const float* e, __global const float* b, __global float* ae) {
  size_t f = get_global_id(0);
  if (f < a) {
    ae[f] = b[ad + f] * e[ad + f];
  }
}

__kernel void F(const int a, const int x, __local float* h, __constant float* y, __global float* p, __global float* e) {
  size_t r = get_local_id(0);
  size_t t = get_global_id(0);

  size_t s = get_local_id(1);
  size_t u = get_global_id(1);

  int z = a / 16;

  float aa = 0.f;

  int o;
  for (o = 0; o < z; ++o) {
    int ab = o * 16 + r;
    aa += p[u * a + ab] * y[ab];
  }

  h[s * 17 + r] = aa;

  barrier(1);

  if (t == 0) {
    int ac = s * 17;

    aa = h[ac] + h[ac + 1] + h[ac + 2] + h[ac + 3] + h[ac + 4] + h[ac + 5] + h[ac + 6] + h[ac + 7] + h[ac + 8] + h[ac + 9] + h[ac + 10] + h[ac + 11] + h[ac + 12] + h[ac + 13] + h[ac + 14] + h[ac + 15];

    e[x + u] = aa;
  }
}

__kernel void G(const int a, const int x, __local float* h, __global float* e)

{
  size_t j = get_local_id(0);
  size_t k = get_global_id(0);
  size_t l = get_local_size(0);
  size_t m = get_global_size(0);

  float n = 0.f;
  int o;
  for (o = k; o < a; o += m) {
    n += e[x + o];
  }

  h[j] = n;

  barrier(1);

  if (l >= 512) {
    if (j < 256) {
      h[j] += h[j + 256];
    }
    barrier(1);
  }
  if (l >= 256) {
    if (j < 128) {
      h[j] += h[j + 128];
    }
    barrier(1);
  }
  if (l >= 128) {
    if (j < 64) {
      h[j] += h[j + 64];
    }
    barrier(1);
  }
  if (l >= 64) {
    if (j < 32) {
      h[j] += h[j + 32];
    }
    barrier(1);
  }
  if (l >= 32) {
    if (j < 16) {
      h[j] += h[j + 16];
    }
    barrier(1);
  }
  if (l >= 16) {
    if (j < 8) {
      h[j] += h[j + 8];
    }
    barrier(1);
  }
  if (l >= 8) {
    if (j < 4) {
      h[j] += h[j + 4];
    }
    barrier(1);
  }
  if (l >= 4) {
    if (j < 2) {
      h[j] += h[j + 2];
    }
    barrier(1);
  }
  if (l >= 2) {
    if (j < 1) {
      h[j] += h[j + 1];
    }
    barrier(1);
  }

  for (o = k; o < a; o += m) {
    e[x + o] /= h[0];
  }
}

__kernel void H(const int a, const int x, const int af, __global const float* e, __global const float* b, __global const float* d, __global float* ae, __global float* ag) {
  size_t f = get_global_id(0);
  if (f < a) {
    ae[f] = e[af + f] * b[af + f];
    ag[f] = e[x + f] * d[x + f];
  }
}

__kernel void I(const int a, const int x, __local float* h, __global const float* ag, __global float* ah) {
  size_t j = get_local_id(0);
  size_t k = get_global_id(0);
  size_t l = get_local_size(0);
  size_t m = get_global_size(0);

  float n = 0.f;
  int o;
  for (o = k; o < a; o += m) {
    n += ag[o];
  }

  h[j] = n;

  barrier(1);

  if (l >= 512) {
    if (j < 256) {
      h[j] += h[j + 256];
    }
    barrier(1);
  }
  if (l >= 256) {
    if (j < 128) {
      h[j] += h[j + 128];
    }
    barrier(1);
  }
  if (l >= 128) {
    if (j < 64) {
      h[j] += h[j + 64];
    }
    barrier(1);
  }
  if (l >= 64) {
    if (j < 32) {
      h[j] += h[j + 32];
    }
    barrier(1);
  }
  if (l >= 32) {
    if (j < 16) {
      h[j] += h[j + 16];
    }
    barrier(1);
  }
  if (l >= 16) {
    if (j < 8) {
      h[j] += h[j + 8];
    }
    barrier(1);
  }
  if (l >= 8) {
    if (j < 4) {
      h[j] += h[j + 4];
    }
    barrier(1);
  }
  if (l >= 4) {
    if (j < 2) {
      h[j] += h[j + 2];
    }
    barrier(1);
  }
  if (l >= 2) {
    if (j < 1) {
      h[j] += h[j + 1];
    }
    barrier(1);
  }

  for (o = k; o < a; o += m) {
    ah[x + o] /= h[0];
  }
}

__kernel void J(const int a, const int x, __global const float* ae, __global const float* d, __global float* ai) {
  size_t t = get_global_id(0);
  size_t u = get_global_id(1);

  if (t < a && u < a) {
    ai[u * a + t] = d[x + u] * ae[t];
  }
}

__kernel void K(const int a, __local float* h, __global const float* p, __global const float* ai, __global float* aj, __global float* ak) {
  size_t r = get_local_id(0);
  size_t s = get_local_id(1);

  size_t t = get_global_id(0);
  size_t u = get_global_id(1);

  float aa = 0.f;

  if (t < a && u < a) {
    aa = aj[u * a + t] = p[u * a + t] * ai[u * a + t];
  }

  h[s * 17 + r] = aa;

  barrier(1);

  size_t al = s * 17 + r;
  if (r < 8) {
    h[al] += h[al + 8];
    barrier(1);
  }
  if (r < 4) {
    h[al] += h[al + 4];
    barrier(1);
  }
  if (r < 2) {
    h[al] += h[al + 2];
    barrier(1);
  }
  if (r < 1) {
    h[al] += h[al + 1];
    barrier(1);
  }

  if (r == 0 && s == 0) {
    int w = get_group_id(1) * get_num_groups(0) + get_group_id(0);
    ak[w] = h[0] + h[17] + h[34] + h[51] + h[68] + h[85] + h[102] + h[119] + h[136] + h[153] + h[170] + h[187] + h[204] + h[221] + h[238] + h[255];
  }
}

__kernel void L(const int a, const float am, __global const float* aj, __global float* an) {
  size_t t = get_global_id(0);
  size_t u = get_global_id(1);

  if (t < a && u < a) {
    size_t al = u * a + t;
    an[al] += aj[al] / am;
  }
}

__kernel void M(const int a, const int x, __local float* h, __global const float* d, __global const float* e, __global float* ah) {
  size_t j = get_local_id(0);
  size_t k = get_global_id(0);
  size_t l = get_local_size(0);
  size_t m = get_global_size(0);

  float n = 0.f;
  int o;
  for (o = k; o < a; o += m) {
    n += d[x + o] * e[x + o];
  }

  h[j] = n;

  barrier(1);

  if (l >= 512) {
    if (j < 256) {
      h[j] += h[j + 256];
    }
    barrier(1);
  }
  if (l >= 256) {
    if (j < 128) {
      h[j] += h[j + 128];
    }
    barrier(1);
  }
  if (l >= 128) {
    if (j < 64) {
      h[j] += h[j + 64];
    }
    barrier(1);
  }
  if (l >= 64) {
    if (j < 32) {
      h[j] += h[j + 32];
    }
    barrier(1);
  }
  if (l >= 32) {
    if (j < 16) {
      h[j] += h[j + 16];
    }
    barrier(1);
  }
  if (l >= 16) {
    if (j < 8) {
      h[j] += h[j + 8];
    }
    barrier(1);
  }
  if (l >= 8) {
    if (j < 4) {
      h[j] += h[j + 4];
    }
    barrier(1);
  }
  if (l >= 4) {
    if (j < 2) {
      h[j] += h[j + 2];
    }
    barrier(1);
  }
  if (l >= 2) {
    if (j < 1) {
      h[j] += h[j + 1];
    }
    barrier(1);
  }

  for (o = k; o < a; o += m) {
    ah[x + o] /= h[0];
  }
}

__kernel void N(const int a, __local float* h, __global const float* an, __global float* ao) {
  size_t t = get_global_id(0);
  size_t r = get_local_id(0);

  size_t u = get_global_id(1);
  size_t s = get_local_id(1);

  float aa = 0.f;

  int ac = s * 17;
  size_t ap = u * a;

  int o;
  for (o = t; o < a; o += 16) {
    aa += an[ap + o];
  }

  h[ac + r] = aa;

  barrier(1);

  if (t == 0) {
    aa = h[ac] + h[ac + 1] + h[ac + 2] + h[ac + 3] + h[ac + 4] + h[ac + 5] + h[ac + 6] + h[ac + 7] + h[ac + 8] + h[ac + 9] + h[ac + 10] + h[ac + 11] + h[ac + 12] + h[ac + 13] + h[ac + 14] + h[ac + 15];

    if (aa == 0.f)
      aa = 1.f;

    h[ac] = aa;
  }

  barrier(1);

  for (o = t; o < a; o += 16) {
    ao[ap + o] = an[ap + o] / h[ac];
  }
}

__kernel void O(const int a, const int aq, __local float* h, __global const float* ah, __global float* ar) {
  size_t t = get_global_id(0);
  size_t u = get_global_id(1);

  size_t r = get_local_id(0);
  size_t s = get_local_id(1);

  float aa = 0.f;

  int o;
  for (o = u; o < aq; o += 16) {
    aa += ah[o * a + t];
  }

  h[r * 17 + s] = aa;

  barrier(1);

  if (u == 0) {
    int ac = r * 17;
    aa = h[ac] + h[ac + 1] + h[ac + 2] + h[ac + 3] + h[ac + 4] + h[ac + 5] + h[ac + 6] + h[ac + 7] + h[ac + 8] + h[ac + 9] + h[ac + 10] + h[ac + 11] + h[ac + 12] + h[ac + 13] + h[ac + 14] + h[ac + 15];

    if (aa == 0.f)
      aa = 1.f;

    ar[t] = aa;
  }
}

__kernel void P(const int as, const int aq, __constant float* y, __global const float* at, __global float* au) {
  size_t t = get_global_id(0);
  size_t u = get_global_id(1);

  size_t av = u * aq + t;

  if (t < aq && u < as)
    au[av] = at[av] * y[t];
}

__kernel void Q(const int as, const int aq, const int ap, const int aw, __local float* h, __global const float* au, __global const float* ar, __global float* ax) {
  size_t t = get_global_id(0);
  size_t u = get_global_id(1);

  size_t r = get_local_id(0);
  size_t s = get_local_id(1);

  size_t ay = u * aq;

  float aa = 0.f;

  int o;
  for (o = t; o < aq; o += 16) {
    aa += au[ay + o];
  }

  h[s * 17 + r] = aa;

  barrier(1);

  if (t == 0) {
    int ac = s * 17;
    aa = h[ac] + h[ac + 1] + h[ac + 2] + h[ac + 3] + h[ac + 4] + h[ac + 5] + h[ac + 6] + h[ac + 7] + h[ac + 8] + h[ac + 9] + h[ac + 10] + h[ac + 11] + h[ac + 12] + h[ac + 13] + h[ac + 14] + h[ac + 15];

    if (u < as)
      ax[ap + u] = aa / ar[aw];
  }
}

__kernel void R(const int as, const int aq, const int aw, __constant float* y, __global const float* au, __global const float* at, __global const float* ar, __global float* az) {
  __local float ba[72];
  __local float bb[72];

  int r = get_local_id(0);
  int s = get_local_id(1);

  size_t t = get_global_id(0);
  size_t u = get_global_id(1);

  float am = 0.f;

  int bc = aq / 8;
  int bd;
  for (bd = 0; bd < bc; ++bd) {
    ba[s * 9 + r] = au[u * aq + (r + bd * 8)];
    bb[s * 9 + r] = at[t * aq + (s + bd * 8)];

    barrier(1);

    int be;
    for (be = 0; be < 8; ++be) {
      am += ba[s * 9 + be] * bb[r * 9 + be];
    }

    barrier(1);
  }

  az[u * as + t] = am / ar[aw] - y[u] * y[t];
}

__kernel void S(const int bf, const int bg, const size_t ac, __global const float* az, __global float* bh) {
  volatile __local int2 bi;
  int bj = get_local_id(0);
  int bk = get_local_id(1);

  int bl = get_group_id(1);

  if (bj == 0 && bk == 0) {
    int o;
    int bm, bn;

    for (o = 2, bn = 0, bm = 1; o <= (bf + 1); o++) {
      if (bl >= bn && bl < bm) {
        bi.y = o - 2;
        bi.x = bl - bn;
        break;
      } else {
        bn = bm;
        bm = bm + o;
      }
    }
  }

  barrier(1);

  size_t t, u, k;
  t = bi.x * 16 + bj;
  u = bi.y * 16 + bk;
  k = u * bg + t;

  size_t bo = t * bg + u;

  float p = az[k];
  float b = az[bo];

  if (t == u) {
    p = p + 0.01f;
    b = b + 0.01f;
  }

  if (p > b) {
    bh[ac + k] = p;
    bh[ac + bo] = p;
  } else {
    bh[ac + k] = b;
    bh[ac + bo] = b;
  }
}