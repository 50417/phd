void A(__local float* a, __global float* a); __kernel void B(const int b, const float c, __local float* d, __global float* e) {
  int f = get_local_size(0);
  int g = get_local_id(0);
  int h = get_group_id(0);

  float i, j = 0.0f;
  int k, l, m;

  l = (h * f + g) * b;
  m = l + b;

  for (k = l; k < m; k++) {
    i = (k + 0.5f) * c;
    j += 4.0f / (1.0f + i * i);
  }

  d[g] = j;
  barrier(1);

  A(d, e);
}
void A(__local float* d, __global float* e) {
  int f = get_local_size(0);
  int g = get_local_id(0);
  int h = get_group_id(0);

  float n;
  int k;

  if (g == 0) {
    n = 0.0f;

    for (k = 0; k < f; k++) {
      n += d[k];
    }

    e[h] = n;
  }
}