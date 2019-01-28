kernel void A(global float* a, int b, float c) {
  if (get_global_id(0) == 0) {
    a[b] = c;
  }
}