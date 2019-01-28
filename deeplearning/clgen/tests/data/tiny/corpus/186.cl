kernel void A(global float* a, global float* b, global float* c, global float* d, local float* e) {
  global float* f[] = {b, c, d};

  uint g = get_local_size(0);

  uint h = get_global_id(0);
  uint i = get_local_id(0);
  uint j = get_group_id(0);

  vstore3(vload3(h, a), i, e);
  barrier(1);

  uint k = 3 * g - 1;
  uint l = (9 * i) % k;

  float3 m ll
};

uchar n = (3 * i) / g;
global float* o = f[n];

vstore3(m, i % (g / 3), &o[j * g]);
}
kernel void B(global uchar* a, global float* b, global float* c, global float* d, local uchar* e) {
  global float* f[] = {b, c, d};

  uint g = get_local_size(0);

  uint h = get_global_id(0);
  uint i = get_local_id(0);
  uint j = get_group_id(0);

  vstore3(vload3(h, a), i, e);
  barrier(1);

  uint k = 3 * g - 1;
  uint l = (9 * i) % k;

  float3 m ll
};

m /= 255.f;

uchar n = (3 * i) / g;
global float* o = f[n];

vstore3(m, i % (g / 3), &o[j * g]);
}
kernel void C(global float* b, global float* c, global float* d, global float* a, local float* e) {
  global float* f[] = {b, c, d};

  uint g = get_local_size(0);

  uint h = get_global_id(0);
  uint i = get_local_id(0);
  uint j = get_group_id(0);

  uchar n = (3 * i) / g;
  uint p = i % (g / 3);
  global float* o = f[n];
  vstore3(vload3(p, &o[j * g]), p, &e[n * g]);
  barrier(1);

  float3 q = {i, i, e * i};

  vstore3(q, h, a);
}
kernel void D(global float* b, global float* c, global float* d, global uchar* a, local float* e) {
  global float* f[] = {b, c, d};

  uint g = get_local_size(0);

  uint h = get_global_id(0);
  uint i = get_local_id(0);
  uint j = get_group_id(0);

  uchar n = (3 * i) / g;
  uint p = i % (g / 3);
  global float* o = f[n];
  vstore3(vload3(p, &o[j * g]), p, &e[n * g]);
  barrier(1);

  float3 m = {i, i, e * i};

  m *= 255.f;

  uchar3 q = convert_uchar3(m);

  vstore3(q, h, a);
}
kernel void E(global ushort4* r, global float4* s, float t) {
  uint h = get_global_id(0);

  s[h] = convert_float4(r[h]) * t;
}
kernel void F(global float* r, global float4* u, float v, float t) {
  uint w = get_global_size(0);
  uint x = get_global_size(1);

  uint h = get_global_id(0);
  uint y = get_global_id(1);

  uint z = y * w + h;

  float aa = r[z] * t;
  float4 ab = {(h - (w1) / 2.f) * aaa / v, (y - (x1) / 2.f) * aaa / v, aaa, 1.f};

  u[z] = ab;
}
kernel void G(global float* ac, global float* ad) {
  uint h = get_global_id(0);

  float3 q = vload3(h, ac);
  float ae = dot(q, 1.f);
  float af = ((isequal(ae, 0.f)) ? (0.f) : (native_recip(ae)));

  q *= af;
  vstore3(q, h, ad);
}
kernel void H(global float* r, global float* b, global float* c, global float* d, global float8* ag, local float* e, uint w, float v, float t, int ah) {
  global float* f[] = {b, c, d};

  uint x = get_global_size(0) / w;
  uint g = get_local_size(0);

  uint h = get_global_id(0);
  uint i = get_local_id(0);
  uint j = get_group_id(0);

  uchar n = (3 * i) / g;
  uint p = i % (g / 3);
  global float* o = f[n];
  vstore3(vload3(p, &o[j * g]), p, &e[n * g]);
  barrier(1);

    float3 q = (float3) i,i, e* i);

    if (ah) {
      float ae = dot(q, 1.f);
      float af = ((isequal(ae, 0.f)) ? (0.f) : (native_recip(ae)));
      q *= af;
    }

    float4 ai = (float4)(qf);

    uint aj = get_global_id(0) % w;
    uint ak = get_global_id(0) / w;

    float aa = r[h] * t;
    float4 al = {(ajj - (w1) / 2.f) * aaa / v, (akk - (x1) / 2.f) * aaa / v, aaa, 1.f};

    float8 ab = (float8)ai ag[h] = ab;
}
kernel void I(global float8* am, global float4* an, global float4* ao, unsigned int ap) {
  uint h = get_global_id(0);

  float8 ab = am[h];
  size_t aq = ap + h;
  an[aq] = ab.lo;
  ao[aq] = ab.hi;
}