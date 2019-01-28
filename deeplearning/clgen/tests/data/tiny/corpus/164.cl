__kernel void A(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);

  int e = d;

  while (e < 1024) {
    a[e] = get_local_id(0);
    b[10 + e] = get_local_id(0);
    int f = e + 20;
    c[f] = get_local_id(0);
    e = e + 256;
  }
}