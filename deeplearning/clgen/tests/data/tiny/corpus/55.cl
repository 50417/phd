__kernel void A(__global int* a, __global int* b, __global int* c) {
  for (int d = 0; d < 16; d++) {
    c[d] = a[d] * b[d];
  }
}