__kernel void A(__global uint* a, __global uint* b) {
  int c = (int)get_global_id(0);
  const int d = a[c];
  __gen_ocl_obwrite(b + c, d);
}