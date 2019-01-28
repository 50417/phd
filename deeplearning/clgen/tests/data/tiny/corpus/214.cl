__kernel void A(const float a, const float b, const float c, const float d, const unsigned int e, __global unsigned int* f) {
  int g = get_global_id(0);
  int h = get_global_id(0);
  if ((g < e) && (h < e)) {
    int i = 0;
    float j = a + g * c;
    float k = b + h * d;
    float l = 0, m = 0;
    float n = 0, o = 0;

    while ((i < e) && ((n + o) < 4)) {
      l = n - o + j;
      m = 2 * l * m + k;
      n = l * l;
      o = m * m;
      i++;
    }
    f[g * e + h] = i;
  }
}