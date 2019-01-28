__kernel void A(__global uint* a, __global uint* b) {
  __gen_ocl_force_simd16();
  int c = (int)get_global_id(0);
  const int d = a[c];
  b[c] = __gen_ocl_region(0, 16, 8, 2, d);
}