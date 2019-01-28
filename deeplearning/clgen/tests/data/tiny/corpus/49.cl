__kernel void A(__global int* a) {
  unsigned int b = get_global_id(0);
  a[b] = 1;
}