kernel void A(global int* a, global int* b) {
  int c = get_global_id(0);
  int d = get_local_id(0);
  int e = get_group_id(0);
  atomic_add(b, c);
  barrier(2);
  if (d == 0) {
    a[e] = *b;
  }
}