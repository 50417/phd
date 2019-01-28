__kernel void A(__global uint8* a, __global uint8* b) {
  int c = (int)get_global_id(0);
  b[c] = a[c];
}