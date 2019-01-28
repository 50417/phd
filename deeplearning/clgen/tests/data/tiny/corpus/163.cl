__kernel void A(__local int* a, int b) {
  __requires(b >= 0 & b > get_local_size(0) & b < 1000000);

  __assume(get_local_id(0) < 10);

  a[get_local_id(0)] = a[get_local_id(0)] + a[get_local_id(0) + b];
}