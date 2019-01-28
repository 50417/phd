__kernel void A(__global float* a, __global float* b, __global float* c, int d, int e, int f, int g, int h, int i) {
  int j = get_global_id(0);
  int k = get_global_id(1);

  int l = (g - 1) / 2;
  int m = (h - 1) / 2;
  int n = (i - 1) / 2;

  int o = 0;
  for (o = 0; o < f; o++) {
    c[j * e * f + k * f + o] = 0;
  }
}