kernel void A(local int* a, local int* b, int c) {
  local int* d;
  int e = get_local_id(0);
  if (c)
    d = b + 3;
  else
    d = a + 12;
  a[e] = atomic_add(d, 1);
}