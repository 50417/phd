__kernel void A(__local int* a) {
  for (unsigned b = 0; b < (1 << 16); b += 128) {
    __assert((b % 128) == 0);
    for (unsigned c = 0; c < (1 << 16); c += 16) {
      __assert((c % 16) == 0);
      for (unsigned d = 3; d < (1 << 16); d += 32) {
        __assert((d % 32) == 3);
      }
    }
  }
}