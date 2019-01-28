__kernel void A(__global float* a, __global float* b, __global float* c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);

  if ((e < d) && (f < d)) {
    float g = 0;
    for (int h = 0; h < d; h++)
      for (int i = 0; i < 100000; i++)
        g += a[e * d + h] * b[h * d + f];

    c[e * d + f] = g;
  }
}

__kernel void B(__global int* a, __global int* b, __global int* c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);

  if ((e < d) && (f < d)) {
    int g = 0;
    for (int h = 0; h < d; h++)
      for (int i = 0; i < 100000; i++)
        g += a[e * d + h] * b[h * d + f];

    c[e * d + f] = g;
  }
}