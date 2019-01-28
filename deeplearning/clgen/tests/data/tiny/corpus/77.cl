kernel void A(global long* a, global long* b, global long* c) {
  int d = get_global_id(0);
  if (d < 3)
    c[d] = a[d] + b[d];
  else
    c[d] = a[d] * b[d];
}