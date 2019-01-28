__kernel void A(__global unsigned int* a, __global unsigned int* b, __global unsigned* c) {
  c[0] = a[0] / b[0];
}