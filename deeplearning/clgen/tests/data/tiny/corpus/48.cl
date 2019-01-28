typedef ushort4 GeglRandom; unsigned int A(__global const int* a, const GeglRandom b, int c, int d, int e, int f); unsigned int B(__global const int* a, const GeglRandom b, int c, int d, int e, int f); int C(__global const int* a, const GeglRandom b, int c, int d, int e, int f, int g, int h); float D(__global const int* a, const GeglRandom b, int c, int d, int e, int f); float E(__global const int* a, const GeglRandom b, int c, int d, int e, int f, float g, float h); unsigned int A(__global const int* a, const GeglRandom b, int c, int d, int e, int f) {
  const long i = 103423;
  const long j = 101359;
  const long k = 101111;

  unsigned long l = c * i + d * j * i + f * k * j * i;

  int m = a[l % b.x], n = a[b.x + (l % b.y)], o = a[b.x + b.y + (l % b.z)];
  return m ^ n ^ o;
}

unsigned int B(__global const int* a, const GeglRandom b, int c, int d, int e, int f) {
  return A(a, b, c, d, e, f);
}

int C(__global const int* a, const GeglRandom b, int c, int d, int e, int f, int g, int h) {
  int p = A(a, b, c, d, e, f);
  return (p % (h - g)) + g;
}

float D(__global const int* a, const GeglRandom b, int c, int d, int e, int f) {
  int q = A(a, b, c, d, e, f);
  return (q & 0xffff) * 0.00001525902189669642175f;
}

float E(__global const int* a, const GeglRandom b, int c, int d, int e, int f, float g, float h) {
  float r = D(a, b, c, d, e, f);
  return r * (h - g) + g;
}