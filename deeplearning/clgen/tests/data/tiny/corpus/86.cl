__kernel void A(__global float* a, int b, __global float* c, int d, __global float* e, int f, int g, int h, int i, float j, float k) {
  const int l = get_global_id(0);
  const int m = get_global_id(1);

  if (m < g && l < h) {
    int n = 0;
    float o = 0.0;
    for (n = 0; n < i - 16; n += 16) {
      float16 p = vload16(0, a + m * b + n);
      float16 q = vload16(0, c + l * d + n);
      p *= q;
      o += p.s0 + p.s1 + p.s2 + p.s3 + p.s4 + p.s5 + p.s6 + p.s7 + p.s8 + p.s9 + p.sa + p.sb + p.sc + p.sd + p.se + p.sf;
    }
    for (; n < i; n++) {
      o += a[m * b + n] * c[l * d + n];
    }

    float r = (float)(o * j + k);

    if (r > (0x1.fffffep127f * 1e-3)) {
      e[m * f + l] = (0x1.fffffep127f * 1e-3);
    } else {
      e[m * f + l] = r;
    }
  }
}
__kernel void B(__global float* a, int b, __global float* c, int d, __global float* e, int f, int g, int h, int i, float j, float k) {
  const int l = get_global_id(0);
  const int m = get_global_id(1);

  if (m < g && l < h) {
    int n = 0;
    float o = 0.0;
    for (n = 0; n < i - 16; n += 16) {
      float16 p = vload16(0, a + m * b + n);
      float16 q = vload16(0, c + l * d + n);
      p *= q;
      o += p.s0 + p.s1 + p.s2 + p.s3 + p.s4 + p.s5 + p.s6 + p.s7 + p.s8 + p.s9 + p.sa + p.sb + p.sc + p.sd + p.se + p.sf;
    }
    for (; n < i; n++) {
      o += a[m * b + n] * c[l * d + n];
    }
    float s = (float)(o * j + k);
    float t = exp(-__clc_fabs(s));
    float r;
    if (s > 0) {
      r = (float)((1. - t) / (1. + t));
    } else {
      r = (float)((t - 1.) / (t + 1.));
    }

    if (r > (0x1.fffffep127f * 1e-3)) {
      e[m * f + l] = (0x1.fffffep127f * 1e-3);
    } else {
      e[m * f + l] = r;
    }
  }
}
__kernel void C(__global float* a, int b, __global float* c, int d, __global float* e, int f, int g, int h, int i, float j, float k, float u) {
  const int l = get_global_id(0);
  const int m = get_global_id(1);

  if (m < g && l < h) {
    int n = 0;
    float o = 0.0;
    for (n = 0; n < i - 16; n += 16) {
      float16 p = vload16(0, a + m * b + n);
      float16 q = vload16(0, c + l * d + n);
      p *= q;
      o += p.s0 + p.s1 + p.s2 + p.s3 + p.s4 + p.s5 + p.s6 + p.s7 + p.s8 + p.s9 + p.sa + p.sb + p.sc + p.sd + p.se + p.sf;
    }
    for (; n < i; n++) {
      o += a[m * b + n] * c[l * d + n];
    }
    float r = (float)((o * j + k));

    if (r > (0x1.fffffep127f * 1e-3)) {
      e[m * f + l] = (0x1.fffffep127f * 1e-3);
    } else {
      e[m * f + l] = r;
    }
  }
}
__kernel void D(__global float* a, int b, __global float* c, int d, __global float* e, int f, int g, int h, int i, float v) {
  const int l = get_global_id(0);
  const int m = get_global_id(1);

  if (m < g && l < h) {
    int n = 0;
    float o = 0.0;
    for (n = 0; n < i - 16; n += 16) {
      float16 p = vload16(0, a + m * b + n);
      float16 q = vload16(0, c + l * d + n);
      p = (p - q) * (p - q);
      o += p.s0 + p.s1 + p.s2 + p.s3 + p.s4 + p.s5 + p.s6 + p.s7 + p.s8 + p.s9 + p.sa + p.sb + p.sc + p.sd + p.se + p.sf;
    }
    for (; n < i; n++) {
      o += (a[m * b + n] - c[l * d + n]) * (a[m * b + n] - c[l * d + n]);
    }
    float r = (float)(o * v);

    if (r > (0x1.fffffep127f * 1e-3)) {
      e[m * f + l] = (0x1.fffffep127f * 1e-3);
    } else {
      e[m * f + l] = r;
    }
  }
}