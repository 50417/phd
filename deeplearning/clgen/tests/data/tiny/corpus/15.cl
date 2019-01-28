__kernel void A(__global const char* a, __global char* b) {
  int c = get_global_id(0);
  b[c] = a[c] + 1;
}
__kernel void B(__global const char* a, __global char* b) {
  int c = get_global_id(0);
  b[c] = a[c] - 1;
}