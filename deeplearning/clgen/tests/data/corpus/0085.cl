__kernel void fn_A() {
  float A;
  A = 0x1.fffffep127f;
  A = __builtin_huge_valf();
  A = __builtin_huge_val();
  A = __builtin_inff();
  A = __builtin_nanf("");
  A = 0x1.5bf0a8p+1f;
  A = 0x1.715476p+0f;
  A = 0x1.bcb7b2p-2f;
  A = 0x1.62e430p-1f;
  A = 0x1.26bb1cp+1f;
  A = 0x1.921fb6p+1f;
  A = 0x1.921fb6p+0f;
  A = 0x1.921fb6p-1f;
  A = 0x1.45f306p-2f;
  A = 0x1.45f306p-1f;
  A = 0x1.20dd76p+0f;
  A = 0x1.6a09e6p+0f;
  A = 0x1.6a09e6p-1f;
}