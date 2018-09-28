__kernel void fn_A(__global float* A, const int B, const float C, const ulong D) {
  const int E = get_global_id(0);

  if (E < B) {
    ulong F = D + E;
    F = (F * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);
    uint G = F >> 16;
    for (int H = 0; H < 6; ++H) {
      F = G;
      F = (F * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);
      G = F >> 16;
    }
    float I = (float)G / (float)4294967295;

    if (I > C)
      A[E] = 0.0F;
    else
      A[E] /= C;
  }
}