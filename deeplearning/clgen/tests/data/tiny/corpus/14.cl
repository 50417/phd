__kernel void A(__global int* a, __global int* b) {
  int c = get_global_id(0);
  b[c] = a[c];
}