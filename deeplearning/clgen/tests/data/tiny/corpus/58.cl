__kernel void A(const int a, const int b, const int c, const int d, const int e, const int f, const int g, const int h, const int i, __global const float* j, __global const uchar* k, __global const float* l, __global float* m, __local float* n) {
  const int o = get_local_id(0);
  const int p = o / 24;
  const int q = get_group_id(0) * f + p;
  const int r = q / e;
  const int s = q - r * e;

  const int t = o - p * 24;
  const int u = get_local_id(1);

  const int v = t / 12;
  const int w = u;
  const int x = t - v * 12;

  __local float* y = n + p * c * (2 * 2 * 12 + 2 * 2);
  __local float* z = y + c * (2 * 2 * 12);

  const int aa = s * a + (v << 2) + x;
  const int ab = r * b + (w << 2);

  __global const float* ac = (q < g) ? j + ab * h + (aa << 1) : j;
  __global const uchar* ad = (q < g) ? k + ab * i + (aa << 1) : k;

  __local float* ae = y + 12 * (w * 2 + v) + x;
  for (int af = 0; af < c; ++af)
    ae[af * 48] = 0.f;

  const int ag = -4 + x - 4 * v;
  const int ah = ag - 4 * (1 - 2 * v);

  const int ai = -4 - 4 * u;
  for (int aj = ai; aj < ai + 12; ++aj) {
        float2 ak = (float2) (aac        uchar2 al = (uchar2) ad       ac += h;
        ad += i;

        int am = aj - 4 * (1 - 2 * w);

        int an = (am + 8) * 16 + (ah + 8);
        float ao = l[an];
        an = (aj + 8) * 16 + (ag + 8);
        float ap = l[256+an];

        ae[al.x * 48] += ao * ap * ak.x;
        ae[al.y * 48] += ao * ap * ak.y;
  }
  barrier(1);

  volatile __local float* aq = ae;
  for (int af = 0; af < c; ++af, aq += 48) {
    if (x < 6)
      aq[0] += aq[6];
    barrier(1);
    if (x < 3)
      aq[0] += aq[3];

    if (x == 0)
      z[(v * 2 + w) * c + af] = aq[0] + aq[1] + aq[2];
  }

  barrier(1);

  int ar = (w * 2 + v) * 12 + x;
  if ((ar < d) && (q < g)) {
    __global float* as = m + (r * e + s) * d;
    as[ar] = z[ar];
  }
}

__kernel void B(__global float* m, const float at, __local float* au) {
  const int ar = get_local_id(0);
  const int q = get_global_id(0);
  const int av = ar / 36;
  const int aw = av * 36;
  const int ax = ar - aw;

  float ay = m[q];
  au[ar] = ay * ay;
  barrier(1);

  __local float* n = au + aw;
  float az = n[ax];
  if (ax < 18)
    n[ax] = az = az + n[ax + 18];
  barrier(1);
  if (ax < 9)
    n[ax] = az = az + n[ax + 9];
  barrier(1);
  if (ax < 4)
    n[ax] = az + n[ax + 4];
  barrier(1);
  az = n[0] + n[1] + n[2] + n[3] + n[8];

  ay = ay / (sqrt(az) + 3.6f);
  ay = min(ay, at);

  barrier(1);
  au[ar] = ay * ay;
  barrier(1);

  az = n[ax];
  if (ax < 18)
    n[ax] = az = az + n[ax + 18];
  barrier(1);
  if (ax < 9)
    n[ax] = az = az + n[ax + 9];
  barrier(1);
  if (ax < 4)
    n[ax] = az + n[ax + 4];
  barrier(1);
  az = n[0] + n[1] + n[2] + n[3] + n[8];

  m[q] = ay / (sqrt(az) + 1e-3f);
}

inline float C(volatile __local float* n, int ba) {
  unsigned int ar = get_local_id(0);
  float az = n[ar];

  if (ba >= 512) {
    if (ar < 256)
      n[ar] = az = az + n[ar + 256];
    barrier(1);
  }
  if (ba >= 256) {
    if (ar < 128)
      n[ar] = az = az + n[ar + 128];
    barrier(1);
  }
  if (ba >= 128) {
    if (ar < 64)
      n[ar] = az = az + n[ar + 64];
    barrier(1);
  }
  if (ar < 32) {
    if (ba >= 64)
      n[ar] = az = az + n[ar + 32];
  }
  barrier(1);
  if (ar < 16) {
    if (ba >= 32)
      n[ar] = az = az + n[ar + 16];
    if (ba >= 16)
      n[ar] = az = az + n[ar + 8];
    if (ba >= 8)
      n[ar] = az = az + n[ar + 4];
    if (ba >= 4)
      n[ar] = az = az + n[ar + 2];
    if (ba >= 2)
      n[ar] = az = az + n[ar + 1];
  }

  return az;
}

__kernel void D(const int bb, const int bc, const int e, __global float* m, const float at, __local float* au) {
  const int ar = get_local_id(0);
  const int s = get_group_id(0);
  const int r = get_group_id(1);

  __global float* ae = m + (r * e + s) * bc + ar;

  float ay = 0.f;
  if (ar < bc)
    ay = ae[0];

  au[ar] = ay * ay;

  barrier(1);
  float az = C(au, bb);

  float bd = 1.0f / (sqrt(az) + 0.1f * bc);
  ay = min(ay * bd, at);

  barrier(1);
  au[ar] = ay * ay;

  barrier(1);
  az = C(au, bb);
  bd = 1.0f / (sqrt(az) + 1e-3f);

  if (ar < bc)
    ae[0] = ay * bd;
}

__kernel void E(const int be, const int bf, const int d, const int bg, const int e, const int bh, const int bi, __global const float* m, __global const float* bj, float bk, float at, __global uchar* bl) {
  const int ar = get_local_id(0);
  const int s = get_group_id(0);
  const int r = get_group_id(1);

  __global const float* ae = m + (r * bi * e + s * bh) * d;

  float bm = 0.f;

  for (int bn = 0; bn < bf; bn++) {
    bm += bj[bn * be + ar] * ae[bn * e * d + ar];
  }

  __local float bo[180];

  bo[ar] = bm;

  barrier(1);

  if (ar < 90)
    bo[ar] = bm = bm + bo[ar + 90];
  barrier(1);

  if (ar < 45)
    bo[ar] = bm = bm + bo[ar + 45];
  barrier(1);

  volatile __local float* n = bo;
  if (ar < 13) {
    n[ar] = bm = bm + n[ar + 32];
  }

  barrier(1);

  if (ar < 16) {
    n[ar] = bm = bm + n[ar + 16];
    n[ar] = bm = bm + n[ar + 8];
    n[ar] = bm = bm + n[ar + 4];
    n[ar] = bm = bm + n[ar + 2];
  }

  if (ar == 0) {
    bm = bm + n[ar + 1];
    bl[r * bg + s] = (bm + bk >= at);
  }
}

__kernel void F(const int be, const int bf, const int d, const int bg, const int e, const int bh, const int bi, __global const float* m, __global const float* bj, float bk, float at, __global uchar* bl) {
  const int ar = get_local_id(0);
  const int s = get_group_id(0);
  const int r = get_group_id(1);

  __global const float* ae = m + (r * bi * e + s * bh) * d;

  float bm = 0.f;
  if (ar < be) {
    for (int bn = 0; bn < bf; bn++)
      bm += bj[bn * be + ar] * ae[bn * e * d + ar];
  }

  __local float bo[256];

  bo[ar] = bm;

  barrier(1);

  if (ar < 128)
    bo[ar] = bm = bm + bo[ar + 128];
  barrier(1);

  if (ar < 64)
    bo[ar] = bm = bm + bo[ar + 64];
  barrier(1);

  volatile __local float* n = bo;
  if (ar < 32) {
    n[ar] = bm = bm + n[ar + 32];
  }
  barrier(1);
  if (ar < 16) {
    n[ar] = bm = bm + n[ar + 16];
    n[ar] = bm = bm + n[ar + 8];
    n[ar] = bm = bm + n[ar + 4];
    n[ar] = bm = bm + n[ar + 2];
  }

  if (ar == 0) {
    bm = bm + n[ar + 1];
    bl[r * bg + s] = (bm + bk >= at);
  }
}

__kernel void G(const int bp, const int be, const int d, const int bg, const int e, const int bh, const int bi, __global const float* m, __global const float* bj, float bk, float at, __global uchar* bl) {
  const int ar = get_local_id(0);
  const int s = get_group_id(0);
  const int r = get_group_id(1);

  __global const float* ae = m + (r * bi * e + s * bh) * d;

  float bm = 0.f;
  for (int bn = ar; bn < bp; bn += 256) {
    int ab = bn / be;
    int aa = bn - ab * be;
    bm += bj[bn] * ae[ab * e * d + aa];
  }

  __local float bo[256];

  bo[ar] = bm;

  barrier(1);

  if (ar < 128)
    bo[ar] = bm = bm + bo[ar + 128];
  barrier(1);

  if (ar < 64)
    bo[ar] = bm = bm + bo[ar + 64];
  barrier(1);

  volatile __local float* n = bo;
  if (ar < 32) {
    n[ar] = bm = bm + n[ar + 32];
  }
  barrier(1);
  if (ar < 16) {
    n[ar] = bm = bm + n[ar + 16];
    n[ar] = bm = bm + n[ar + 8];
    n[ar] = bm = bm + n[ar + 4];
    n[ar] = bm = bm + n[ar + 2];
  }

  if (ar == 0) {
    n[ar] = bm = bm + n[ar + 1];
    bl[r * bg + s] = (bm + bk >= at);
  }
}

__kernel void H(const int d, const int bq, const int bp, const int be, const int e, const int bh, const int bi, __global const float* m, __global float* br) {
  int ar = get_local_id(0);
  int s = get_group_id(0);
  int r = get_group_id(1);

  __global const float* ae = m + (r * bi * e + s * bh) * d;

  __global float* bs = br + (r * get_num_groups(0) + s) * bq;

  for (int bn = ar; bn < bp; bn += 256) {
    int ab = bn / be;
    int aa = bn - ab * be;
    bs[bn] = ae[ab * e * d + aa];
  }
}

__kernel void I(const int d, const int bq, const int bp, const int bt, const int bu, const int e, const int bh, const int bi, __global const float* m, __global float* br) {
  int ar = get_local_id(0);
  int s = get_group_id(0);
  int r = get_group_id(1);

  __global const float* ae = m + (r * bi * e + s * bh) * d;

  __global float* bs = br + (r * get_num_groups(0) + s) * bq;

  for (int bn = ar; bn < bp; bn += 256) {
    int bv = bn / d;
    int bw = bn - bv * d;

    int bx = bv / bt;
    int by = bv - bx * bt;

    bs[(by * bu + bx) * d + bw] = ae[(bx * e + by) * d + bw];
  }
}

__kernel void J(const int bz, const int ca, const int cb, const int h, const int i, const __global uchar4* cc, __global float* j, __global uchar* k, const float cd, const char ce, const int c) {
  const int by = get_global_id(0);
  const int ar = get_local_id(0);
  const int cf = get_local_size(0);
  const int r = get_group_id(1);

  __global const uchar4* cg = cc + r * cb;

  __local float ch[(256 + 2) * 3];

  uchar4 ci;
  if (by < ca)
    ci = cg[by];
  else
    ci = cg[ca - 2];

  ch[ar + 1] = ci.x;
  ch[ar + 1 + (256 + 2)] = ci.y;
  ch[ar + 1 + 2 * (256 + 2)] = ci.z;

  if (ar == 0) {
    ci = cg[max(by - 1, 1)];
    ch[0] = ci.x;
    ch[(256 + 2)] = ci.y;
    ch[2 * (256 + 2)] = ci.z;
  }

  if (ar == cf - 1) {
    ci = cg[min(by + 1, ca - 2)];
    ch[cf + 1] = ci.x;
    ch[cf + 1 + (256 + 2)] = ci.y;
    ch[cf + 1 + 2 * (256 + 2)] = ci.z;
  }

  barrier(1);
  if (by < ca) {
        float4 cj = (float4) ar,ar+ (256 + 2)],
           ar+ 2 * (256 + 2)], 0);
        float4 ck = (float4) ar+ 2],ar+ 2 + (256 + 2)],
           ar+ 2 + 2 * (256 + 2)], 0);

        float4 cl;
        if (ce == 1)
          cl = sqrt(ck) - sqrt(cj);
        else
          cl = ck - cj;

        float4 cm = (float4)0.f;

        if (r > 0 && r < bz - 1) {
          cj = convert_float4(cc[(r - 1) * cb + by].xyzw);
          ck = convert_float4(cc[(r + 1) * cb + by].xyzw);

          if (ce == 1)
            cm = sqrt(ck) - sqrt(cj);
          else
            cm = ck - cj;
        }

        float4 cn = hypot(cl, cm);
        float co = cl.x;
        float cp = cm.x;

        float cq = cn.x;
        if (cq < cn.y) {
          co = cl.y;
          cp = cm.y;
          cq = cn.y;
        }

        if (cq < cn.z) {
          co = cl.z;
          cp = cm.z;
          cq = cn.z;
        }

        float cr = (atan2(cp, co) + 0x1.921fb6p+1f) * cd - 0.5f;
        int cs = (int)__clc_floor(cr);
        cr -= cs;
        cs = (cs + c) % c;

        k[(r * i + by) << 1] = cs;
        k[((r * i + by) << 1) + 1] = (cs + 1) % c;
        j[(r * h + by) << 1] = cq * (1.f - cr);
        j[((r * h + by) << 1) + 1] = cq * cr;
  }
}

__kernel void K(const int bz, const int ca, const int cb, const int h, const int i, __global const uchar* cc, __global float* j, __global uchar* k, const float cd, const char ce, const int c) {
  const int by = get_global_id(0);
  const int ar = get_local_id(0);
  const int cf = get_local_size(0);
  const int r = get_group_id(1);

  __global const uchar* cg = cc + r * cb;

  __local float ch[256 + 2];

  if (by < ca)
    ch[ar + 1] = cg[by];
  else
    ch[ar + 1] = cg[ca - 2];

  if (ar == 0)
    ch[0] = cg[max(by - 1, 1)];

  if (ar == cf - 1)
    ch[cf + 1] = cg[min(by + 1, ca - 2)];

  barrier(1);
  if (by < ca) {
    float cl;

    if (ce == 1)
      cl = sqrt(ch[ar + 2]) - sqrt(ch[ar]);
    else
      cl = ch[ar + 2] - ch[ar];

    float cm = 0.f;
    if (r > 0 && r < bz - 1) {
      float cj = (float)cc[(r + 1) * cb + by];
      float ck = (float)cc[(r - 1) * cb + by];
      if (ce == 1)
        cm = sqrt(cj) - sqrt(ck);
      else
        cm = cj - ck;
    }
    float cn = hypot(cl, cm);

    float cr = (atan2(cm, cl) + 0x1.921fb6p+1f) * cd - 0.5f;
    int cs = (int)__clc_floor(cr);
    cr -= cs;
    cs = (cs + c) % c;

    k[(r * i + by) << 1] = cs;
    k[((r * i + by) << 1) + 1] = (cs + 1) % c;
    j[(r * h + by) << 1] = cn * (1.f - cr);
    j[((r * h + by) << 1) + 1] = cn * cr;
  }
}