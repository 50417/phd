float4 A(unsigned int a) {
  float4 b;
  b.x = a & 0xff;
  b.y = (a >> 8) & 0xff;
  b.z = (a >> 16) & 0xff;
  b.w = (a >> 24) & 0xff;
  return b;
}

unsigned int B(float4 b, float c) {
  unsigned int d = 0U;
  d |= 0x000000FF & (unsigned int)(b.x * c);
  d |= 0x0000FF00 & (((unsigned int)(b.y * c)) << 8);
  d |= 0x00FF0000 & (((unsigned int)(b.z * c)) << 16);
  d |= 0xFF000000 & (((unsigned int)(b.w * c)) << 24);
  return d;
}
__kernel void C(__global unsigned int* e, __global unsigned int* f, unsigned int g, unsigned int h, int i, float c) {
  size_t j = get_global_id(0);
  e = &e[j];
  f = &f[j];

  float4 k;
  k = A(e[0]) * (float4)(i);
  for (int l = 0; l < i + 1; l++) {
    k += A(e[l * g]);
  }
  f[0] = B(k, c);
  for (int l = 1; l < i + 1; l++) {
    k += A(e[(l + i) * g]);
    k -= A(e[0]);
    f[l * g] = B(k, c);
  }

  for (int l = i + 1; l < h - i; l++) {
    k += A(e[(l + i) * g]);
    k -= A(e[((l - i) * g) - g]);
    f[l * g] = B(k, c);
  }

  for (int l = h - i; l < h; l++) {
    k += A(e[(h - 1) * g]);
    k -= A(e[((l - i) * g) - g]);
    f[l * g] = B(k, c);
  }
}