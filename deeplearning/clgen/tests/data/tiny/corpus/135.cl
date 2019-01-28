__kernel void A(__global float* a, __global float* b, __global float* c, float d, int e) {
  size_t f = get_global_id(0) * e;
  size_t g = f + e;
  for (; f < g; f++)
    c[f] = a[f] * d + b[f];
}

__kernel void B(__global float* a, __global float* b, __global float* c, float d) {
  size_t f = get_global_id(0) * 4;
    float4 h = (float4)(a[f a[f], a[f], a[f]);
    float4 i = (float4)(b[f b[f], b[f], b[f]);
    float4 j = h * d + i;

    c[f] = j.x;
    c[f + 1] = j.y;
    c[f + 2] = j.z;
    c[f + 3] = j.w;
}

__kernel void C(__global float* a, __global float* b, __global float* c, float d) {
  size_t f = get_global_id(0) * 8;
    float8 h = (float8)(a[f a[f], a[f], a[f], a[f], a[f], a[f], a[f]);
    float8 i = (float8)(b[f b[f], b[f], b[f], b[f], b[f], b[f], b[f]);
    float8 j = h * d + i;

    c[f] = j.s0;
    c[f + 1] = j.s1;
    c[f + 2] = j.s2;
    c[f + 3] = j.s3;
    c[f + 4] = j.s4;
    c[f + 5] = j.s5;
    c[f + 6] = j.s6;
    c[f + 7] = j.s7;
}

__kernel void D(__global float* a, __global float* b, __global float* c, float d) {
  size_t f = get_global_id(0) * 16;
    float16 h = (float16)(a[f a[f], a[f], a[f], a[f], a[f], a[f], a[f], a[f], a[f], a[f0], a[f1], a[f2], a[f3], a[f4], a[f5]);

    float16 i = (float16)(b[f b[f], b[f], b[f], b[f], b[f], b[f], b[f], b[f], b[f], b[f0], b[f1], b[f2], b[f3], b[f4], b[f5]);

    float16 j = h * d + i;

    c[f] = j.s0;
    c[f + 1] = j.s1;
    c[f + 2] = j.s2;
    c[f + 3] = j.s3;
    c[f + 4] = j.s4;
    c[f + 5] = j.s5;
    c[f + 6] = j.s6;
    c[f + 7] = j.s7;
    c[f + 8] = j.s8;
    c[f + 9] = j.s9;
    c[f + 10] = j.sa;
    c[f + 11] = j.sb;
    c[f + 12] = j.sc;
    c[f + 13] = j.sd;
    c[f + 14] = j.se;
    c[f + 15] = j.sf;
}