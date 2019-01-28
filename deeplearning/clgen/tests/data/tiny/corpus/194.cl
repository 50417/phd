__kernel void A(__global uint* a) {
  uint b = 0x123456;
  uint c = 0x112233;
  uint d = 0x111111;

  a[0] = mad24(b, c, d);
  a[1] = (mul_hi((b), (c)) + (d));
}