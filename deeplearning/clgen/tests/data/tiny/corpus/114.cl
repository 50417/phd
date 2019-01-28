kernel void A(global ulong* a, global ulong* b) {
  int c = get_global_id(0);
  if (c > 7)
    b[c] = a[c] >> c;
  else
    b[c] = a[c] + 1;
}