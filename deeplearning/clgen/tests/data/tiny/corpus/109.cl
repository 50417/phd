__kernel void A(__global int* a, __global int* b) {
  int c[16];
  int d;
  for (d = 0; d < 16; ++d) {
    if (a[0] > 10)
      c[d] = get_local_id(0);
    else
      c[15 - d] = 3 + get_local_id(1);
  }
  b[get_global_id(0)] = c[get_local_id(0)];
}