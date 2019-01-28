__kernel void A(__local float* a, __constant float* b) {
  int c = get_local_id(0);

  while (__invariant(__mod_pow2(c, get_local_size(0)) == get_local_id(0)), __invariant(__implies(__write(a), __mod_pow2(__write_offset_bytes(a), get_local_size(0) * sizeof(float)) / sizeof(float) == get_local_id(0))), c < 1024) {
    a[c] = b[c];
    c += get_local_size(0);
  }
}