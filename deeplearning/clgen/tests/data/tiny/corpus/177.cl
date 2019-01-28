__kernel void A(__global float4* a, int b, __global float4* c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);

  __global float4* g = a + (f + 1) * b + e + 1;
  int h = d * f + e;

    int i[8] = {
        (((-1)+((-1) * (b0)+((-1) * (b1)+((-1) * (b     (((-1)+((0) * (b1)+((0) * (b     (((-1)+((1) * (b0)+((1) * (b1)+((1) * (b};

    float4 j;
    int4 k;
    float4 l;
    float4 m[(8 / 2)];

    for (int n = 0; n < (8 / 2); n++) {
      float4 o = *(g + i[n]);
      float4 p = *(g + i[(8 - (n)-1)]);
      m[n] = (((*g) * (float4)(2.0f) - (o) - (p)) * ((*g) * (float4)(2.0f) - (o) - (p)));
    }

    l = j = *g;
    k = 1;

    for (int q = 0; q < 8; q++) {
      float4 r = *(g + i[q]);
      float4 s = (r + l) * (0.5f);
      int n;
      int4 t = {1, 1, 1, 0};

      for (n = 0; n < (8 / 2); n++) {
        float4 o = *(g + i[n]);
        float4 p = *(g + i[(8 - (n)-1)]);

        float4 u = (((s) * (float4)(2.0f) - (o) - (p)) * ((s) * (float4)(2.0f) - (o) - (p)));

        t = ((u) < (m[n])) & t;
      }
      j += t > 0 ? s : (float4)(0.0);
      k += t > 0 ? 1 : 0;
    }
    c[h] = (j / convert_float4(k));
    c[h].w = l.w;
}
__kernel void B(__global float4* v, int w, __global float4* x) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int y = get_global_size(0);
  x[f * y + e] = v[f * w + e];
}