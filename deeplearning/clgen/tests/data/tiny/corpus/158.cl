__kernel void A(__global float* a) {
  sincos(get_global_id(0), a);
}