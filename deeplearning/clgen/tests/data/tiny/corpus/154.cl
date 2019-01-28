kernel void A(global int* a, global int* b) {
  local int c[256];

  a[get_global_id(0)] = b[get_global_id(0)];
  c[get_local_id(0)] = a[get_global_id(0)];
  b[get_global_id(0)] += c[get_local_id(0)];
}