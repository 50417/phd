struct global_constants {
  float gam;
  float gm1;
  float cfl;
  float eps;
  float mach;
  float alpha;
  float qinf[4];
};

typedef enum { OP_READ, OP_WRITE, OP_RW, OP_INC, OP_MIN, OP_MAX } op_access;
inline void A(__local float* a, __local float* b, __local float* c, __local float* d, float* e, __global int* f, __constant struct global_constants* g) {
  float h, i, j, k, l, m, n, o, p;

  h = a[0] - b[0];
  i = a[1] - b[1];

  k = 1.0f / c[0];
  l = g->gm1 * (c[3] - 0.5f * k * (c[1] * c[1] + c[2] * c[2]));

  if (*f == 1) {
    e[1] += +l * i;
    e[2] += -l * h;
  } else {
    m = k * (c[1] * i - c[2] * h);

    k = 1.0f / g->qinf[0];
    n = g->gm1 * (g->qinf[3] - 0.5f * k * (g->qinf[1] * g->qinf[1] + g->qinf[2] * g->qinf[2]));
    o = k * (g->qinf[1] * i - g->qinf[2] * h);

    j = (*d) * g->eps;

    p = 0.5f * (m * c[0] + o * g->qinf[0]) + j * (c[0] - g->qinf[0]);
    e[0] += p;
    p = 0.5f * (m * c[1] + l * i + o * g->qinf[1] + n * i) + j * (c[1] - g->qinf[1]);
    e[1] += p;
    p = 0.5f * (m * c[2] - l * h + o * g->qinf[2] - n * h) + j * (c[2] - g->qinf[2]);
    e[2] += p;
    p = 0.5f * (m * (c[3] + l) + o * (g->qinf[3] + n)) + j * (c[3] - g->qinf[3]);
    e[3] += p;
  }
}
__kernel void B(__global float* q, __global int* r, __global float* s, __global int* t, __global float* u, __global int* v, __global float* w, __global int* x, __global short* y, __global short* z, __global short* aa, __global short* ab, __global short* ac, __global int* ad, __global int* ae, __global int* af, int ag, __global int* ah, __global int* ai, __global int* aj, __global int* ak, __global int* al, __local float* am, __constant struct global_constants* g) {
  float an[4];

  __global int *__local ao, *__local ap, *__local aq, *__local ar;
  __local int as, at, au, av;
  __local float* __local aw;
  __local float* __local ax;
  __local float* __local ay;
  __local float* __local az;
  __local int ba, bb;
  __local int bc, bd;

  if (get_local_id(0) == 0) {
    int be = ah[get_group_id(0) + ag];

    bc = aj[be];
    bd = ai[be];

    ba = get_local_size(0) * (1 + (bc - 1) / get_local_size(0));
    bb = ak[be];

    as = ae[0 + be * 4];
    at = ae[1 + be * 4];
    au = ae[2 + be * 4];
    av = ae[3 + be * 4];

    ao = r + af[0 + be * 4];
    ap = t + af[1 + be * 4];
    aq = v + af[2 + be * 4];
    ar = x + af[3 + be * 4];

    int aj = 0;
    aw = &am[aj];
    aj += (((as * 2) + 15) & ~15);
    ax = &am[aj];
    aj += (((at * 4) + 15) & ~15);
    ay = &am[aj];
    aj += (((au * 1) + 15) & ~15);
    az = &am[aj];
  }

  barrier(1);

  for (int bf = get_local_id(0); bf < as * 2; bf += get_local_size(0))
    aw[bf] = q[bf % 2 + ao[bf / 2] * 2];

  for (int bf = get_local_id(0); bf < at * 4; bf += get_local_size(0))
    ax[bf] = s[bf % 4 + ap[bf / 4] * 4];

  for (int bf = get_local_id(0); bf < au * 1; bf += get_local_size(0))
    ay[bf] = u[bf % 1 + aq[bf / 1] * 1];

  for (int bf = get_local_id(0); bf < av * 4; bf += get_local_size(0))
    az[bf] = 0.0f;

  barrier(1);

  for (int bf = get_local_id(0); bf < ba; bf += get_local_size(0)) {
    int bg = -1;

    if (bf < bc) {
      for (int bh = 0; bh < 4; bh++)
        an[bh] = 0.0f;

      A(aw + y[bf + bd] * 2, aw + z[bf + bd] * 2, ax + aa[bf + bd] * 4, ay + ab[bf + bd] * 1, an, ad + (bf + bd) * 1, g);

      bg = al[bf + bd];
    }

    int bi = ac[bf + bd];

    for (int bj = 0; bj < bb; bj++) {
      if (bg == bj) {
        for (int bh = 0; bh < 4; bh++)
          az[bh + bi * 4] += an[bh];
      }
      barrier(1);
    }
  }

  for (int bf = get_local_id(0); bf < av * 4; bf += get_local_size(0))
    w[bf % 4 + ar[bf / 4] * 4] += az[bf];
}

inline void C(__global volatile float* bk, float bl, int bm, __local float* bn) {
  int bo = get_local_id(0);
  int bh = get_local_size(0) >> 1;

  barrier(1);

  bn[bo] = bl;

  size_t bp = 32;

  for (; bh > bp; bh >>= 1) {
    barrier(1);
    if (bo < bh) {
      switch (bm) {
        case OP_INC:
          bn[bo] = bn[bo] + bn[bo + bh];
          break;
        case OP_MIN:
          if (bn[bo + bh] < bn[bo])
            bn[bo] = bn[bo + bh];
          break;
        case OP_MAX:
          if (bn[bo + bh] > bn[bo])
            bn[bo] = bn[bo + bh];
          break;
      }
    }
  }

  barrier(1);

  __local volatile float* bq = bn;

  if (bo < bp) {
    for (; bh > 0; bh >>= 1) {
      if (bo < bh) {
        switch (bm) {
          case OP_INC:
            bq[bo] = bq[bo] + bq[bo + bh];
            break;
          case OP_MIN:
            if (bq[bo + bh] < bq[bo])
              bq[bo] = bq[bo + bh];
            break;
          case OP_MAX:
            if (bq[bo + bh] > bq[bo])
              bq[bo] = bq[bo + bh];
            break;
        }
      }
    }
  }

  if (bo == 0) {
    switch (bm) {
      case OP_INC:
        *bk = *bk + bq[0];
        break;
      case OP_MIN:
        if (bn[0] < *bk)
          *bk = bq[0];
        break;
      case OP_MAX:
        if (bn[0] > *bk)
          *bk = bq[0];
        break;
    }
  }
}

inline void D(float* br, float* bs, float* bt, __global float* bu, float* bv) {
  float bw, bx;

  bx = 1.0f / (*bu);

  for (int bf = 0; bf < 4; bf++) {
    bw = bx * bt[bf];
    bs[bf] = br[bf] - bw;
    bt[bf] = 0.0f;
    *bv += bw * bw;
  }
}

__kernel void E(__global float* by, __global float* bz, __global float* ca, __global float* cb, __global float* cc, int cd, int ce, int cf, __local float* am) {
  cc = cc + cd / sizeof(float);

  float cg[4];
  float ch[4];
  float ci[4];
  float an[1];
  for (int bh = 0; bh < 1; bh++)
    an[bh] = 0.0f;

  int bo = get_local_id(0) % 32;

  __local float* cj = am + ce * (get_local_id(0) / 32) / sizeof(float);

  for (int bf = get_global_id(0); bf < cf; bf += get_global_size(0)) {
    int ai = bf - bo;
    int aj = ((32 < cf - ai) ? (32) : (cf - ai));

    for (int ck = 0; ck < 4; ck++)
      cj[bo + ck * aj] = by[bo + ck * aj + ai * 4];

    for (int ck = 0; ck < 4; ck++)
      cg[ck] = cj[ck + bo * 4];

    for (int ck = 0; ck < 4; ck++)
      cj[bo + ck * aj] = ca[bo + ck * aj + ai * 4];

    for (int ck = 0; ck < 4; ck++)
      ci[ck] = cj[ck + bo * 4];

    D(cg, ch, ci, cb + bf, an);

    for (int ck = 0; ck < 4; ck++)
      cj[ck + bo * 4] = ch[ck];

    for (int ck = 0; ck < 4; ck++)
      bz[bo + ck * aj + ai * 4] = cj[bo + ck * aj];

    for (int ck = 0; ck < 4; ck++)
      cj[ck + bo * 4] = ci[ck];

    for (int ck = 0; ck < 4; ck++)
      ca[bo + ck * aj + ai * 4] = cj[bo + ck * aj];
  }

  __local float bn[1600];

  for (int bh = 0; bh < 1; bh++)
    C(&cc[bh + get_group_id(0) * 1], an[bh], OP_INC, bn);
}

inline void F(__local float* a, __local float* b, __local float* cl, __local float* cm, __global float* bs, __global float* bu, __constant struct global_constants* g) {
  float h, i, k, cn, co, cp;

  k = 1.0f / bs[0];
  cn = k * bs[1];
  co = k * bs[2];
  cp = sqrt(g->gam * g->gm1 * (k * bs[3] - 0.5f * (cn * cn + co * co)));

  h = b[0] - a[0];
  i = b[1] - a[1];
  *bu = __clc_fabs(cn * i - co * h) + cp * sqrt(h * h + i * i);

  h = cl[0] - b[0];
  i = cl[1] - b[1];
  *bu += __clc_fabs(cn * i - co * h) + cp * sqrt(h * h + i * i);

  h = cm[0] - cl[0];
  i = cm[1] - cl[1];
  *bu += __clc_fabs(cn * i - co * h) + cp * sqrt(h * h + i * i);

  h = a[0] - cm[0];
  i = a[1] - cm[1];
  *bu += __clc_fabs(cn * i - co * h) + cp * sqrt(h * h + i * i);

  *bu = (*bu) / g->cfl;
}

__kernel void G(__global float* q, __global int* r, __global short* y, __global short* z, __global short* aa, __global short* ab, __global float* cc, __global float* ad, __global int* ae, __global int* af, int ag, __global int* ah, __global int* ai, __global int* aj, __global int* ak, __global int* al, __local float* am, __constant struct global_constants* g) {
  __global int* __local ao;
  __local int as;
  __local float* __local aw;
  __local int bc, bd;

  if (get_local_id(0) == 0) {
    int be = ah[get_group_id(0) + ag];

    bc = aj[be];
    bd = ai[be];

    as = ae[0 + be * 1];

    ao = r + af[0 + be * 1];

    int cq = 0;
    aw = am + cq / 4;
  }

  barrier(1);

  for (int bf = get_local_id(0); bf < as * 2; bf += get_local_size(0))
    aw[bf] = q[bf % 2 + ao[bf / 2] * 2];

  barrier(1);

  for (int bf = get_local_id(0); bf < bc; bf += get_local_size(0)) {
    F(aw + y[bf + bd] * 2, aw + z[bf + bd] * 2, aw + aa[bf + bd] * 2, aw + ab[bf + bd] * 2, cc + (bf + bd) * 4, ad + (bf + bd) * 1, g);
  }
}

inline void H(float* bs, float* br) {
  for (int bf = 0; bf < 4; bf++)
    br[bf] = bs[bf];
}

__kernel void I(__global float* by, __global float* bz, int ce, int cf, __local char* am) {
  float cg[4];
  float ch[4];
  int bo = get_local_id(0) % 32;

  __local float* cj = (__local float*)(am + ce * (get_local_id(0) / 32));

  for (int bf = get_global_id(0); bf < cf; bf += get_global_size(0)) {
    int ai = bf - bo;
    int aj = ((32 < cf - ai) ? (32) : (cf - ai));

    for (int ck = 0; ck < 4; ck++)
      cj[bo + ck * aj] = by[ai * 4 + bo + ck * aj];

    for (int ck = 0; ck < 4; ck++)
      cg[ck] = cj[bo * 4 + ck];
    H(cg, ch);
    for (int ck = 0; ck < 4; ck++)
      cj[ck + bo * 4] = ch[ck];

    for (int ck = 0; ck < 4; ck++)
      bz[bo + ck * aj + ai * 4] = cj[bo + ck * aj];
  }
}

inline void J(__local float* a, __local float* b, __local float* c, __local float* cr, __local float* d, __local float* cs, float* e, float* ct, __constant struct global_constants* g) {
  float h, i, j, k, l, m, n, o, p;
  h = a[0] - b[0];
  i = a[1] - b[1];
  k = 1.0f / c[0];
  l = g->gm1 * (c[3] - 0.5f * k * (c[1] * c[1] + c[2] * c[2]));
  m = k * (c[1] * i - c[2] * h);

  k = 1.0f / cr[0];
  n = g->gm1 * (cr[3] - 0.5f * k * (cr[1] * cr[1] + cr[2] * cr[2]));
  o = k * (cr[1] * i - cr[2] * h);

  j = 0.5f * ((*d) + (*cs)) * g->eps;

  p = 0.5f * (m * c[0] + o * cr[0]) + j * (c[0] - cr[0]);
  e[0] += p;
  ct[0] -= p;
  p = 0.5f * (m * c[1] + l * i + o * cr[1] + n * i) + j * (c[1] - cr[1]);
  e[1] += p;
  ct[1] -= p;
  p = 0.5f * (m * c[2] - l * h + o * cr[2] - n * h) + j * (c[2] - cr[2]);
  e[2] += p;
  ct[2] -= p;
  p = 0.5f * (m * (c[3] + l) + o * (cr[3] + n)) + j * (c[3] - cr[3]);
  e[3] += p;
  ct[3] -= p;
}

__kernel void K(__global float* q, __global int* r, __global float* s, __global int* t, __global float* u, __global int* v, __global float* w, __global int* x, __global short* y, __global short* z, __global short* aa, __global short* ab, __global short* ac, __global short* cu, __global short* cv, __global short* cw, __global int* ae, __global int* af, int ag, __global int* ah, __global int* ai, __global int* aj, __global int* ak, __global int* al, __local float* am,
                __constant struct global_constants* g) {
  float cx[4];
  float cy[4];

  __global int *__local ao, *__local ap, *__local aq, *__local ar;
  __local int as, at, au, av;
  __local float* __local aw;
  __local float* __local ax;
  __local float* __local ay;
  __local float* __local az;
  __local int ba, bb;
  __local int bc, bd;

  if (get_local_id(0) == 0) {
    int be = ah[get_group_id(0) + ag];

    bc = aj[be];
    bd = ai[be];

    ba = get_local_size(0) * (1 + (bc - 1) / get_local_size(0));
    bb = ak[be];

    as = ae[0 + be * 4];
    at = ae[1 + be * 4];
    au = ae[2 + be * 4];
    av = ae[3 + be * 4];

    ao = r + af[0 + be * 4];
    ap = t + af[1 + be * 4];
    aq = v + af[2 + be * 4];
    ar = x + af[3 + be * 4];

    int cq = 0;
    aw = am + cq / sizeof(float);
    cq += (((as * sizeof(float) * 2) + 15) & ~15);
    ax = am + cq / sizeof(float);
    cq += (((at * sizeof(float) * 4) + 15) & ~15);
    ay = am + cq / sizeof(float);
    cq += (((au * sizeof(float) * 1) + 15) & ~15);
    az = am + cq / sizeof(float);
  }
  barrier(1);

  for (int bf = get_local_id(0); bf < as * 2; bf += get_local_size(0))
    aw[bf] = q[bf % 2 + ao[bf / 2] * 2];
  for (int bf = get_local_id(0); bf < at * 4; bf += get_local_size(0))
    ax[bf] = s[bf % 4 + ap[bf / 4] * 4];
  for (int bf = get_local_id(0); bf < au * 1; bf += get_local_size(0))
    ay[bf] = u[bf % 1 + aq[bf / 1] * 1];
  for (int bf = get_local_id(0); bf < av * 4; bf += get_local_size(0))
    az[bf] = 0.0f;
  barrier(1);

  for (int bf = get_local_id(0); bf < ba; bf += get_local_size(0)) {
    int bg = -1;
    if (bf < bc) {
      for (int bh = 0; bh < 4; bh++)
        cx[bh] = 0.0f;
      for (int bh = 0; bh < 4; bh++)
        cy[bh] = 0.0f;

      J(aw + y[bf + bd] * 2, aw + z[bf + bd] * 2, ax + aa[bf + bd] * 4, ax + ab[bf + bd] * 4, ay + ac[bf + bd] * 1, ay + cu[bf + bd] * 1, cx, cy, g);
      bg = al[bf + bd];
    }

    int cz = cv[bf + bd];
    int da = cw[bf + bd];
    for (int bj = 0; bj < bb; bj++) {
      if (bg == bj) {
        for (int bh = 0; bh < 4; bh++)
          az[bh + cz * 4] += cx[bh];
        for (int bh = 0; bh < 4; bh++)
          az[bh + da * 4] += cy[bh];
      }
      barrier(1);
    }
  }

  for (int bf = get_local_id(0); bf < av * 4; bf += get_local_size(0))
    w[bf % 4 + ar[bf / 4] * 4] += az[bf];
}