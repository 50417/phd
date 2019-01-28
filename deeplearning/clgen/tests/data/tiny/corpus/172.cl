__kernel void A(__local float* a) {
  a[get_local_id(0) ? 2 * get_local_id(0) : 1] = 2.4f;
}