__kernel void A(__global int* a, __global int* b, int c) {
  int d = get_global_id(0);
  if (d < c) {
    if (a[d] < -1)
      a[d] = -(a[d] + 2);
    b[d] = a[d] == -1 ? 0 : 1;
  }
}

__kernel void B(__global int* a, __global int* b, __global int* e, int c) {
  int d = get_global_id(0);
  if (d < c) {
    if (a[d] != -1)
      e[b[d]] = d;
  }
}