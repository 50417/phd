kernel void A(global float* a, global float* b, global int* c) {
  a[0] = __builtin_nanf("");
  __builtin_memcpy(a, b, 32);
  a[0] = __builtin_frexpf(b[0], c);
}