inline double A(double a, double b, double c) {
  return sqrt(a * a + b * b + c * c);
}

inline void B(double d, double e, double f, double g, double h, double i, double* a, double* b, double* c) {
  *a = e * i - h * f;
  *b = f * g - i * d;
  *c = d * h - g * e;
}

inline double C(double* j) {
  return j[0] * j[4] * j[8] + j[1] * j[5] * j[6] + j[2] * j[3] * j[7] - j[0] * j[5] * j[7] - j[1] * j[3] * j[8] - j[2] * j[4] * j[6];
}

inline double D(double a, double b, double c, double d, double e, double f, double g, double h, double i, double k, double l, double m) {
  double n[9] = {d - a, e - b, f - c, g - a, h - b, i - c, k - a, l - b, m - c};
  return C(n);
}

inline void E(int o, int* a, int* b, int* c) {
  *a = !!(o & 4);
  *b = !!(o & 2);
  *c = o & 1;
}

inline void F(int o, int* d, int* e, int* f, int* g, int* h, int* i) {
  switch (o / 3) {
    case 0: {
      *d = *e = *f = 0;
    } break;
    case 1: {
      *d = *e = 1;
      *f = 0;
    } break;
    case 2: {
      *d = *f = 1;
      *e = 0;
    } break;
    case 3: {
      *e = *f = 1;
      *d = 0;
    } break;
  }

  *g = *d;
  *h = *e;
  *i = *f;

  switch (o % 3) {
    case 0:
      *g = 1 - *g;
      break;
    case 1:
      *h = 1 - *h;
      break;
    case 2:
      *i = 1 - *i;
      break;
  }
}

inline void G(int o, int* p, int* q) {
  switch (o) {
    case 0: {
      *p = 0;
      *q = 1;
    } break;
    case 1: {
      *p = 0;
      *q = 2;
    } break;
    case 2: {
      *p = 0;
      *q = 3;
    } break;
    case 3: {
      *p = 1;
      *q = 2;
    } break;
    case 4: {
      *p = 1;
      *q = 3;
    } break;
    case 5: {
      *p = 2;
      *q = 3;
    } break;
  }
}

inline int H(double j, double r) {
  return j < -r ? -1 : j > r;
}

inline bool I(double d, double e, double f, double g, double h, double i, double k, double l, double m, double* s, double* t, double* u, double v, double w, double x, double y, double r) {
  double a, b, c;
  B(g - d, h - e, i - f, k - d, l - e, m - f, &a, &b, &c);
  if (!H(A(a, b, c), r))
    return 0;

  char z = 0, aa = 0;
  char ab = 0, ac = 0;

  for (int ad = 0; ad < 4; ad++) {
    double ae = D(s[ad], t[ad], u[ad], d, e, f, g, h, i, k, l, m);
    int af = H(ae, r);
    if (af > 0)
      z = 1;
    if (af < 0)
      aa = 1;
    if (z * aa)
      return 0;
  }

  for (int ag = 0; ag <= 1; ag++)
    for (int ah = 0; ah <= 1; ah++)
      for (int ai = 0; ai <= 1; ai++) {
        a = v + y * ag;
        b = w + y * ah;
        c = x + y * ai;
        double ae = D(a, b, c, d, e, f, g, h, i, k, l, m);
        int af = H(ae, r);
        if (af > 0)
          ab = 1;
        if (af < 0)
          ac = 1;
        if (ab * ac)
          return 0;
      }

  if (z && ab || aa && ac)
    return 0;
  return 1;
}

__kernel void J(__global double* aj, __global int* ak, __global int* al, __global int* am, __global char* an, int ao, int ap, double aq, double ar, double as, double y, double r, int at

                ) {
  int au = get_global_id(0);

  if (au < at) {
    int av = al[au];
    int aw = am[au];

    int ax = ak[av << 2];
    int ay = ak[(av << 2) + 1];
    int az = ak[(av << 2) + 2];
    int ba = ak[(av << 2) + 3];

    double s[4], t[4], u[4];

    s[0] = aj[ax * 3];
    t[0] = aj[ax * 3 + 1];
    u[0] = aj[ax * 3 + 2];

    s[1] = aj[ay * 3];
    t[1] = aj[ay * 3 + 1];
    u[1] = aj[ay * 3 + 2];

    s[2] = aj[az * 3];
    t[2] = aj[az * 3 + 1];
    u[2] = aj[az * 3 + 2];

    s[3] = aj[ba * 3];
    t[3] = aj[ba * 3 + 1];
    u[3] = aj[ba * 3 + 2];

    int bb = aw % ap;
    int bc = aw / ap;
    int bd = bc % ao;
    int be = bc / ao;

    double bf = aq + be * y;
    double bg = ar + bd * y;
    double bh = as + bb * y;

    char bi = 0;

    for (int ad = 0; !bi && ad < 4; ad++) {
      double d = s[ad];
      double e = t[ad];
      double f = u[ad];
      for (int bj = 0; bj < 12; bj++) {
        int bk, bl, bm, bn, bo, bp;
        F(bj, &bk, &bl, &bm, &bn, &bo, &bp);

        double g = bf + bk * y;
        double h = bg + bl * y;
        double i = bh + bm * y;

        double k = bf + bn * y;
        double l = bg + bo * y;
        double m = bh + bp * y;

        if (I(d, e, f, g, h, i, k, l, m, s, t, u, bf, bg, bh, y, r)) {
          bi = 1;
          break;
        }
      }
    }

    for (int ad = 0; !bi && ad < 6; ad++) {
      int p, q;
      G(ad, &p, &q);

      double d = s[p];
      double e = t[p];
      double f = u[p];

      double g = s[q];
      double h = t[q];
      double i = u[q];

      for (int bj = 0; bj < 8; bj++) {
        int ag, ah, ai;
        E(bj, &ag, &ah, &ai);

        double k = bf + ag * y;
        double l = bg + ah * y;
        double m = bh + ai * y;

        if (I(d, e, f, g, h, i, k, l, m, s, t, u, bf, bg, bh, y, r)) {
          bi = 1;
          break;
        }
      }
    }

    an[au] = !bi;
  }
}