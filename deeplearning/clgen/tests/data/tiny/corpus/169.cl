kernel void A(local int* a) {
  __assert(get_local_size(0) > 0);
  __assert(get_local_size(0) <= 1024);
  __assert(get_global_size(0) % get_local_size(0) == 0);
}