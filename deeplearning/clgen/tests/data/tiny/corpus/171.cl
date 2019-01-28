__kernel void A(global int* a) {
  local int b[64];
  b[a[get_global_id(0)]] = get_global_size(0);
}