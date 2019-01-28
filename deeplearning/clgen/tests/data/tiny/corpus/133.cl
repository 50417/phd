void A(__private uint4* a, int b); void B(__private uint4* a); void C(__private uint4* a); void D(__private uint4* a, int b, int c, const __constant uint4* d, int e); __kernel void E(__global uint4* f, const __global uint4* d) {
  __private uint4 a[32];
  f += get_global_id(0) * 32;

  for (uint g = 0; g < 32; g++)
    a[g] = f[g] ^ d[g];

  for (uint h = 1; h < 10; h++) {
    A(a, 0);
    A(a, 8);
    A(a, 16);
    A(a, 24);
    C(a);
    B(a);
    for (uint g = 0; g < 32; g++)
      a[g] ^= d[h * 32 + g];
  }

  A(a, 0);
  A(a, 8);
  A(a, 16);
  A(a, 24);
  C(a);
  for (uint g = 0; g < 32; g++)
    f[g] = a[g] ^ d[320 + g];
}

__kernel void F(__global uint4* a, __local uint4* i) {
  const uint4 j = (uint4)(1);
  size_t c = get_local_id(0);
  uint4 k = (uint4)(0), l;
  i += c & 0xFFFFFFE0;
  a += get_global_id(0) & 0xFFFFFFE0;

  c &= 0x1F;
  i[c] = a[c];
  barrier(1);

  l = (uint4)(c);
  for (int g = 0; g < 32; g++)
    k |= ((i[g] >> l) & j) << (uint4)(g);
  a[c] = k;
}

__kernel void G(__constant uchar* m, __global uint4* n) {
  size_t o = get_global_id(0);
  int p = o >> 5;
  int q = (p << 7) + (o & 0x1F);
  int r = q >> 3;
  int s = q & 7;

  n[o] = (urnt4)(((m s)&1) == 0 ? 0 : 0xffffffff, r((m s)&1) == 0 ? 0 : 0xffffffff, r((m s)&1) == 0 ? 0 : 0xffffffff, r((m > s) & 1) == 0 ? 0 : 0xffffffff);
}

void A(__private uint4* a, int b) {
  uint4 t, u, v, w, x, y, z, aa;
  uint4 ab, ac, ad, ae, af, ag, ah, ai;
  uint4 aj, ak, al, am, an, ao, ap, aq, ar, as, at, au, av, aw, ax;

  ab = a[b + 0];
  ac = a[b + 1];
  ad = a[b + 2];
  ae = a[b + 3];
  af = a[b + 4];
  ag = a[b + 5];
  ah = a[b + 6];
  ai = a[b + 7];

  aa = ag ^ ai;
  w = ac ^ ad;
  z = w ^ ae;
  t = ac ^ ah;
  u = t ^ af;
  t ^= ab;
  v = z ^ af ^ ai;
  w ^= ah ^ ai;
  x = z ^ aa;
  y = ad ^ ae ^ aa;
  z ^= af ^ ah ^ ai;

  ab = t ^ x;
  ac = u ^ y;
  ad = v ^ z;
  ae = w ^ aa;

  af = x ^ y ^ aa;
  ag = y ^ z;
  ah = z ^ aa;
  ai = af ^ ah;
  af = ah;
  ah = ag ^ aa ^ ai;
  ag = aa;

  aj = ae & w;
  ak = (ad & v) ^ aj;
  al = aj ^ (ad & w) ^ (ae & v);
  am = ac & u;
  an = (ab & t) ^ am;
  ao = am ^ (ab & u) ^ (ac & t);
  aj = ab ^ ad;
  am = ac ^ ae;
  t ^= v;
  u ^= w;
  ap = am & u;
  v = (aj & t) ^ ap ^ an;
  w = ap ^ (aj & u) ^ (am & t) ^ ao;
  t = al ^ an;
  u = ak ^ al ^ ao;

  aj = af ^ t;
  ak = ag ^ u;
  al = ah ^ v;
  am = ai ^ w;
  an = aj & am;
  ao = ak & al;
  ap = ak & am;
  aq = al & am;
  ar = aj & ao;
  as = aj & ap;
  at = aj & aq;
  au = ak & aq;
  av = ak ^ al;
  aw = au ^ at;
  ax = an ^ ao;
  af = aj ^ av ^ aw ^ ap ^ as ^ ax ^ ar;
  ag = av ^ am ^ au ^ as ^ (aj & al);
  ah = al ^ aw ^ ax;
  ai = al ^ am ^ au ^ an;

  aj = af ^ ah;
  ak = ag ^ ai;
  al = ai & aa;
  am = (ah & z) ^ al;
  an = al ^ (ah & aa) ^ (ai & z);
  ao = ag & y;
  ap = (af & x) ^ ao;
  aq = ao ^ (af & y) ^ (ag & x);
  al = x ^ z;
  ao = y ^ aa;
  ar = ak & ao;
  x = an ^ ap;
  y = am ^ an ^ aq;
  z = (aj & al) ^ ar ^ ap;
  aa = ar ^ (aj & ao) ^ (ak & al) ^ aq;
  al = ai & ae;
  am = (ah & ad) ^ al;
  an = al ^ (ah & ae) ^ (ai & ad);
  ao = ag & ac;
  ap = (af & ab) ^ ao;
  aq = ao ^ (af & ac) ^ (ag & ab);
  al = ab ^ ad;
  ao = ac ^ ae;
  ar = ak & ao;
  t = an ^ ap;
  u = am ^ an ^ aq;
  v = (aj & al) ^ ar ^ ap;
  w = ar ^ (aj & ao) ^ (ak & al) ^ aq;

  ab = t ^ u ^ v;
  ac = z ^ aa;
  ad = t ^ aa;
  ae = v ^ aa;
  af = x ^ y ^ z;
  a[b + 0] = ~(ab ^ ac);
  a[b + 1] = ~ad;
  a[b + 2] = t ^ v ^ w ^ af;
  a[b + 3] = ab;
  a[b + 4] = ad ^ u ^ x;
  a[b + 5] = ~ae;
  a[b + 6] = ~(af ^ aa);
  a[b + 7] = ae ^ w;
}

void B(__private uint4* ay) {
  uint4 aj, ak, al, am, an, ao, ap, aq;
  uint4 az, ba, bb;
  az = ay[7] ^ ay[8];
  ba = ay[15] ^ ay[16];
  bb = ay[23] ^ ay[24];
  aj = az ^ ba ^ ay[24];
  ak = ay[0] ^ ba ^ bb;
  al = ay[0] ^ ay[8] ^ bb ^ ay[31];
  am = ay[0] ^ az ^ ay[16] ^ ay[31];
  an = ay[0] ^ az ^ ay[9] ^ ay[15] ^ ay[17] ^ ay[25];
  ao = ay[1] ^ ay[8] ^ ba ^ ay[17] ^ ay[23] ^ ay[25];
  ap = ay[1] ^ ay[9] ^ ay[16] ^ bb ^ ay[25] ^ ay[31];
  aq = ay[0] ^ ay[1] ^ ay[7] ^ ay[9] ^ ay[17] ^ ay[24] ^ ay[31];
  ay[0] = aj;
  ay[8] = ak;
  ay[16] = al;
  ay[24] = am;
  aj = ay[1] ^ ay[9] ^ ay[10] ^ ay[18] ^ ay[26];
  ak = ay[2] ^ ay[9] ^ ay[17] ^ ay[18] ^ ay[26];
  al = ay[2] ^ ay[10] ^ ay[17] ^ ay[25] ^ ay[26];
  am = ay[1] ^ ay[2] ^ ay[10] ^ ay[18] ^ ay[25];
  ay[1] = an;
  ay[9] = ao;
  ay[17] = ap;
  ay[25] = aq;
  an = ay[2] ^ ay[7] ^ ay[10] ^ ay[11] ^ ay[15] ^ ay[19] ^ ay[27];
  ao = ay[3] ^ ay[10] ^ ay[15] ^ ay[18] ^ ay[19] ^ ay[23] ^ ay[27];
  ap = ay[3] ^ ay[11] ^ ay[18] ^ ay[23] ^ ay[26] ^ ay[27] ^ ay[31];
  aq = ay[2] ^ ay[3] ^ ay[7] ^ ay[11] ^ ay[19] ^ ay[26] ^ ay[31];
  ay[2] = aj;
  ay[10] = ak;
  ay[18] = al;
  ay[26] = am;
  aj = ay[3] ^ ay[7] ^ ay[11] ^ ay[12] ^ ay[15] ^ ay[20] ^ ay[28];
  ak = ay[4] ^ ay[11] ^ ay[15] ^ ay[19] ^ ay[20] ^ ay[23] ^ ay[28];
  al = ay[4] ^ ay[12] ^ ay[19] ^ ay[23] ^ ay[27] ^ ay[28] ^ ay[31];
  am = ay[3] ^ ay[4] ^ ay[7] ^ ay[12] ^ ay[20] ^ ay[27] ^ ay[31];
  ay[3] = an;
  ay[11] = ao;
  ay[19] = ap;
  ay[27] = aq;
  an = ay[4] ^ ay[12] ^ ay[13] ^ ay[21] ^ ay[29];
  ao = ay[5] ^ ay[12] ^ ay[20] ^ ay[21] ^ ay[29];
  ap = ay[5] ^ ay[13] ^ ay[20] ^ ay[28] ^ ay[29];
  aq = ay[4] ^ ay[5] ^ ay[13] ^ ay[21] ^ ay[28];
  ay[4] = aj;
  ay[12] = ak;
  ay[20] = al;
  ay[28] = am;
  aj = ay[5] ^ ay[13] ^ ay[14] ^ ay[22] ^ ay[30];
  ak = ay[6] ^ ay[13] ^ ay[21] ^ ay[22] ^ ay[30];
  al = ay[6] ^ ay[14] ^ ay[21] ^ ay[29] ^ ay[30];
  am = ay[5] ^ ay[6] ^ ay[14] ^ ay[22] ^ ay[29];
  ay[5] = an;
  ay[13] = ao;
  ay[21] = ap;
  ay[29] = aq;
  an = ay[6] ^ ay[14] ^ ay[15] ^ ay[23] ^ ay[31];
  ao = ay[7] ^ ay[14] ^ ay[22] ^ ay[23] ^ ay[31];
  ap = ay[7] ^ ay[15] ^ ay[22] ^ ay[30] ^ ay[31];
  aq = ay[6] ^ ay[7] ^ ay[15] ^ ay[23] ^ ay[30];
  ay[6] = aj;
  ay[7] = an;
  ay[14] = ak;
  ay[15] = ao;
  ay[22] = al;
  ay[23] = ap;
  ay[30] = am;
  ay[31] = aq;
}

void C(__private uint4* a) {
  for (uint g = 8; g < 16; g++)
    a[g] = a[g].s1230;
  for (uint g = 16; g < 24; g++)
    a[g] = a[g].s2301;
  for (uint g = 24; g < 32; g++)
    a[g] = a[g].s3012;
}