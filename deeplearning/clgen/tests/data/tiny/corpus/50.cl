__kernel void A(__global int* a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  c[d] = a[d] + b[d];
}

__kernel void B(__global int* a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  c[d] = a[d] - b[d];
}

__kernel void C(__global int* a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  c[d] = a[d] * b[d];
}