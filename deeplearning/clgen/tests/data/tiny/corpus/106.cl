kernel void A(global int* a, global int* b, global int* c) {
  int d = get_global_id(0);
  c[d] = mul_hi(a[d], b[d]);
}