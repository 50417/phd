__kernel void A(__global int* a, const __global int* b, const __global int* c, const unsigned int d) {
  unsigned int e = get_global_id(0);
  if (e >= d)
    return;
  a[e] = b[e] + c[e];
}