__kernel void A(__global const float2* a, __global float2* b, int c, int d) {
  int e = get_global_id(0);

  if (e >= c)
    return;

  float2 f = 0;
  float g = (-2 * d * e) * 3.141593f / (float)c;

  for (int h = 0; h < c; h++) {
    float2 i = a[h];

    float j;
    float k = sincos(h * g, &j);

  f += (float2)(
   dot(iloat2)(j, -k)),
   dot(iloat2)(k, j))
  );
  }

  if (d == 1) {
    b[e] = f;
  } else {
    b[e] = f / (float)c;
  }
}