__kernel void A(const __global float* a, __constant float* b, __global float* c, const int d, const int e) {
  const int f = get_global_size(0);

  const int g = get_global_id(0);
  const int h = get_global_id(1);

  float i = 0;
  for (int j = 0; j < e; j++)
    for (int k = 0; k < e; k++)
      i += b[j * e + k] * a[h * d + g + k];
  c[h * f + g] = i;
}