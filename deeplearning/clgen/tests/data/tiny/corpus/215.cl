__constant float4 a = (float4)(0, 0, -10, 0); __kernel void A(int b, __global float4* c, __global float* d, __global int* e, __global int* f, __global float2* g, __global float4* h) {
  int i = get_global_id(0);
  int j = i * b;

  float k = d[i];
  if (k > 1e-5f) {
    h[i] = a / k;
  }
  for (int l = 0; l < e[i]; ++l) {
    int m = f[j + l];

    float n = distance(c[m], c[i]);

    if (n < 1e-5f)
      continue;

    float4 o = (c[m] - c[i]) / n;

    h[i] += o * g[j + l].y * (n - g[j + l].x);
  }
}

__kernel void B(float p, __global float* q, __global float4* r, __global float4* s, __global float4* t) {
  int u = get_global_id(0);
  t[u] = r[u] + p * s[u] * q[u];
}

__kernel void C(float p, __global float4* v, __global float4* r, __global float4* w) {
  int u = get_global_id(0);

  w[u] = v[u] + p * r[u];

  if ((w[u].z < -w[u].x * 0.3f)) {
    w[u].z = -w[u].x * 0.3f;
    r[u].z = 0.0f;
    r[u] *= 0.5f;
  }
  r[u] *= 0.999f;
}

__kernel void D(__global float4* c, __global int4* x, __global float* y) {
  int z = get_global_id(0);

  y[z] = dot(c[x[z].x], cross(c[x[z].y], c[x[z].z])) / 6.0f;
}

__kernel void E(float aa, int ab, __global float4* c, __global int* ac, __global int2* ad, __global float4* h) {
  int i = get_global_id(0);

  for (int l = 0; l < ac[i]; ++l) {
    int ae = ad[ab * i + l].x;
    int af = ad[ab * i + l].y;

    float4 ag = c[i];
    float4 ah = c[ae];
    float4 ai = c[af];

    float4 aj = cross(ah - ag, ai - ag);
    h[i] += aj * aa * 20000;
  }
}

__kernel void F(int ab, __global float4* c, __global int* ac, __global int2* ad, __global float4* ak) {
  int i = get_global_id(0);

  float4 al = (float4)(0);

  for (int l = 0; l < ac[i]; ++l) {
    int ae = ad[ab * i + l].x;
    int af = ad[ab * i + l].y;

    float4 ag = c[i];
    float4 ah = c[ae];
    float4 ai = c[af];

    float4 aj = cross(ah - ag, ai - ag);
    al += normalize(aj);
  }

  ak[i] = normalize(al);
}