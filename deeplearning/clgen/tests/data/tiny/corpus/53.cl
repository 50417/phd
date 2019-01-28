kernel void A(global const double* restrict a, const double b, global double* restrict c) {
  size_t d = get_global_id(0);
  c[d] = 2.0 / (b * a[d]);
}