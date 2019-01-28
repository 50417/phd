__kernel void A(__global uchar4* a, __global float* b, int c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = max(f - 1, 0);
  int i = min(f + 1, d - 1);
  int j = max(g - 1, 0);
  int k = min(g + 1, d - 1);

  if (f < c && g < d) {
    uchar4 l = a[j * c + h];
    uchar4 m = a[j * c + f];
    uchar4 n = a[j * c + i];
    uchar4 o = a[g * c + h];
    uchar4 p = a[g * c + i];
    uchar4 q = a[k * c + h];
    uchar4 r = a[k * c + f];
    uchar4 s = a[k * c + i];

    float t = (float)l.x * 0.299f + (float)l.y * 0.587f + (float)l.z * 0.114f;
    float u = (float)m.x * 0.299f + (float)m.y * 0.587f + (float)r.z * 0.114f;
    float v = (float)n.x * 0.299f + (float)n.y * 0.587f + (float)n.z * 0.114f;
    float w = (float)o.x * 0.299f + (float)o.y * 0.587f + (float)o.z * 0.114f;
    float x = (float)p.x * 0.299f + (float)p.y * 0.587f + (float)p.z * 0.114f;
    float y = (float)q.x * 0.299f + (float)q.y * 0.587f + (float)q.z * 0.114f;
    float z = (float)r.x * 0.299f + (float)r.y * 0.587f + (float)r.z * 0.114f;
    float aa = (float)s.x * 0.299f + (float)s.y * 0.587f + (float)s.z * 0.114f;

    float ab = __clc_fabs(v - t + aa - y + 2 * (x - w)) + __clc_fabs(y - t + aa - v + 2 * (z - u));

    b[f + c * g] = ab;
  }
}