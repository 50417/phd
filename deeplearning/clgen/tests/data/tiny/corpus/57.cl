__kernel void A(__global int* a) {
  int b = 1;
  a[0] = b;
}