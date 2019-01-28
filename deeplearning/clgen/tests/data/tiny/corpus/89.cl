typedef struct {
  float len;
  float arg;
} ComplexPolar;

typedef float2 Complex;

void A(const __global float2* a, unsigned int b, unsigned int c, uint2 d, int2 e, int2 f, __local volatile ComplexPolar* g) {
  int2 h = (int2)(get_local_id(0), get_local_id(1));

  for (int i = 0; i < f.x; i += get_local_size(0)) {
    for (int j = 0; j < f.y; j += get_local_size(1)) {
      int2 k = (int2)(i, j) + h;

      bool l = all(k < f);

      if (l) {
        int2 m = e + k;

        bool n = all((int2)(0, 0) <= m) & all(m < convert_int2(d));

        float2 o = n ? a[m.x + m.y * b] : (float2)(0.f, 0.f);

        size_t p = k.y * f.x + k.x;
        g[p].len = fast_length(o);
        g[p].arg = atan2(o.y, o.x);
      }
    }
  }
}

Complex B(ComplexPolar q, ComplexPolar r, ComplexPolar s, float t, Complex u) {
  float v = remainder(q.arg + t - r.arg, 2 * 0x1.921fb6p+1f);
  float w = remainder(s.arg - t - r.arg, 2 * 0x1.921fb6p+1f);
  float x = 0.5f * (w - v);

  return (float2)(0.5f * (slen - qlen), r x);
}

typedef struct {
  float s00;
  Complex s01;
  float s11;
} Matrix2x2ConjSymmetric;

void C(__local Matrix2x2ConjSymmetric* y) {
  y->s00 = 0.f;
  y->s01 = (Complex)(0.f, 0.f);
  y->s11 = 0.f;
}

void D(__private Matrix2x2ConjSymmetric* y, __local Matrix2x2ConjSymmetric* a, float z) {
  y->s00 += z * a->s00;
  y->s01 += (float2)z * a->s01;
  y->s11 += z * a->s11;
}

float2 E(__private const Matrix2x2ConjSymmetric* y) {
  float aa = sqrt((y->s00 + y->s11) * (y->s00 + y->s11) - 4 * (y->s00 * y->s11 - dot(y->s01, y->s01)));

    return (float2) (0.5 * (y->s00 + y->s11 - aaa),
         al     0.5 * (y->s00 + y->s11 + tocal Matrix2x2ConjSymmetric* y, Compt0 += dot(ty t  t  am->s11 += dot(ac, ac);
}

t_work_gtnst unsigt
     tnt ag,antint aj,
 t      t
    cot1fb6p+1f t      t+1f / 2t       | t      tt2 g = t

    ao ComplexPolat+4][32 +4tocal float ap [8 +2][32 +2];



    __local Matrix2x2ConjSymmetric aq[8 +2][32 +2];

    for (int ar = 0; ar < 2; ++ar) {
  for (int as = 0; as < 2; ++as) {
    int2 at = an + (int2)(arr * 32, ass * 8);

    if (all(at < (int2)(32 + 2, 8 + 2))) {
      C(&aq[at.y][at.x]);

      ap[at.y][at.x] = 0.f;
    }
  }
    }

    int2 e = (int2)
        (get_group_id(0) * get_local_size(0) - 2,
         get_group_id(1) * get_local_size(1) - 2);

    int2 f = (int2) (32 +4, 8 +4);


    for (int au = 0; au < 6; ++au) {

  A(ad + ae + au * af, ag, ah, (uint2)aj e, f, &ao[0][0]);

  barrier(1);

  for (int ar = 0; ar < 2; ++ar) {
    for (int as = 0; as < 2; ++as) {
      int2 at = an + (int2)(arr * 32, ass * 8);

      if (all(at < (int2)(32 + 2, 8 + 2))) {
        ap[at.y][at.x] += ao[at.y + 1][at.x + 1].len * ao[at.y + 1][at.x + 1].len;

        Complex ab = B(ao[at.y + 1][at.x], ao[at.y + 1][at.x + 1], ao[at.y + 1][at.x + 2], t[au].x, ak[au][0]);

        Complex ac = B(ao[at.y][at.x + 1], ao[at.y + 1][at.x + 1], ao[at.y + 2][at.x + 1], t[au].y, ak[au][1]);

        F(&aq[at.y][at.x], ab, ac);
      }
    }
  }

  barrier(1);

    }

    if (all(am < get_image_dim(g))) {

  Matrix2x2ConjSymmetric av = {0, (float2)0, 0};

  float aw[] = {0.9, 1, 0.9};

  float ax = 0.f;

  for (int au = 0; au < 3; ++au)
    for (int ay = 0; ay < 3; ++ay) {
      D(&av, &aq[an.y + au][an.x + ay], aw[au] * aw[ay]);

      ax += aw[au] * aw[ay] * ap[an.y + au][an.x + ay];
    }

  float2 az = E(&av);

  float ba = az.s0 / (az.s1 + 0.001f);
  float bb = ax;

  write_imagef(g, am, bb);
    }
}