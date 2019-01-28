__kernel void A(__global int* a, __global int* b, __global int* c, int d) {
  int e = 128 * get_global_id(0) + get_global_id(1);

  int f = 0;
  if (e < d) {
    for (int g = 0; g < d; g++) {
      f = 0;
      for (int h = 0; h < d; h++) {
        f = f + (a[d * e + h] * b[d * h + g]);
      }
      c[d * e + g] = f;
    }
  }
}