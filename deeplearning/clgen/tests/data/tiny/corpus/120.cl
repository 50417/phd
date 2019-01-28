kernel void A(global float* a, global float* b, global float* c) {
  const int d = get_global_id(0);
  c[d] = c[d] + 7;
  b[d] = a[d] + 5;
  if (d == 2) {
    b[d] = 26;
    c[d] = 34;
  }
}