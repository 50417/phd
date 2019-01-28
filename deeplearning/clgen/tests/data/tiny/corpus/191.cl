kernel void A(global int* a, global int* b, global int* c) {
  size_t d = get_global_id(0);
  c[d] = a[d] * b[d];
}