__kernel void A(__global uchar16* a) {
  uint4 b = (global uint4)(0x00010203, 0x04050607, 0x08090A0B, 0x0C0D0E0F);
  uchar* c = &b;
  *a = (uchar16)(*c, *(c + 1), *(c + 2), *(c + 3), *(c + 4), *(c + 5), *(c + 6), *(c + 7), *(c + 8), *(c + 9), *(c + 10), *(c + 11), *(c + 12), *(c + 13), *(c + 14), *(c + 15));
}