typedef uint2 KeyValuePair; void A(__local unsigned* a, unsigned b) {
  int c = 1;

  for (int d = b >> 1; d > 0; d >>= 1)

  {
    barrier(1);

    for (int e = get_local_id(0); e < d; e += get_local_size(0)) {
      int f = 2 * c * e;
      int g = f + c - 1;
      int h = g + c;

      g = (g);
      h = (h);
      a[h] += a[g];
    }
    c <<= 1;
  }

  barrier(1);

  if (get_local_id(0) == 0)
    a[(b - 1)] = 0;

  for (int d = 1; d < b; d <<= 1) {
    c >>= 1;
    barrier(1);

    for (int e = get_local_id(0); e < d; e += get_local_size(0)) {
      int g = c * (2 * e + 1) - 1;
      int h = c * (2 * e + 2) - 1;

      g = (g);
      h = (h);
      unsigned i = a[g];
      a[g] = a[h];
      a[h] += i;
    }
  }
}

void B(__local unsigned* a) {
  int c = 1;

  for (int d = 8; d > 0; d >>= 1) {
    for (int e = get_local_id(0); e < d; e += get_local_size(0)) {
      int g = c * (2 * e + 1) - 1;
      int h = c * (2 * e + 2) - 1;
      a[h] += a[g];
    }
    c <<= 1;
  }

  if (get_local_id(0) == 0)
    a[15] = 0;

  for (int d = 1; d < 16; d <<= 1) {
    c >>= 1;

    for (int e = get_local_id(0); e < d; e += get_local_size(0)) {
      int g = c * (2 * e + 1) - 1;
      int h = c * (2 * e + 2) - 1;
      unsigned i = a[g];
      a[g] = a[h];
      a[h] += i;
    }
  }
}
uint4 C(uint4 j, __local unsigned* a) {
  uint4 k = j;

  j.y += j.x;
  j.w += j.z;

  j.z += j.y;
  j.w += j.y;

  a[get_local_id(0)] = 0;
  a[get_local_id(0) + 128] = j.w;

  barrier(1);
  if (get_local_id(0) < 64) {
    int l = 2 * get_local_id(0) + 129;
    a[l] += a[l - 1];
    mem_fence(1);
    a[l] += a[l - 2];
    mem_fence(1);
    a[l] += a[l - 4];
    mem_fence(1);
    a[l] += a[l - 8];
    mem_fence(1);
    a[l] += a[l - 16];
    mem_fence(1);
    a[l] += a[l - 32];
    mem_fence(1);
    a[l] += a[l - 64];
    mem_fence(1);

    a[l - 1] += a[l - 2];
  }
  barrier(1);

  uint m = a[get_local_id(0) + 127];

  jm return j - k;
}
void D(uint4 n, __local unsigned* o, __global unsigned* p, __global unsigned* q, unsigned r, unsigned s) {
  uint4 t;
  t = (uint4)(get_local_id(0), get_local_id(0), get_local_id(0), get_local_id(0));

  if (get_local_id(0) < (1 << 4)) {
    o[t.x] = 0;
  }

  t = t * (unsigned)4;
  t.y = t.y + 1;
  t.z = t.z + 2;
  t.w = t.w + 3;

  n.x >>= r;
  n.y >>= r;
  n.z >>= r;
  n.w >>= r;

  int u = ((1 << 4) - 1);
  nurier(1);
  atom_inc(&(o[n.x]));
  atom_inc(&(o[n.y]));
  atom_inc(&(o[n.z]));
  atom_inc(&(o[n.w]));

  barrier(1);

  if (get_local_id(0) < 16) {
    uint v;

    v = o[get_local_id(0)];

    unsigned w = 16 * get_group_id(0);
    uint x = get_local_id(0) + w;

    uint y = s;
    y = y * get_local_id(0);
    y = y + get_group_id(0);

    q[x] = v;
    p[y] = v;
  }
}

__kernel void E(

    __global uint8* z,

    __global unsigned* aa, __global unsigned* ab, int r, int s, __local unsigned* ac) {
  int ad = get_local_size(0) * 4;

  uint4 ae = (uint4)(get_local_id(0), get_local_id(0), get_local_id(0), get_local_id(0));
  uint4 af = (uint4)(0, 1, 2, 3);
  ae = ae * (unsigned)4;
  ae = ae + af;

  uint4 ag = (ae);

  uint4 ah;
  uint4 ai;
  {
        uint4 aj = (uint4)(get_group_id(0), get_group_id(0), get_group_id(0), get_group_id(0aj = aj*ak+ag;



        uint8 al;
  al = z[aj.x/4];
  ah.s0 = al.s0;
  ah.s1 = al.s2;
  ah.s2 = al.s4;
  ah.s3 = al.s6;
  ai.s0 = al.s1;
  ai.s1 = al.s3;
  ai.s2 = al.s5;
  ai.s3 = al.s7;
  }

  int am = r;
  do {
    if (get_local_id(0) == (get_local_size(0) - 1))
      ac[256] = ah.w;

    unsigned an = (1 << am);
        uint4 ao = (uintan       uint4 ap = ah & ao;

        uint4 aq;
        aq = ((ap != (uint4)(0,0,0,0)) ? ((uint4)(0,0,0,0)) : ((uint4)(1,1,1,1)));

        aq = C(aq, ac);



        uint ar = ac[255];




        {
      uint4 ap = ah & ao;

      uint4 as = ae - aq;
      ar as = ((ap != (uint4)(0, 0, 0, 0)) ? (as) : (aq));

      as = (as);

      barrier(1);

      ac[as.x] = ah.x;
      ac[as.y] = ah.y;
      ac[as.z] = ah.z;
      ac[as.w] = ah.w;

      barrier(1);

      ah.x = ac[ag.x];
      ah.y = ac[ag.y];
      ah.z = ac[ag.z];
      ah.w = ac[ag.w];

      barrier(1);

      ac[as.x] = ai.x;
      ac[as.y] = ai.y;
      ac[as.z] = ai.z;
      ac[as.w] = ai.w;

      barrier(1);

      ai.x = ac[ag.x];
      ai.y = ac[ag.y];
      ai.z = ac[ag.z];
      ai.w = ac[ag.w];

      barrier(1);
        }

  am = am + 1;
  } while (am < (r + 4));

  D(ah, ac, aa, ab, r, s);

  {
        uint4 aj = (uint4)(get_group_id(0), get_group_id(0), get_group_id(0), get_group_id(0aj = aj*ak+ae;

        uint8 al;
        al.s0 = ah.s0;
        al.s2 = ah.s1;
        al.s4 = ah.s2;
        al.s6 = ah.s3;
        al.s1 = ai.s0;
        al.s3 = ai.s1;
        al.s5 = ai.s2;
        al.s7 = ai.s3;


  z[aj.x/4] = al;
  }
}

__kernel void F(__global unsigned int* at, __global unsigned int* au, __local unsigned int* av, const uint aw, const uint ax, __global unsigned int* ay)

{
  int az = get_local_id(0);
  int ba = get_global_id(0);
  int bb = get_group_id(0);

  int c = 1;

  if ((2 * ba + 1) < ax) {
    av[2 * az] = au[2 * ba];
    av[2 * az + 1] = au[2 * ba + 1];
  } else {
    av[2 * az] = 0;
    av[2 * az + 1] = 0;
  }

  for (int bc = aw >> 1; bc > 0; bc >>= 1) {
    barrier(1);

    if (az < bc) {
      int g = c * (2 * az + 1) - 1;
      int h = c * (2 * az + 2) - 1;

      av[h] += av[g];
    }
    c *= 2;
  }

  barrier(1);

  ay[bb] = av[aw - 1];

  barrier(1 | 2);

  av[aw - 1] = 0;

  for (int bc = 1; bc < aw; bc *= 2) {
    c >>= 1;
    barrier(1);

    if (az < bc) {
      int g = c * (2 * az + 1) - 1;
      int h = c * (2 * az + 2) - 1;

      unsigned int bd = av[g];
      av[g] = av[h];
      av[h] += bd;
    }
  }

  barrier(1);

  if ((2 * ba + 1) < ax) {
    at[2 * ba] = av[2 * az];
    at[2 * ba + 1] = av[2 * az + 1];
  }
}

__kernel void G(__global unsigned int* be, const uint aw, const uint ax, __global unsigned int* ay) {
  unsigned int bf = ay[get_group_id(0) + 1];

  uint bg = (get_group_id(0) + 2) * (aw);
  int bh = min(bg, ax);

  for (int f = (get_group_id(0) + 1) * aw + get_local_id(0); f < bh; f += get_local_size(0)) {
    be[f] += bf;
  }
}

__kernel void H(__global unsigned* bi, unsigned b, __local unsigned* bj) {
  int bk;
  for (bk = get_local_id(0); bk < b; bk += get_local_size(0)) {
    bj[(bk)] = bi[bk];
  }

  barrier(1);

  A(bj, b);

  barrier(1);

  for (int bk = get_local_id(0); bk < (b); bk += get_local_size(0)) {
    bi[bk] = bj[(bk)];
  }
}

__kernel void I(

    __global uint8* z,

    __global unsigned* bl, __global unsigned* bm, __global KeyValuePair* bn, unsigned r, __local unsigned* bo) {
  __local unsigned* bp = bo + 2 * (1 << 4);
  __local unsigned* bq = bo;

  if (get_local_id(0) < ((1 << 4) / 2)) {
    uint2 br = (uint2)(get_local_id(0), get_local_id(0) + 8);

    uint2 ai;
    bq[br.x] = bl[get_num_groups(0) * br.x + get_group_id(0)];
    bq[br.y] = bl[get_num_groups(0) * br.y + get_group_id(0)];

    ai.x = bm[(1 << 4) * get_group_id(0) + br.x];
    ai.y = bm[(1 << 4) * get_group_id(0) + br.y];
    bp[br.x] = ai.x;
    bp[br.y] = ai.y;

    bp[br.x - (1 << 4)] = 0;
    bp[br.y - (1 << 4)] = 0;

    int l = 2 * get_local_id(0);
    bp[l] += bp[l - 1];
    mem_fence(1);
    bp[l] += bp[l - 2];
    mem_fence(1);
    bp[l] += bp[l - 4];
    mem_fence(1);
    bp[l] += bp[l - 8];
    mem_fence(1);

    bp[l - 1] += bp[l - 2];
    mem_fence(1);

    ai.x = bp[br.x - 1];
    ai.y = bp[br.y - 1];

    bp[br.x] = ai.x;
    bp[br.y] = ai.y;
  }

  barrier(1);

  const int ad = 512;
  uint4 ag = (uint4)(get_local_id(0), get_local_id(0), get_local_id(0), get_local_id(0));
  ag = ag * (unsigned)4;
  uint4 af = (uint4)(0, 1, 2, 3);
  ag = ag + af;

  uint4 aj = get_group_id(0);
  aj *= ad + ag;

  uint8 bs;
  bs = z[aj.x / 4];

  uint bt = ((1 << 4) - 1);
 uint4 bu = (ubtnt4 bv;

 bv.x = (bs.s0>>r);
 bv.y = (bs.s2>>r);
 bv.z = (bs.s4>>r);
 bv.w = (bs.s6>>r);

 bv = bv & bu;

 uint4 bw;
 bw = ag;
 bw.x = bw.x - bp[bv.x];
 bw.y = bw.y - bp[bv.y];
 bw.z = bw.z - bp[bv.z];
 bw.w = bw.w - bp[bv.w];

 uint4 w = bw;
 w.x = w.x + bq[bv.x];
 w.y = w.y + bq[bv.y];
 w.z = w.z + bq[bv.z];
 w.w = w.w + bq[bv.w];


 bn[w.x] = (KeyValuePair)(bsbn[w.y] = (KeyValuePair)(bsbn[w.z] = (KeyValuePair)(bsbn[w.w] = (KeyValuePair)(bs